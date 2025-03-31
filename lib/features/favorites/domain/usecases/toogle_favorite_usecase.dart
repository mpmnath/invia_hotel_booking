import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';
import 'package:invia_hotel_booking/core/usecases/usecases.dart';
import 'package:invia_hotel_booking/features/favorites/domain/repositories/favorites_repository.dart';

@lazySingleton
class ToggleFavoriteUsecase implements UseCase<bool, Hotel> {
  final FavoritesRepository _repository;

  ToggleFavoriteUsecase({required FavoritesRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Hotel hotel) {
    return _repository.toggleFavorites(hotel);
  }
}
