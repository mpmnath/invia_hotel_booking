import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/usecases/usecases.dart';
import 'package:invia_hotel_booking/features/hotels/domain/usecases/get_hotels_usecase.dart';

part 'hotels_state.dart';

@lazySingleton
class HotelsCubit extends Cubit<HotelsState> {
  final GetHotelsUseCase _getHotelsUseCase;
  HotelsCubit({required GetHotelsUseCase getHotelsUseCase})
    : _getHotelsUseCase = getHotelsUseCase,
      super(HotelsInitial());

  void getHotels() async {
    emit(HotelsLoading());
    final result = await _getHotelsUseCase(NoParams());
    emit(
      result.fold(
        (error) => HotelsError(error.toString()),
        (hotels) => HotelsLoaded(hotels),
      ),
    );
  }
}
