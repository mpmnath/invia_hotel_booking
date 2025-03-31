import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';
import 'package:invia_hotel_booking/core/router/app_router.dart';
import 'package:invia_hotel_booking/core/services/hive_service.dart';
import 'package:invia_hotel_booking/core/theme/theme.dart';
import 'package:invia_hotel_booking/di/injection.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/cubits/favorites_cubit.dart';
import 'package:invia_hotel_booking/features/hotels/presentation/cubits/hotels_cubit.dart';
import 'package:invia_hotel_booking/l10n/l10n.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive Adapters
  HiveInitializer.registerAdapters();

  // Dependency Injection Setup
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Invia Hotel Booking',

      // Theme
      theme: HotelBookingTheme.light,
      darkTheme: HotelBookingTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,

      // Localization
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.localizationsDelegates,

      // Route information provider
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routeInformationProvider: _appRouter.routeInfoProvider(),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HotelsCubit>()..getHotels()),
        BlocProvider(
          create: (context) => getIt<FavoritesCubit>(),
        ),
      ],
      child: AutoTabsScaffold(
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
                icon: Icon(Icons.home),
                label: context.l10n.overview,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.hotel),
                label: context.l10n.hotels,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: context.l10n.favorites,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: context.l10n.account,
              ),
            ],
          );
        },
      ),
    );
  }
}
