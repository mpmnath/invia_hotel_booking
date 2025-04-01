import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:invia_hotel_booking/features/hotels/presentation/cubits/hotels_cubit.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';

import '../../../../helpers/dummy_data.dart';
import '../../../../helpers/mocks.dart';

void main() {
  late MockGetHotelsUsecase mockGetHotelsUsecase;

  setUpAll(() {
    registerFallbackValue(NoParamsFake());
  });

  setUp(() {
    mockGetHotelsUsecase = MockGetHotelsUsecase();
  });

  group('HotelsCubit', () {
    blocTest<HotelsCubit, HotelsState>(
      'emits [HotelsLoading, HotelsLoaded] when getHotels succeeds',
      build: () {
        when(
          () => mockGetHotelsUsecase.call(any()),
        ).thenAnswer((_) async => Right([dummyHotel]));

        return HotelsCubit(getHotelsUseCase: mockGetHotelsUsecase);
      },
      act: (cubit) => cubit.getHotels(),
      expect:
          () => [
            HotelsLoading(),
            HotelsLoaded([dummyHotel]),
          ],
      verify: (_) {
        verify(() => mockGetHotelsUsecase.call(any())).called(1);
      },
    );

    blocTest<HotelsCubit, HotelsState>(
      'emits [HotelsLoading, HotelsError] when getHotels fails',
      build: () {
        when(
          () => mockGetHotelsUsecase.call(any()),
        ).thenAnswer((_) async => Left(ServerFailure('Error')));

        return HotelsCubit(getHotelsUseCase: mockGetHotelsUsecase);
      },
      act: (cubit) => cubit.getHotels(),
      expect: () => [isA<HotelsLoading>(), isA<HotelsError>()],
      verify: (_) {
        verify(() => mockGetHotelsUsecase.call(any())).called(1);
      },
    );
  });
}
