// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_client.dart' as _i424;
import '../core/api/api_client_impl.dart' as _i180;
import '../core/data/models/hotel_model.dart' as _i617;
import '../core/network/network_info.dart' as _i6;
import '../core/network/network_info_impl.dart' as _i927;
import '../core/router/app_router.dart' as _i877;
import '../features/favorites/data/datasources/favorites_local_datasource.dart'
    as _i751;
import '../features/favorites/data/repositories/favorites_repository_impl.dart'
    as _i317;
import '../features/favorites/domain/repositories/favorites_repository.dart'
    as _i159;
import '../features/favorites/domain/usecases/get_favorites_usecase.dart'
    as _i570;
import '../features/favorites/domain/usecases/stream_favorites_usecase.dart'
    as _i417;
import '../features/favorites/domain/usecases/toogle_favorite_usecase.dart'
    as _i213;
import '../features/favorites/presentation/cubits/favorites_cubit.dart'
    as _i1030;
import '../features/hotels/data/datasources/hotels_remote_data_source.dart'
    as _i896;
import '../features/hotels/data/datasources/hotels_remote_datasource.dart'
    as _i513;
import '../features/hotels/data/repositories/hotels_repository_impl.dart'
    as _i1048;
import '../features/hotels/domain/repositories/hotels_repository.dart' as _i43;
import '../features/hotels/domain/usecases/get_hotels_usecase.dart' as _i198;
import '../features/hotels/presentation/cubits/hotels_cubit.dart' as _i344;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final hiveModule = _$HiveModule();
    final coreModule = _$CoreModule();
    await gh.factoryAsync<_i979.Box<_i617.HotelModel>>(
      () => hiveModule.favoritesBox,
      preResolve: true,
    );
    gh.singleton<_i877.AppRouter>(() => _i877.AppRouter());
    gh.lazySingleton<_i895.Connectivity>(() => coreModule.connectivityChecker);
    gh.lazySingleton<_i361.Dio>(() => coreModule.dio);
    gh.lazySingleton<_i424.ApiClient>(
        () => _i180.ApiClientImpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i513.HotelsRemoteDataSource>(() =>
        _i513.HotelsRemoteDataSourceImpl(apiClient: gh<_i424.ApiClient>()));
    gh.lazySingleton<_i896.HotelsRemoteDataSource>(() =>
        _i896.HotelsRemoteDataSourceImpl(apiClient: gh<_i424.ApiClient>()));
    gh.lazySingleton<_i751.FavoritesLocalDataSource>(() =>
        _i751.FavoritesLocalDataSourceImpl(gh<_i979.Box<_i617.HotelModel>>()));
    gh.lazySingleton<_i6.NetworkInfo>(() =>
        _i927.NetworkInfoImpl(connectionChecker: gh<_i895.Connectivity>()));
    gh.lazySingleton<_i159.FavoritesRepository>(() =>
        _i317.FavoritesRepositoryImpl(
            localDataSource: gh<_i751.FavoritesLocalDataSource>()));
    gh.lazySingleton<_i43.HotelsRepository>(() => _i1048.HotelsRepositoryImpl(
          remoteDataSource: gh<_i513.HotelsRemoteDataSource>(),
          networkInfo: gh<_i6.NetworkInfo>(),
        ));
    gh.lazySingleton<_i213.ToggleFavoriteUsecase>(() =>
        _i213.ToggleFavoriteUsecase(
            repository: gh<_i159.FavoritesRepository>()));
    gh.lazySingleton<_i570.GetFavoritesHotelStreamUsecase>(() =>
        _i570.GetFavoritesHotelStreamUsecase(
            repository: gh<_i159.FavoritesRepository>()));
    gh.lazySingleton<_i417.StreamFavoritesUsecase>(() =>
        _i417.StreamFavoritesUsecase(
            repository: gh<_i159.FavoritesRepository>()));
    gh.singleton<_i1030.FavoritesCubit>(() => _i1030.FavoritesCubit(
          getFavoritesHotelStreamUsecase:
              gh<_i570.GetFavoritesHotelStreamUsecase>(),
          toggleFavoriteUsecase: gh<_i213.ToggleFavoriteUsecase>(),
        ));
    gh.lazySingleton<_i198.GetHotelsUseCase>(
        () => _i198.GetHotelsUseCase(repository: gh<_i43.HotelsRepository>()));
    gh.lazySingleton<_i344.HotelsCubit>(() => _i344.HotelsCubit(
          getHotelsUseCase: gh<_i198.GetHotelsUseCase>(),
          streamFavoritesUsecase: gh<_i417.StreamFavoritesUsecase>(),
        ));
    return this;
  }
}

class _$HiveModule extends _i464.HiveModule {}

class _$CoreModule extends _i464.CoreModule {}
