import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/api/api_client.dart';
import 'package:invia_hotel_booking/core/api/api_constants.dart';
import 'package:invia_hotel_booking/core/error/exceptions.dart';
import 'package:invia_hotel_booking/core/data/models/hotel_model.dart';

abstract class HotelsRemoteDataSource {
  /// Fetches a list of hotels from the API
  ///
  /// Returns a [List<HotelModel>] if successful, or throws an exception if an error occurs
  Future<List<HotelModel>> getHotels();
}

@LazySingleton(as: HotelsRemoteDataSource)
class HotelsRemoteDataSourceImpl implements HotelsRemoteDataSource {
  final ApiClient _apiClient;

  HotelsRemoteDataSourceImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<List<HotelModel>> getHotels() async {
    try {
      final response = await _apiClient.get(
        ApiConstants.baseUrlWithHotelsEndpoint,
      );

      if (response['hotels'] is List) {
        final hotelsList = response['hotels'] as List;
        if (hotelsList.isEmpty) {
          return [];
        }

        // Ensure elements are raw Map (not already parsed models)
        if (hotelsList.any((e) => e is! Map<String, dynamic>)) {
          throw ServerException(message: 'Invalid hotel data structure');
        }
        
        // Parse in a background isolate
        final List<HotelModel> results = await compute(
          parseHotelsList,
          hotelsList,
        );

        return results;
      } else {
        throw ServerException(message: 'Invalid response format');
      }
    } catch (e) {
      throw ServerException(
        message: 'Failed to fetch hotels: ${e.toString()}',
        statusCode: e is ServerException ? e.statusCode : null,
      );
    }
  }
}

/// Helper function to parse hotels in background isolate
List<HotelModel> parseHotelsList(List<dynamic> hotelsJson) {
  return hotelsJson
      .map(
        (hotelJson) =>
            HotelModel.fromJson(Map<String, dynamic>.from(hotelJson)),
      )
      .toList();
}
