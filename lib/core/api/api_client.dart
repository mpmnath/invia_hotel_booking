abstract class ApiClient {
  Future<T> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(dynamic data)? convertor,
  });

  // Skipping POST, PUT, DELETE methods for brevity
}
