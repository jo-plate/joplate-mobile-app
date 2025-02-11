import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/routes/pages/account_screen/edit-pages/change_password_page.dart';
import 'package:joplate/presentation/routes/pages/account_screen/edit-pages/edit_email_page.dart';
import 'package:joplate/presentation/routes/pages/account_screen/edit-pages/edit_phone_number_page.dart';
import 'package:joplate/presentation/routes/pages/account_screen/edit-pages/edit_full_name_page.dart';
import 'package:joplate/presentation/routes/pages/home_page/home_tab/homescreen.dart';
import 'package:joplate/presentation/routes/pages/home_page/dashboard_page.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/profile_screen.dart';
import 'package:joplate/presentation/routes/pages/home_page/favorites_tab/favorites_page.dart';
import 'package:joplate/presentation/routes/pages/auth_screen/auth_page.dart';
import 'package:joplate/presentation/routes/pages/account_screen/account_page.dart';

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
            AutoRoute(path: 'home', page: HomeRoute.page, initial: true),
            AutoRoute(path: 'profile', page: ProfileRoute.page),
            AutoRoute(path: 'favorite', page: FavoritesRoute.page),
          ],
        ),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: AccountRoute.page),
        AutoRoute(page: EditFullNameRoute.page),
        AutoRoute(page: EditEmailRoute.page),
        AutoRoute(page: EditPhoneNumberRoute.page),
        AutoRoute(page: ChangePasswordRoute.page)
      ];
}
