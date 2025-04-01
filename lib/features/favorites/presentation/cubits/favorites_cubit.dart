import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/usecases/usecases.dart';
import 'package:invia_hotel_booking/features/favorites/domain/usecases/get_favorites_stream_usecase.dart';
import 'package:invia_hotel_booking/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:invia_hotel_booking/features/favorites/domain/usecases/toogle_favorite_usecase.dart';

@singleton
class FavoritesCubit extends Cubit<List<Hotel>> {
  final GetFavoritesUsecase _getFavoritesUsecase;
  final GetFavoritesStreamUsecase _getFavoritesStreamUsecase;
  final ToggleFavoriteUsecase _toggleFavoriteUsecase;
  StreamSubscription<List<Hotel>>? _favoritesSubscription;

  FavoritesCubit({
    required GetFavoritesUsecase getFavoritesUsecase,
    required GetFavoritesStreamUsecase getFavoritesStreamUsecase,
    required ToggleFavoriteUsecase toggleFavoriteUsecase,
  }) : _getFavoritesUsecase = getFavoritesUsecase,
       _getFavoritesStreamUsecase = getFavoritesStreamUsecase,
       _toggleFavoriteUsecase = toggleFavoriteUsecase,
       super([]) {
    _init();
  }

  Future<void> _init() async {
    // Load initial favorites once when the cubit is created
    final initialFavorites = await _getFavoritesUsecase(NoParams());
    emit(initialFavorites.fold((failure) => [], (hotels) => hotels));

    // Start listening to changes for future updates
    _favoritesSubscription = _getFavoritesStreamUsecase().listen((hotels) {
      emit(hotels);
    });
  }

  void toggleFavorite(Hotel hotel) async {
    await _toggleFavoriteUsecase(hotel);
  }

  @override
  Future<void> close() {
    _favoritesSubscription?.cancel();
    return super.close();
  }
}
