import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/api/api_client.dart';
import 'package:invia_hotel_booking/core/api/api_constants.dart';
import 'package:invia_hotel_booking/core/error/exceptions.dart';
import 'package:invia_hotel_booking/core/data/models/hotel_model.dart';

abstract class HotelsRemoteDataSource {
  /// Fetches a list of hotels from the API
  ///
  /// Returns a [List<Hotel>] if successful, or throws an exception if an error occurs
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
        // Check if the list is empty
        if (hotelsList.isEmpty) {
          return [];
        }
        final List<HotelModel> results =
            hotelsList.map((hotel) => HotelModel.fromJson(hotel)).toList();
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
