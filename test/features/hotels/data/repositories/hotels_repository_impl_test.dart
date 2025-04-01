import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/error/exceptions.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';
import 'package:invia_hotel_booking/features/hotels/data/repositories/hotels_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/dummy_data.dart';
import '../../../../helpers/mocks.dart';

void main() {
  late MockHotelsRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late HotelsRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockHotelsRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = HotelsRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('HotelsRepositoryImpl', () {
    test('should return hotels from remote when connected', () async {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        () => mockRemoteDataSource.getHotels(),
      ).thenAnswer((_) async => [dummyHotelModel]);

      // act
      final result = await repository.getHotels();

      // assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should not fail'),
        (hotels) => expect(hotels, [dummyHotelModel.toEntity()]),
      );

      verify(() => mockNetworkInfo.isConnected).called(1);
      verify(() => mockRemoteDataSource.getHotels()).called(1);
    });

    test(
      'should cache hotels after first fetch and return cached data on second call',
      () async {
        // arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          () => mockRemoteDataSource.getHotels(),
        ).thenAnswer((_) async => [dummyHotelModel]);

        // act
        final result1 = await repository.getHotels(); // API call
        final result2 = await repository.getHotels(); // Cache call

        // assert
        expect(result1.isRight(), true);
        expect(result2.isRight(), true);

        result1.fold(
          (failure) => fail('Should not fail'),
          (hotels) => expect(hotels, [dummyHotelModel.toEntity()]),
        );

        result2.fold(
          (failure) => fail('Should not fail'),
          (hotels) => expect(hotels, [dummyHotelModel.toEntity()]),
        );

        // Remote call should happen only once
        verify(() => mockNetworkInfo.isConnected).called(1);
        verify(() => mockRemoteDataSource.getHotels()).called(1);
      },
    );

    test(
      'should return ServerFailure when remote throws ServerException',
      () async {
        // arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          () => mockRemoteDataSource.getHotels(),
        ).thenThrow(ServerException(message: 'Error', statusCode: 500));

        // act
        final result = await repository.getHotels();

        // assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (_) => fail('Should not succeed'),
        );

        verify(() => mockNetworkInfo.isConnected).called(1);
        verify(() => mockRemoteDataSource.getHotels()).called(1);
      },
    );

    test('should return NetworkFailure when no internet connection', () async {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // act
      final result = await repository.getHotels();

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<NetworkFailure>()),
        (_) => fail('Should not succeed'),
      );

      verify(() => mockNetworkInfo.isConnected).called(1);
      verifyNever(() => mockRemoteDataSource.getHotels());
    });
  });
}
