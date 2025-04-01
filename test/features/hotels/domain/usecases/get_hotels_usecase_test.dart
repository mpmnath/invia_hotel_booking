import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';
import 'package:invia_hotel_booking/core/usecases/usecases.dart';
import 'package:invia_hotel_booking/features/hotels/domain/usecases/get_hotels_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/dummy_data.dart';
import '../../../../helpers/mocks.dart';

void main() {
  late MockHotelsRepository mockHotelsRepository;
  late GetHotelsUsecase usecase;

  setUp(() {
    mockHotelsRepository = MockHotelsRepository();
    usecase = GetHotelsUsecase(repository: mockHotelsRepository);
  });

  group('GetHotelsUsecase', () {
    test('should return hotels when repository returns data', () async {
      // arrange
      when(
        () => mockHotelsRepository.getHotels(),
      ).thenAnswer((_) async => Right([dummyHotel]));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should not fail'),
        (hotels) => expect(hotels, [dummyHotel]),
      );
      verify(() => mockHotelsRepository.getHotels()).called(1);
    });

    test('should return failure when repository returns failure', () async {
      // arrange
      when(
        () => mockHotelsRepository.getHotels(),
      ).thenAnswer((_) async => Left(ServerFailure('Error')));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (_) => fail('Should not succeed'),
      );
      verify(() => mockHotelsRepository.getHotels()).called(1);
    });
  });
}
