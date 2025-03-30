import 'package:auto_route/auto_route.dart';
import 'package:invia_hotel_booking/features/account/presentation/pages/account_page.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/pages/favorites_page.dart';
import 'package:invia_hotel_booking/features/hotels/presentation/pages/hotels_page.dart';
import 'package:invia_hotel_booking/features/overview/presentation/pages/overview_page.dart';
import 'package:invia_hotel_booking/main.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: HomeRoute.page,
      children: [
        AutoRoute(path: 'overview', page: OverviewRoute.page),
        AutoRoute(path: 'hotels', page: HotelsRoute.page, initial: true),
        AutoRoute(path: 'favorites', page: FavoritesRoute.page),
        AutoRoute(path: 'account', page: AccountRoute.page),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
