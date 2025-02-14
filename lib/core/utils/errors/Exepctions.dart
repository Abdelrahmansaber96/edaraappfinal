import 'package:dio/dio.dart';

class ServerException implements Exception {
  final dynamic errMessage;

  ServerException({required this.errMessage});
}

void handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errMessage: e.response!.data);
    case DioExceptionType.sendTimeout:
      throw ServerException(errMessage: e.response!.data);
    case DioExceptionType.receiveTimeout:
      throw ServerException(errMessage: e.response!.data);
    case DioExceptionType.badCertificate:
      throw ServerException(errMessage: e.response!.data);
    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400:
          throw ServerException(errMessage: e.response!.data);
        case 401:
          throw ServerException(errMessage: e.response!.data);
        case 403:
          throw ServerException(errMessage: e.response!.data);
        case 404:
          throw ServerException(errMessage: e.response!.data);
        case 409:
          throw ServerException(errMessage: e.response!.data);
        case 422:
          throw ServerException(errMessage: e.response!.data);
        case 504:
          throw ServerException(errMessage: e.response!.data);
      }
    case DioExceptionType.cancel:
      throw ServerException(errMessage: e.response!.data);
    case DioExceptionType.connectionError:
      throw ServerException(errMessage: e.response!.data);
    case DioExceptionType.unknown:
      throw ServerException(errMessage: e.response!.data);
  }
}
