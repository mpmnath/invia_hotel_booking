class ApiConstants {
  // Base URLs
  static const String baseUrl = 'https://dkndmolrswy7b.cloudfront.net';

  // Endpoints
  static const String hotelsEndpoint = '/hotels.json';

  // Timeouts
  static const int connectTimeout = 15000; // 15 seconds
  static const int receiveTimeout = 15000; // 15 seconds

  // Status codes
  static const int successCode = 200;
  static const int badRequestCode = 400;
  static const int unauthorizedCode = 401;
  static const int forbiddenCode = 403;
  static const int notFoundCode = 404;
  static const int serverErrorCode = 500;
}
