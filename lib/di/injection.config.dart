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
import '../core/network/network_info.dart' as _i6;
import '../core/network/network_info_impl.dart' as _i927;
import '../core/router/app_router.dart' as _i877;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    gh.singleton<_i877.AppRouter>(() => _i877.AppRouter());
    gh.lazySingleton<_i895.Connectivity>(() => coreModule.connectivityChecker);
    gh.lazySingleton<_i361.Dio>(() => coreModule.dio);
    gh.lazySingleton<_i424.ApiClient>(
      () => _i180.ApiClientImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i6.NetworkInfo>(
      () => _i927.NetworkInfoImpl(connectionChecker: gh<_i895.Connectivity>()),
    );
    return this;
  }
}

class _$CoreModule extends _i464.CoreModule {}
