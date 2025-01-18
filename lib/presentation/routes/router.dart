import 'package:auto_route/auto_route.dart';
import 'package:joplate/presentation/routes/pages/homescreen.dart';
import 'package:joplate/presentation/routes/pages/tabs/dashboard_page.dart';
import 'package:joplate/presentation/routes/pages/tabs/profile_screen.dart';
import 'package:joplate/presentation/routes/pages/tabs/settings_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    
        AutoRoute(
          path: '/',
          page: DashboardRoute.page,
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'profile', page: ProfileRoute.page),
            AutoRoute(path: 'favorite', page: FavoritesRoute.page),
            
          ],
        ),
      ];
}
