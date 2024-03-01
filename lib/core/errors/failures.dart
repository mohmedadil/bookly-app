import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connectionTimeout with API Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send Timeout with API Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('ReceiveTimeout  with API Server');
      case DioExceptionType.badCertificate:
      // TODO: Handle this case.
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to API Server was canceld');
      case DioExceptionType.connectionError:
      // TODO: Handle this case.
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('unexpected error , pls try again');
      default: return ServerFailure(' there was an error, please try again ');
    
    }
  }

  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statuscode == 404) {
      return ServerFailure('Your request not found , pls try later');
    } else if (statuscode == 500) {
      return ServerFailure('Internal server error');
    } else {
      return ServerFailure(' there was an error, please try again ');
    }
  }
}
