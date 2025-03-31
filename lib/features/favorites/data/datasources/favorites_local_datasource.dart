import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/data/models/hotel_model.dart';
import 'package:hive/hive.dart';

abstract class FavoritesLocalDataSource {
  Future<List<HotelModel>> getFavorites();
  Future<bool> toggleFavorite(HotelModel hotel);
  Stream<List<HotelModel>> getFavoritesStream();
}

@LazySingleton(as: FavoritesLocalDataSource)
class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final Box<HotelModel> favoritesBox;
  FavoritesLocalDataSourceImpl(this.favoritesBox);

  @override
  Future<List<HotelModel>> getFavorites() async {
    return favoritesBox.values.toList();
  }

  @override
  Future<bool> toggleFavorite(HotelModel hotel) async {
    final isCurrentlyFavorite = favoritesBox.containsKey(hotel.hotelId);

    if (isCurrentlyFavorite) {
      await favoritesBox.delete(hotel.hotelId);
    } else {
      await favoritesBox.put(hotel.hotelId, hotel);
    }

    return !isCurrentlyFavorite;
  }

  @override
  Stream<List<HotelModel>> getFavoritesStream() {
    return favoritesBox.watch().map((event) {
      return favoritesBox.values.toList();
    });
  }
}
