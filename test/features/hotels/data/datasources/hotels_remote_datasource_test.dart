import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/data/models/hotel_model.dart';
import 'package:invia_hotel_booking/core/error/exceptions.dart';
import 'package:invia_hotel_booking/features/hotels/data/datasources/hotels_remote_datasource.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/dummy_data.dart';
import '../../../../helpers/mocks.dart';

void main() {
  late MockApiClient mockApiClient;
  late HotelsRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = HotelsRemoteDataSourceImpl(apiClient: mockApiClient);
  });

  group('HotelsRemoteDataSource', () {
    test('should return List<HotelModel> when response is valid', () async {
      // arrange
      when(() => mockApiClient.get(any())).thenAnswer(
        (_) async => {
          'hotels': [rawHotelData],
        },
      );

      // act
      final result = await dataSource.getHotels();

      // assert
      expect(result, isA<List<HotelModel>>());
      expect(result.length, 1);
      expect(result.first.hotelId, dummyHotelModel.hotelId);

      verify(() => mockApiClient.get(any())).called(1);
    });

    test('should return empty list when hotels is empty', () async {
      // arrange
      when(
        () => mockApiClient.get(any()),
      ).thenAnswer((_) async => {'hotels': []});

      // act
      final result = await dataSource.getHotels();

      // assert
      expect(result, isEmpty);
      verify(() => mockApiClient.get(any())).called(1);
    });

    test(
      'should throw ServerException when response format is invalid',
      () async {
        // arrange
        when(
          () => mockApiClient.get(any()),
        ).thenAnswer((_) async => {'invalid_key': []});

        // act
        final call = dataSource.getHotels;

        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
        verify(() => mockApiClient.get(any())).called(1);
      },
    );

    test('should throw ServerException when API client throws error', () async {
      // arrange
      when(
        () => mockApiClient.get(any()),
      ).thenThrow(Exception('Network error'));

      // act
      final call = dataSource.getHotels;

      // assert
      expect(() => call(), throwsA(isA<ServerException>()));
      verify(() => mockApiClient.get(any())).called(1);
    });
  });
}
