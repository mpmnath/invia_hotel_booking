import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:invia_hotel_booking/core/constants/values.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';
import 'package:invia_hotel_booking/core/locale/locale_cubit.dart';
import 'package:invia_hotel_booking/core/router/app_router.dart';
import 'package:invia_hotel_booking/core/services/deep_link_service.dart';
import 'package:invia_hotel_booking/core/services/hive_service.dart';
import 'package:invia_hotel_booking/core/theme/cubit/theme_cubit.dart';
import 'package:invia_hotel_booking/core/theme/theme.dart';
import 'package:invia_hotel_booking/di/injection.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/cubits/favorites_cubit.dart';
import 'package:invia_hotel_booking/features/hotels/presentation/cubits/hotels_cubit.dart';
import 'package:invia_hotel_booking/l10n/l10n.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive Adapters
  HiveInitializer.registerAdapters();

  // Hydrated Bloc Storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );

  // Dependency Injection Setup
  await configureDependencies();

  // Get AppRouter instance
  final appRouter = getIt<AppRouter>();

  // Initialize DeepLinkService
  getIt<DeepLinkService>();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HotelsCubit>()..getHotels()),
        BlocProvider(create: (context) => getIt<FavoritesCubit>()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LocaleCubit()),
      ],
      child: MyApp(appRouter: appRouter),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter;
  const MyApp({super.key, required AppRouter appRouter})
    : _appRouter = appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          context.isTablet ? defaultTabletDesignSize : defaultDesignSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return BlocBuilder<LocaleCubit, Locale>(
              builder: (context, locale) {
                return MaterialApp.router(
                  title: 'Invia Hotel Booking',

                  // Theme
                  theme: HotelBookingTheme.light,
                  darkTheme: HotelBookingTheme.dark,
                  themeMode: themeMode,
                  debugShowCheckedModeBanner: false,

                  // Localization
                  locale: locale,
                  supportedLocales: L10n.supportedLocales,
                  localizationsDelegates: L10n.localizationsDelegates,

                  // Route information provider
                  routerDelegate: _appRouter.delegate(),
                  routeInformationParser: _appRouter.defaultRouteParser(),
                  routeInformationProvider: _appRouter.routeInfoProvider(),
                );
              },
            );
          },
        );
      },
    );
  }
}

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<PageRouteInfo> _routes = [
    OverviewRoute(),
    HotelsRoute(),
    FavoritesRoute(),
    AccountRoute(),
  ];

  List<String> _appBarTitles(BuildContext context) {
    return [
      context.l10n.overview,
      context.l10n.hotels,
      context.l10n.favorites,
      context.l10n.account,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: _routes,
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          title: Text(_appBarTitles(context)[tabsRouter.activeIndex]),
        );
      },
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 1,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: context.l10n.overview,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.hotel_outlined),
              label: context.l10n.hotels,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline_outlined),
              label: context.l10n.favorites,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: context.l10n.account,
            ),
          ],
        );
      },
    );
  }
}
