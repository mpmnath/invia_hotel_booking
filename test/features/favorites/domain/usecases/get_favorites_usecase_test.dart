import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:invia_hotel_booking/core/usecases/usecases.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';
import 'package:invia_hotel_booking/features/favorites/domain/usecases/get_favorites_usecase.dart';

import '../../../../helpers/dummy_data.dart';
import '../../../../helpers/mocks.dart';
import '../../../../helpers/test_helper.dart';

void main() {
  late MockFavoritesRepository mockRepository;
  late GetFavoritesUsecase usecase;

  setUpAll(() {
    registerFallbackValues();
  });

  setUp(() {
    mockRepository = MockFavoritesRepository();
    usecase = GetFavoritesUsecase(repository: mockRepository);
  });

  group('GetFavoritesUsecase', () {
    test('should return list of favorite hotels', () async {
      // arrange
      when(
        () => mockRepository.getFavorites(),
      ).thenAnswer((_) async => Right([dummyHotel]));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, isA<Right<Failure, List<Hotel>>>());
      result.fold(
        (l) => fail('Expected Right but got Left'),
        (r) => expect(r, [dummyHotel]),
      );
      verify(() => mockRepository.getFavorites()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return failure when repository fails', () async {
      // arrange
      when(
        () => mockRepository.getFavorites(),
      ).thenAnswer((_) async => Left(CacheFailure('Cache error')));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, isA<Left<Failure, List<Hotel>>>());
      result.fold(
        (l) => expect(l, isA<CacheFailure>()),
        (r) => fail('Expected Left but got Right'),
      );
      verify(() => mockRepository.getFavorites()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
