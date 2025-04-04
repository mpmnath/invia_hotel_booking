import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/error/exceptions.dart';
import 'package:invia_hotel_booking/core/failure/failure.dart';
import 'package:invia_hotel_booking/core/network/network_info.dart';
import 'package:invia_hotel_booking/features/hotels/data/datasources/hotels_remote_datasource.dart';
import 'package:invia_hotel_booking/core/data/models/hotel_model.dart';
import 'package:invia_hotel_booking/features/hotels/domain/repositories/hotels_repository.dart';

@LazySingleton(as: HotelsRepository)
class HotelsRepositoryImpl implements HotelsRepository {
  final HotelsRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  HotelsRepositoryImpl({
    required HotelsRemoteDataSource remoteDataSource,
    required NetworkInfo networkInfo,
  }) : _remoteDataSource = remoteDataSource,
       _networkInfo = networkInfo;

  // Cache for hotels to minimize repeated API calls
  List<HotelModel>? _cachedHotels;

  @override
  Future<Either<Failure, List<Hotel>>> getHotels() async {
    // Return cached hotels if available and not forcing refresh
    if (_cachedHotels != null) {
      return Right(_cachedHotels!.map((model) => model.toEntity()).toList());
    }

    // Check for internet connection
    if (await _networkInfo.isConnected) {
      try {
        final hotels = await _remoteDataSource.getHotels();
        _cachedHotels = hotels;
        return Right(hotels.map((model) => model.toEntity()).toList());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, code: e.statusCode));
      }
    } else {
      return Left(NetworkFailure('No internet connection'));
    }
  }
}
