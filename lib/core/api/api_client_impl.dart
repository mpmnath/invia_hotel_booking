import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/api/api_client.dart';
import 'package:invia_hotel_booking/core/api/api_constants.dart';
import 'package:invia_hotel_booking/core/api/interceptors/error_interceptor.dart';

@LazySingleton(as: ApiClient)
class ApiClientImpl implements ApiClient {
  final Dio _dio;

  ApiClientImpl() : _dio = Dio() {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: Duration(milliseconds: ApiConstants.connectTimeout),
      receiveTimeout: Duration(milliseconds: ApiConstants.receiveTimeout),
      responseType: ResponseType.json,
    );

    // Add interceptors
    _dio.interceptors.add(ErrorInterceptor());
  }

  @override
  Future<T> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(dynamic data)? convertor,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
      );
      if (convertor != null) {
        return convertor(response.data);
      } else {
        return response.data as T;
      }
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
