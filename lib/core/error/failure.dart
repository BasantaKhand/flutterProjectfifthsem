
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
    final String message;

    const Failure(this.message);

  @override
  List<Object?> get props =>[message] ;
}

//local database failure subclass
class LocalDatabaseFailure extends Failure {
    const LocalDatabaseFailure({String message = "local database operation failed"}):super(message);
}

//api failure
class ApiFailure extends Failure {
    final int? statusCode;
    const ApiFailure({this.statusCode, required String message}):super(message);

    @override
  List<Object?> get props => [statusCode, message];
}
