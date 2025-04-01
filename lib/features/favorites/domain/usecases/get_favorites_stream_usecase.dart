import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/features/favorites/domain/repositories/favorites_repository.dart';

@lazySingleton
class GetFavoritesStreamUsecase {
  final FavoritesRepository _repository;

  GetFavoritesStreamUsecase({required FavoritesRepository repository})
    : _repository = repository;

  Stream<List<Hotel>> call() {
    return _repository.getFavoritesStream();
  }
}
