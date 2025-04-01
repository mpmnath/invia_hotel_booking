import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';
import 'package:invia_hotel_booking/core/usecases/usecases.dart';
import 'package:invia_hotel_booking/features/favorites/domain/repositories/favorites_repository.dart';

@lazySingleton
class GetFavoritesUsecase implements UseCase<List<Hotel>, NoParams> {
  final FavoritesRepository _repository;

  GetFavoritesUsecase({required FavoritesRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, List<Hotel>>> call(NoParams params) {
    return _repository.getFavorites();
  }
}
