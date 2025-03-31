import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/data/models/hotel_model.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';
import 'package:invia_hotel_booking/features/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:invia_hotel_booking/features/favorites/domain/repositories/favorites_repository.dart';

@LazySingleton(as: FavoritesRepository)
class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource _localDataSource;

  FavoritesRepositoryImpl({
    required FavoritesLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<Either<Failure, List<Hotel>>> getFavorites() async {
    final favorites = await _localDataSource.getFavorites();
    return Right(favorites.map((model) => model.toEntity()).toList());
  }

  @override
  Future<Either<Failure, bool>> toggleFavorites(Hotel hotel) async {
    final result = await _localDataSource.toggleFavorite(HotelModel.fromEntity(hotel));
    return Right(result);
  }

  @override
  Stream<List<Hotel>> getFavoritesStream() {
    return _localDataSource.getFavoritesStream().map((event) {
      return event.map((model) => model.toEntity()).toList();
    });
  }
}