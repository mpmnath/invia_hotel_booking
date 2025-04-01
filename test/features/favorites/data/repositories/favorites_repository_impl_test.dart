import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';
import 'package:invia_hotel_booking/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';

import '../../../../helpers/dummy_data.dart';
import '../../../../helpers/mocks.dart';
import '../../../../helpers/test_helper.dart';

void main() {
  late FavoritesRepositoryImpl repository;
  late MockFavoritesLocalDataSource mockLocalDataSource;

  setUpAll(() {
    registerFallbackValues();
  });

  setUp(() {
    mockLocalDataSource = MockFavoritesLocalDataSource();
    repository = FavoritesRepositoryImpl(localDataSource: mockLocalDataSource);
  });

  group('getFavorites', () {
    test('should return list of Hotel entities', () async {
      final model = MockHotelModel();
      when(
        () => mockLocalDataSource.getFavorites(),
      ).thenAnswer((_) async => [model]);
      when(() => model.toEntity()).thenReturn(MockHotel());
      final result = await repository.getFavorites();

      expect(result, isA<Right<Failure, List<Hotel>>>());
      verify(() => mockLocalDataSource.getFavorites()).called(1);
    });
  });

  group('toggleFavorites', () {
    test('should toggle favorite and return result', () async {
      when(
        () => mockLocalDataSource.toggleFavorite(any()),
      ).thenAnswer((_) async => true);

      final result = await repository.toggleFavorites(dummyHotel);

      expect(result, equals(const Right(true)));
      verify(() => mockLocalDataSource.toggleFavorite(any())).called(1);
    });
  });

  group('getFavoritesStream', () {
    test('should return stream of hotel entities', () async {
      final model = MockHotelModel();
      when(
        () => mockLocalDataSource.getFavoritesStream(),
      ).thenAnswer((_) => Stream.value([model]));
      when(() => model.toEntity()).thenReturn(MockHotel());

      final stream = repository.getFavoritesStream();

      await expectLater(stream, emitsInOrder([isA<List<Hotel>>()]));

      verify(() => mockLocalDataSource.getFavoritesStream()).called(1);
    });
  });
}
