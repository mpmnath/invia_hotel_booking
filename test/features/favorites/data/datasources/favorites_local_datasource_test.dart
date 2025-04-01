import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hive/hive.dart';
import 'package:invia_hotel_booking/core/data/models/hotel_model.dart';
import 'package:invia_hotel_booking/features/favorites/data/datasources/favorites_local_datasource.dart';

import '../../../../helpers/mocks.dart';
import '../../../../helpers/test_helper.dart';


void main() {
  late FavoritesLocalDataSourceImpl dataSource;
  late MockHiveBox<HotelModel> mockBox;

  setUpAll(() {
    registerFallbackValues();
  });

  setUp(() {
    mockBox = MockHiveBox<HotelModel>();
    dataSource = FavoritesLocalDataSourceImpl(mockBox);
  });

  group('getFavorites', () {
    test('should return list of favorite hotels', () async {
      final mockHotelModel = MockHotelModel();
      when(() => mockBox.values).thenReturn([mockHotelModel]);

      final result = await dataSource.getFavorites();

      expect(result, isA<List<HotelModel>>());
      expect(result.length, 1);
      verify(() => mockBox.values).called(1);
    });
  });

  group('toggleFavorite', () {
    test('should add hotel when not present', () async {
      final mockHotel = MockHotelModel();
      when(() => mockHotel.hotelId).thenReturn('1');
      when(() => mockBox.containsKey('1')).thenReturn(false);
      when(() => mockBox.put('1', mockHotel)).thenAnswer((_) async {});

      final result = await dataSource.toggleFavorite(mockHotel);

      expect(result, true);
      verify(() => mockBox.put('1', mockHotel)).called(1);
    });

    test('should remove hotel when already present', () async {
      final mockHotel = MockHotelModel();
      when(() => mockHotel.hotelId).thenReturn('1');
      when(() => mockBox.containsKey('1')).thenReturn(true);
      when(() => mockBox.delete('1')).thenAnswer((_) async {});

      final result = await dataSource.toggleFavorite(mockHotel);

      expect(result, false);
      verify(() => mockBox.delete('1')).called(1);
    });
  });

  group('getFavoritesStream', () {
    test('should return stream of hotel list', () {
      final mockHotelModel = MockHotelModel();
      final streamController = StreamController<BoxEvent>();

      when(() => mockBox.watch()).thenAnswer((_) => streamController.stream);
      when(() => mockBox.values).thenReturn([mockHotelModel]);

      final result = dataSource.getFavoritesStream();

      expectLater(
        result,
        emitsInOrder([
          [mockHotelModel],
        ]),
      );

      streamController.add(BoxEvent('key', 'value', false));
      streamController.close();
    });
  });
}
