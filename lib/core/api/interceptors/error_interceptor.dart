import 'package:dio/dio.dart';
import 'package:invia_hotel_booking/core/api/api_constants.dart';
import 'package:invia_hotel_booking/core/error/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw NetworkException(message: 'Connection timeout');
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        final responseData = err.response?.data;

        String errorMessage = 'Server error';
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('message')) {
          errorMessage = responseData['message'];
        }

        switch (statusCode) {
          case ApiConstants.badRequestCode:
            throw ServerException(
              message: errorMessage,
              statusCode: statusCode,
            );
          case ApiConstants.unauthorizedCode:
            throw ServerException(
              message: 'Unauthorized access',
              statusCode: statusCode,
            );
          case ApiConstants.forbiddenCode:
            throw ServerException(
              message: 'Forbidden access',
              statusCode: statusCode,
            );
          case ApiConstants.notFoundCode:
            throw ServerException(
              message: 'Resource not found',
              statusCode: statusCode,
            );
          case ApiConstants.serverErrorCode:
            throw ServerException(
              message: 'Internal server error',
              statusCode: statusCode,
            );
          default:
            throw ServerException(
              message: errorMessage,
              statusCode: statusCode,
            );
        }
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        if (err.error != null &&
            err.error.toString().contains('SocketException')) {
          throw NetworkException(message: 'No internet connection');
        }
        throw ServerException(
          message: err.error?.toString() ?? 'Unknown error',
        );
      default:
        throw ServerException(
          message: err.error?.toString() ?? 'Unknown error',
        );
    }

    handler.next(err);
  }
}
