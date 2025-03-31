import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/features/favorites/domain/usecases/toogle_favorite_usecase.dart';
import 'package:invia_hotel_booking/features/favorites/domain/usecases/get_favorites_usecase.dart';


@singleton
class FavoritesCubit extends Cubit<List<Hotel>> {
  final GetFavoritesHotelStreamUsecase _getFavoritesHotelStreamUsecase;
  final ToggleFavoriteUsecase _toggleFavoriteUsecase;

  FavoritesCubit({
    required GetFavoritesHotelStreamUsecase getFavoritesHotelStreamUsecase,
    required ToggleFavoriteUsecase toggleFavoriteUsecase,
  }) : _getFavoritesHotelStreamUsecase = getFavoritesHotelStreamUsecase,
       _toggleFavoriteUsecase = toggleFavoriteUsecase,
       super([]) {
    _getFavoritesHotelStreamUsecase().listen((hotels) {
      emit(hotels);
    });
  }

  void toggleFavorite(Hotel hotel) async {
    await _toggleFavoriteUsecase(hotel);
  }
}
