part of 'hotels_cubit.dart';

abstract class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

class HotelsInitial extends HotelsState {}

class HotelsLoading extends HotelsState {}

class HotelsLoaded extends HotelsState {
  final List<Hotel> hotels;

  const HotelsLoaded(this.hotels);

  @override
  List<Object> get props => [hotels];
}

class HotelsError extends HotelsState {
  final String message;

  const HotelsError(this.message);

  @override
  List<Object> get props => [message];
}