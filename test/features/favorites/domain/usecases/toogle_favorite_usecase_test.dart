import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/features/favorites/domain/usecases/toogle_favorite_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';

import '../../../../helpers/dummy_data.dart';
import '../../../../helpers/mocks.dart';
import '../../../../helpers/test_helper.dart';

void main() {
  late MockFavoritesRepository mockRepository;
  late ToggleFavoriteUsecase usecase;

  setUpAll(() {
    registerFallbackValues();
  });

  setUp(() {
    mockRepository = MockFavoritesRepository();
    usecase = ToggleFavoriteUsecase(repository: mockRepository);
  });

  group('ToggleFavoriteUsecase', () {
    test('should toggle favorite hotel successfully', () async {
      // arrange
      when(
        () => mockRepository.toggleFavorites(dummyHotel),
      ).thenAnswer((_) async => const Right(true));

      // act
      final result = await usecase(dummyHotel);

      // assert
      expect(result, equals(const Right(true)));
      verify(() => mockRepository.toggleFavorites(dummyHotel)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return failure when toggle fails', () async {
      // arrange
      when(() => mockRepository.toggleFavorites(dummyHotel)).thenAnswer(
        (_) async => Left(CacheFailure('Failed to toggle favorite')),
      );

      // act
      final result = await usecase(dummyHotel);

      // assert
      expect(result, isA<Left<Failure, bool>>());
      result.fold(
        (l) => expect(l, isA<CacheFailure>()),
        (r) => fail('Expected Left but got Right'),
      );
      verify(() => mockRepository.toggleFavorites(dummyHotel)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
