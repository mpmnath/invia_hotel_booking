import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:invia_hotel_booking/features/favorites/domain/usecases/get_favorites_stream_usecase.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';

import '../../../../helpers/dummy_data.dart';
import '../../../../helpers/mocks.dart';
import '../../../../helpers/test_helper.dart';

void main() {
  late MockFavoritesRepository mockRepository;
  late GetFavoritesStreamUsecase usecase;

  setUpAll(() {
    registerFallbackValues();
  });

  setUp(() {
    mockRepository = MockFavoritesRepository();
    usecase = GetFavoritesStreamUsecase(repository: mockRepository);
  });

  group('GetFavoritesStreamUsecase', () {
    test('should return stream of hotel list from repository', () async {
      // arrange
      when(
        () => mockRepository.getFavoritesStream(),
      ).thenAnswer((_) => Stream.value([dummyHotel]));

      // act
      final result = usecase();

      // assert
      await expectLater(result, emitsInOrder([isA<List<Hotel>>()]));
      verify(() => mockRepository.getFavoritesStream()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
