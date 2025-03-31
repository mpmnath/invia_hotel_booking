import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';
import 'package:invia_hotel_booking/core/usecases/usecases.dart';
import 'package:invia_hotel_booking/features/hotels/domain/repositories/hotels_repository.dart';

@lazySingleton
class GetHotelsUseCase implements UseCase<List<Hotel>, NoParams> {
  final HotelsRepository repository;

  GetHotelsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Hotel>>> call(NoParams params) {
    return repository.getHotels();
  }
}