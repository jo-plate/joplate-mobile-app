import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/routes/pages/account_screen/edit-pages/change_password_page.dart';
import 'package:joplate/presentation/routes/pages/account_screen/edit-pages/edit_email_page.dart';
import 'package:joplate/presentation/routes/pages/account_screen/edit-pages/edit_phone_number_page.dart';
import 'package:joplate/presentation/routes/pages/account_screen/edit-pages/edit_full_name_page.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/add_plate_number_page.dart';
import 'package:joplate/presentation/routes/pages/home_page/home_tab/homescreen.dart';
import 'package:joplate/presentation/routes/pages/home_page/dashboard_page.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/profile_screen.dart';
import 'package:joplate/presentation/routes/pages/home_page/favorites_tab/favorites_page.dart';
import 'package:joplate/presentation/routes/pages/auth_screen/auth_page.dart';
import 'package:joplate/presentation/routes/pages/account_screen/account_page.dart';
import 'package:joplate/presentation/routes/pages/my_plan_screen/my_plan_page.dart';
import 'package:joplate/presentation/routes/pages/plans_screen/plans_page.dart';
import 'package:joplate/presentation/routes/pages/plate_details_screen/plates_details_page.dart';
import 'package:joplate/presentation/routes/pages/privacy_policy_screen/privacy_policy_page.dart';
import 'package:joplate/presentation/routes/pages/main_Plates_page/main_page.dart';
import 'package:joplate/presentation/routes/pages/main_Numbers_page/main_numbers_page.dart';
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
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: PlatesDetailsRoute.page, path: '/plate-details/:plateNumber'),
        AutoRoute(page: MyPlanRoute.page, path: '/myplan'),
        AutoRoute(page: PlansRoute.page, path: '/plans'),
        AutoRoute(page: AddPlateNumberRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page, path: '/privacy-policy'),
        AutoRoute(page: CarNumbersRoute.page, path: "/plates"),
        AutoRoute(page: PhoneNumbersRoute.page,path:"/phones")
      ];
}
