import 'package:dartz/dartz.dart';
import 'package:dinesmart_app/core/error/failure.dart';
import 'package:dinesmart_app/core/services/connectivity/network_info.dart';
import 'package:dinesmart_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:dinesmart_app/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:dinesmart_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:dinesmart_app/features/auth/data/models/auth_api_model.dart';
import 'package:dinesmart_app/features/auth/data/models/auth_hive_model.dart';
import 'package:dinesmart_app/features/auth/domain/entities/auth_entity.dart';
import 'package:dinesmart_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider
final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  final authLocalDatasource = ref.read(authLocalDatasourceProvider);
  final authRemoteDatasource = ref.read(authRemoteDatasourceProvider);
  final networkInfo = ref.read(networkInfoProvider);
  return AuthRepository(authLocalDatasource: authLocalDatasource, authRemoteDatasource: authRemoteDatasource, networkInfo: networkInfo);
});




class AuthRepository  implements IAuthRepository {
  final ILocalAuthDatasource _authLocalDatasource;
  final IRemoteAuthDatasource _authRemoteDatasource;
  //to check internet connectivity if needed in future
  final NetworkInfo _networkInfo;

  AuthRepository({
    required ILocalAuthDatasource authLocalDatasource,
    required IRemoteAuthDatasource authRemoteDatasource,
    required NetworkInfo networkInfo,
  }): _authLocalDatasource = authLocalDatasource,
      _authRemoteDatasource = authRemoteDatasource,
      _networkInfo = networkInfo;


  @override
  Future<Either<Failure, bool>> register(AuthEntity entity) async{
    if (await _networkInfo.isConnected){
      try{
        final authmodel = AuthApiModel.fromEntity(entity);
        await _authRemoteDatasource.register(authmodel);   //removed await here to fix unawaited future warning
        return const Right(true);
      }on DioException catch(e){
        return Left(ApiFailure(message: e.response?.data['message'] ?? 'registration failed', statusCode: e.response?.statusCode));
      }catch(e){
        return Left(ApiFailure(message: e.toString()));
      }

    }else{
      try {
      // Check if email already exists
      final existingUser = await _authLocalDatasource.getUserByEmail(entity.email);
      if (existingUser != null) {
        return const Left(
          LocalDatabaseFailure(message: "Email already registered"),
        );
      }

      final authModel = AuthHiveModel.fromEntity(entity);
      await _authLocalDatasource.register(authModel);
      return const Right(true);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
    }
  }

    @override
  Future<Either<Failure, AuthEntity>> login(String email, String password,) async {
    if(await _networkInfo.isConnected){
      try{  
        final authApiModel = await _authRemoteDatasource.login(email, password);
        final entity = authApiModel!.toEntity();
        return Right(entity);
      } on DioException catch(e){
        return Left(ApiFailure(message: e.response?.data['message'] ?? 'Login failed', statusCode: e.response?.statusCode));
      } catch(e){
        return Left(ApiFailure(message: e.toString()));
      }
    }else {
      try {
      final model = await _authLocalDatasource.login(email, password);
      if (model != null) {
        final entity = model.toEntity();
        return Right(entity);
      }
      return const Left(
        LocalDatabaseFailure(message: "Invalid email or password"),
      );
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
    }
  }



    @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final result = await _authLocalDatasource.logout();
      if (result) {
        return const Right(true);
      }
      return const Left(LocalDatabaseFailure(message: "Failed to logout"));
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

}