import 'package:dinesmart_app/core/api/api_client.dart';
import 'package:dinesmart_app/core/api/api_endpoints.dart';
import 'package:dinesmart_app/core/services/storage/user_session_service.dart';
import 'package:dinesmart_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:dinesmart_app/features/auth/data/models/auth_api_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider
final authRemoteDatasourceProvider = Provider<IRemoteAuthDatasource>((ref){
  final apiClient = ref.read(apiClientProvider);
  final userSessionService = ref.read(userSessionServiceProvider);
  return AuthRemoteDatasource(apiClient: apiClient, userSessionService: userSessionService);
});



class AuthRemoteDatasource implements IRemoteAuthDatasource{
  final ApiClient _apiClient;
  final UserSessionService _userSessionService;

  AuthRemoteDatasource({required ApiClient apiClient, required UserSessionService userSessionService})
  : _apiClient = apiClient, _userSessionService = userSessionService;



  @override
  Future<AuthApiModel?> getUserByEmail(String email) {
    // Since this is a remote datasource, we would typically make an API call to get user by email.
    // However, for this example, we'll return null as we don't have such an endpoint.
    return Future.value(null);
  }

  @override
  Future<AuthApiModel?> login(String email, String password) async {
    final response = await _apiClient.post(
      ApiEndpoints.userLogin,
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.data['success'] == true){
      final data = response.data['data'];
      final loggedInUser = AuthApiModel.fromJson(data);

      // Save user session to SharedPreferences : Pachi app restart vayo vani pani user logged in rahos
      _userSessionService.saveUserSession(
        userId: loggedInUser.authId!,
        email: loggedInUser.email,
        fullName: loggedInUser.fullName,
        username: loggedInUser.username,
        phoneNumber: loggedInUser.phoneNumber,
        profilePicture: loggedInUser.profilePicture,
      );

      return loggedInUser;
    }
    return null;
  }

  @override
  Future<bool> logout() async {
    await _userSessionService.clearSession();
    return true;
  }

  @override
  Future<AuthApiModel?> register(AuthApiModel model) async {
    final response = await _apiClient.post(ApiEndpoints.users, data: model.toJson());
    if (response.data['success'] == 'true'){
      final data = response.data['data'];
      final registeredUser = AuthApiModel.fromJson(data);
      return registeredUser;
    }
    return null;
  }

}