import 'package:dartz/dartz.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';


abstract class FavoritesRepository {
  /// Fetches a list of favorite hotels from the API or cache
  ///
  /// Returns a [List<Hotel>] if successful, or a [Failure] if an error occurs
  Future<Either<Failure, List<Hotel>>> getFavorites();

  /// Toggles a hotel to the favorites list
  ///
  /// Returns true if successful, or a [Failure] if an error occurs
  Future<Either<Failure, bool>> toggleFavorites(Hotel hotel);

  Stream<List<Hotel>> getFavoritesStream();
}