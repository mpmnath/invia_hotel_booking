import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/features/favorites/domain/repositories/favorites_repository.dart';

@lazySingleton
class StreamFavoritesUsecase {
  final FavoritesRepository _repository;

  StreamFavoritesUsecase({required FavoritesRepository repository})
      : _repository = repository;

  Stream<List<Hotel>> call() {
    return _repository.getFavoritesStream();
  }
}