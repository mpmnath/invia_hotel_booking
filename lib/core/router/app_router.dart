import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/features/account/presentation/view/account_page.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/view/favorites_page.dart';
import 'package:invia_hotel_booking/features/hotels/presentation/view/hotels_page.dart';
import 'package:invia_hotel_booking/features/overview/presentation/view/overview_page.dart';
import 'package:invia_hotel_booking/main.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: HomeRoute.page,
      children: [
        AutoRoute(path: 'overview', page: OverviewRoute.page, initial: true),
        AutoRoute(path: 'hotels', page: HotelsRoute.page),
        AutoRoute(path: 'favorites', page: FavoritesRoute.page),
        AutoRoute(path: 'account', page: AccountRoute.page),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
