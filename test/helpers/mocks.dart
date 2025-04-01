import 'package:invia_hotel_booking/core/network/network_info.dart';
import 'package:invia_hotel_booking/core/usecases/usecases.dart';
import 'package:invia_hotel_booking/features/favorites/domain/usecases/get_favorites_stream_usecase.dart';
import 'package:invia_hotel_booking/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:invia_hotel_booking/features/favorites/domain/usecases/toogle_favorite_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hive/hive.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/data/models/hotel_model.dart';
import 'package:invia_hotel_booking/core/api/api_client.dart';
import 'package:invia_hotel_booking/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:invia_hotel_booking/features/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:invia_hotel_booking/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:invia_hotel_booking/features/hotels/domain/usecases/get_hotels_usecase.dart';
import 'package:invia_hotel_booking/features/hotels/data/datasources/hotels_remote_datasource.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/cubits/favorites_cubit.dart';
import 'package:invia_hotel_booking/features/hotels/presentation/cubits/hotels_cubit.dart';
import 'package:invia_hotel_booking/core/theme/cubit/theme_cubit.dart';
import 'package:invia_hotel_booking/core/locale/locale_cubit.dart';

/// Mock Entities & Models
class MockHotel extends Mock implements Hotel {}

class MockHotelModel extends Mock implements HotelModel {}

/// Mock Hive
class MockHiveBox<T> extends Mock implements Box<T> {}

/// Mock API
class MockApiClient extends Mock implements ApiClient {}

/// Mock NetworkInfo
class MockNetworkInfo extends Mock implements NetworkInfo {}

/// Mock Repositories
class MockFavoritesRepository extends Mock implements FavoritesRepository {}

class MockHotelsRepository extends Mock implements HotelsRepository {}

/// Mock DataSources
class MockFavoritesLocalDataSource extends Mock
    implements FavoritesLocalDataSource {}

class MockHotelsRemoteDataSource extends Mock
    implements HotelsRemoteDataSource {}

/// Mock Usecases
class MockGetFavoritesStreamUsecase extends Mock
    implements GetFavoritesStreamUsecase {}

class MockGetFavoritesUsecase extends Mock
    implements GetFavoritesUsecase {}
class MockToggleFavoriteUsecase extends Mock implements ToggleFavoriteUsecase {}

class MockGetHotelsUsecase extends Mock implements GetHotelsUsecase {}

/// Mock Cubits
class MockFavoritesCubit extends Mock implements FavoritesCubit {}

class MockHotelsCubit extends Mock implements HotelsCubit {}

class MockThemeCubit extends Mock implements ThemeCubit {}

class MockLocaleCubit extends Mock implements LocaleCubit {}

class NoParamsFake extends Fake implements NoParams {}