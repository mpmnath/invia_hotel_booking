import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/data/models/hotel_model.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => getIt.init();

@module
abstract class CoreModule {
  // External dependencies
  @lazySingleton
  Connectivity get connectivityChecker => Connectivity();
  // API client configuration
  @lazySingleton
  Dio get dio => Dio();
}

@module
abstract class HiveModule {
  @preResolve
  Future<Box<HotelModel>> get favoritesBox async {
    return await Hive.openBox<HotelModel>('favorites_box');
  }
}

Future<void> initDependencies() async {
  await configureDependencies();
}
