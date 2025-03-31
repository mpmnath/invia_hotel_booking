import 'package:dartz/dartz.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';
import 'package:invia_hotel_booking/features/hotels/domain/entities/hotel.dart';

abstract class HotelsRepository {
  /// Fetches a list of hotels from the API or cache
  ///
  /// Returns a [List<Hotel>] if successful, or a [Failure] if an error occurs
  /// If [forceRefresh] is true, it will force a new API request instead of using cache
  Future<Either<Failure, List<Hotel>>> getHotels();
}
