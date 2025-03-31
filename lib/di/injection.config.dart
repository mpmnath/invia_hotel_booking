// dart format width=80
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
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_client.dart' as _i424;
import '../core/api/api_client_impl.dart' as _i180;
import '../core/database/database_helper.dart' as _i883;
import '../core/network/network_info.dart' as _i6;
import '../core/network/network_info_impl.dart' as _i927;
import '../core/router/app_router.dart' as _i877;
import '../features/hotels/data/data_source/hotels_remote_data_source.dart'
    as _i646;
import '../features/hotels/data/repository/hotels_repository_impl.dart'
    as _i777;
import '../features/hotels/domain/repositories/hotels_repository.dart' as _i43;
import '../features/hotels/domain/usecases/get_hotels_usecase.dart' as _i198;
import '../features/hotels/presentation/cubit/hotels_cubit.dart' as _i321;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    gh.singleton<_i883.DatabaseHelper>(() => _i883.DatabaseHelper());
    gh.singleton<_i877.AppRouter>(() => _i877.AppRouter());
    gh.lazySingleton<_i895.Connectivity>(() => coreModule.connectivityChecker);
    gh.lazySingleton<_i361.Dio>(() => coreModule.dio);
    gh.lazySingleton<_i424.ApiClient>(
      () => _i180.ApiClientImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i646.HotelsRemoteDataSource>(
      () => _i646.HotelsRemoteDataSourceImpl(apiClient: gh<_i424.ApiClient>()),
    );
    gh.lazySingleton<_i6.NetworkInfo>(
      () => _i927.NetworkInfoImpl(connectionChecker: gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i43.HotelsRepository>(
      () => _i777.HotelsRepositoryImpl(
        remoteDataSource: gh<_i646.HotelsRemoteDataSource>(),
        networkInfo: gh<_i6.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i198.GetHotelsUseCase>(
      () => _i198.GetHotelsUseCase(gh<_i43.HotelsRepository>()),
    );
    gh.lazySingleton<_i321.HotelsCubit>(
      () => _i321.HotelsCubit(getHotelsUseCase: gh<_i198.GetHotelsUseCase>()),
    );
    return this;
  }
}

class _$CoreModule extends _i464.CoreModule {}
