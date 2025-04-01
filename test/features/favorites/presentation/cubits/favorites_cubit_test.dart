import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/cubits/favorites_cubit.dart';

import '../../../../helpers/dummy_data.dart';
import '../../../../helpers/mocks.dart';


void main() {
  late MockGetFavoritesUsecase mockGetFavoritesUsecase;
  late MockGetFavoritesStreamUsecase mockGetFavoritesStreamUsecase;
  late MockToggleFavoriteUsecase mockToggleFavoriteUsecase;

  setUpAll(() {
    registerFallbackValue(NoParamsFake());
  });

  setUp(() {
    mockGetFavoritesUsecase = MockGetFavoritesUsecase();
    mockGetFavoritesStreamUsecase = MockGetFavoritesStreamUsecase();
    mockToggleFavoriteUsecase = MockToggleFavoriteUsecase();
  });

  group('FavoritesCubit', () {
    blocTest<FavoritesCubit, List<Hotel>>(
      'should emit favorites from getFavoritesUsecase and stream',
      build: () {
        when(
          () => mockGetFavoritesUsecase.call(any()),
        ).thenAnswer((_) async => Right([dummyHotel]));
        when(
          () => mockGetFavoritesStreamUsecase.call(),
        ).thenAnswer((_) => Stream.value([dummyHotel]));

        return FavoritesCubit(
          getFavoritesUsecase: mockGetFavoritesUsecase,
          getFavoritesStreamUsecase: mockGetFavoritesStreamUsecase,
          toggleFavoriteUsecase: mockToggleFavoriteUsecase,
        );
      },
      wait: const Duration(milliseconds: 100),
      expect:
          () => [
            [dummyHotel],
            [dummyHotel],
          ],
      verify: (cubit) {
        verify(() => mockGetFavoritesUsecase.call(any())).called(1);
        verify(() => mockGetFavoritesStreamUsecase.call()).called(1);
      },
    );

    blocTest<FavoritesCubit, List<Hotel>>(
      'toggleFavorite should call usecase',
      build: () {
        when(
          () => mockGetFavoritesUsecase.call(any()),
        ).thenAnswer((_) async => Right([]));
        when(
          () => mockGetFavoritesStreamUsecase.call(),
        ).thenAnswer((_) => const Stream.empty());
        when(
          () => mockToggleFavoriteUsecase.call(dummyHotel),
        ).thenAnswer((_) async => const Right(true));

        return FavoritesCubit(
          getFavoritesUsecase: mockGetFavoritesUsecase,
          getFavoritesStreamUsecase: mockGetFavoritesStreamUsecase,
          toggleFavoriteUsecase: mockToggleFavoriteUsecase,
        );
      },
      act: (cubit) => cubit.toggleFavorite(dummyHotel),
      verify: (_) {
        verify(() => mockToggleFavoriteUsecase.call(dummyHotel)).called(1);
      },
    );

    blocTest<FavoritesCubit, List<Hotel>>(
      'should emit empty list when getFavoritesUsecase fails',
      build: () {
        when(
          () => mockGetFavoritesUsecase.call(any()),
        ).thenAnswer((_) async =>  Left(ServerFailure('error')));
        when(
          () => mockGetFavoritesStreamUsecase.call(),
        ).thenAnswer((_) => Stream.value([dummyHotel]));

        return FavoritesCubit(
          getFavoritesUsecase: mockGetFavoritesUsecase,
          getFavoritesStreamUsecase: mockGetFavoritesStreamUsecase,
          toggleFavoriteUsecase: mockToggleFavoriteUsecase,
        );
      },
      wait: const Duration(milliseconds: 100),
      expect:
          () => [
            [],
            [dummyHotel],
          ],
      verify: (_) {
        verify(() => mockGetFavoritesUsecase.call(any())).called(1);
        verify(() => mockGetFavoritesStreamUsecase.call()).called(1);
      },
    );
  });
}
