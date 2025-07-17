import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failures {
  final String errorMessage;

  Failures(this.errorMessage);
}

class ServerFailure
    extends Failures // ServerFailure extends Failure to handle server-related failures
{
  ServerFailure(super.erroeMessage);
  /*
    🔹 How It Works:
   1- The factory constructor fromDioError takes a DioException as input.
   2- It checks the type of error and returns a corresponding ServerFailure instance with the appropriate message.
   3- If the error is badResponse (like HTTP 404 or 500), it calls another factory constructor fromResponse
  */
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!);
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.unknown:
        return ServerFailure('Unknown Error');
      default:
        return ServerFailure('An error occurred');
    }
  }

  /*
   🔹 How It Works:
   1- The factory constructor fromResponse takes an integer statusCode and a Response object as input.
   2- If the server responds with 400, 401, or 403, it extracts the error message from the response.
   3- If the status code is 404, it returns ServerFailure('Your request could not be found please try again'
   4- If the status code is 500, it returns ServerFailure('Internal Server Error, please try again later
   5- Otherwise, it returns a generic error message.
   */
  factory ServerFailure.fromResponse(int statusCode, Response response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response.data['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request could not be found please try again');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, please try again later');
    } else {
      return ServerFailure('An error occurred');
    }
  }

   factory ServerFailure.fromAuth(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return ServerFailure('The email address is not valid.');
      case 'user-disabled':
        return ServerFailure('This user has been disabled.');
      case 'user-not-found':
        return ServerFailure('No user found with this email.');
      case 'wrong-password':
        return ServerFailure('Incorrect password.');
      case 'email-already-in-use':
        return ServerFailure('The email is already in use.');
      case 'weak-password':
        return ServerFailure('The password is too weak.');
      case 'operation-not-allowed':
        return ServerFailure('This operation is not allowed.');
      default:
        return ServerFailure(error.message ?? 'Authentication error occurred.');
    }
}
}