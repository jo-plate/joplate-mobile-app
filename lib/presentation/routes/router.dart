import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/routes/pages/account_screen/edit-pages/change_password_page.dart';
import 'package:joplate/presentation/routes/pages/account_screen/edit-pages/edit_email_page.dart';
import 'package:joplate/presentation/routes/pages/account_screen/edit-pages/edit_phone_number_page.dart';
import 'package:joplate/presentation/routes/pages/account_screen/edit-pages/edit_full_name_page.dart';
import 'package:joplate/presentation/routes/pages/add_phone_number_screen/add_phone_number_page.dart';
import 'package:joplate/presentation/routes/pages/add_phone_request_screen/add_phone_request_page.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/add_plate_number_page.dart';
import 'package:joplate/presentation/routes/pages/add_plate_request_screen/add_plate_request_page.dart';
import 'package:joplate/presentation/routes/pages/edit_phone_listing_screen/edit_phone_listing_page.dart';
import 'package:joplate/presentation/routes/pages/edit_phone_request_screen/edit_phone_request_page.dart';
import 'package:joplate/presentation/routes/pages/edit_plate_listing_screen/edit_plate_listing_page.dart';
import 'package:joplate/presentation/routes/pages/edit_plate_request_screen/edit_plate_request_page.dart';
import 'package:joplate/presentation/routes/pages/feed_screen/feed_page.dart';
import 'package:joplate/presentation/routes/pages/followers_screen/followers_page.dart';
import 'package:joplate/presentation/routes/pages/following_screen/following_page.dart';
import 'package:joplate/presentation/routes/pages/home_page/home_tab/homescreen.dart';
import 'package:joplate/presentation/routes/pages/home_page/dashboard_page.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/profile_screen.dart';
import 'package:joplate/presentation/routes/pages/home_page/favorites_tab/favorites_page.dart';
import 'package:joplate/presentation/routes/pages/auth_screen/auth_page.dart';
import 'package:joplate/presentation/routes/pages/account_screen/account_page.dart';
import 'package:joplate/presentation/routes/pages/my_numbers_screen/my_numbers_page.dart';
import 'package:joplate/presentation/routes/pages/my_plan_screen/my_plan_page.dart';
import 'package:joplate/presentation/routes/pages/my_requests_screen/my_requests_page.dart';
import 'package:joplate/presentation/routes/pages/notifications_screen/notifications_page.dart';
import 'package:joplate/presentation/routes/pages/phone_listing_details_screen/phone_details_page.dart';
import 'package:joplate/presentation/routes/pages/phone_request_details_screen/phone_request_details_page.dart';
import 'package:joplate/presentation/routes/pages/plans_screen/plans_page.dart';
import 'package:joplate/presentation/routes/pages/plate_listing_details_screen/plates_details_page.dart';
import 'package:joplate/presentation/routes/pages/plate_request_details_screen/plate_request_details_page.dart';
import 'package:joplate/presentation/routes/pages/privacy_policy_screen/privacy_policy_page.dart';
import 'package:joplate/presentation/routes/pages/plates_listings_screen/plates_listings_page.dart';
import 'package:joplate/presentation/routes/pages/phone_listings_screen/phone_listings_page.dart';
import 'package:joplate/presentation/routes/pages/quicksale_screen/quicksale_page.dart';
import 'package:joplate/presentation/routes/pages/requests_screen/requests_page.dart';
import 'package:joplate/presentation/routes/pages/terms_and_conditions_screen/terms_and_conditions_page.dart';
import 'package:joplate/presentation/routes/pages/user_profile_screen/user_profile_page.dart';
import 'package:joplate/presentation/routes/pages/auth_screen/ui/forgot_password_page.dart';
import 'package:joplate/presentation/routes/pages/auth_screen/ui/reset_password_page.dart';
import 'package:joplate/presentation/routes/pages/auth_screen/ui/verification_code_page.dart';
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
            AutoRoute(path: 'feed', page: FeedRoute.page)
          ],
        ),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: AccountRoute.page),
        AutoRoute(page: EditFullNameRoute.page),
        AutoRoute(page: EditEmailRoute.page),
        AutoRoute(page: EditPhoneNumberRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: PlatesDetailsRoute.page, ),
        AutoRoute(page: PhoneDetailsRoute.page, ),
        AutoRoute(page: PhoneRequestDetailsRoute.page, ),
        AutoRoute(page: PlateRequestDetailsRoute.page, ),
        AutoRoute(page: MyPlanRoute.page, path: '/myplan'),
        AutoRoute(page: PlansRoute.page, path: '/plans'),
        AutoRoute(page: AddPlateNumberRoute.page),
        AutoRoute(page: AddPhoneNumberRoute.page),
        AutoRoute(page: AddPhoneRequestRoute.page),
        AutoRoute(page: AddPlateRequestRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page, path: '/privacy-policy'),
        AutoRoute(page: TermsAndConditionsRoute.page, path: '/terms-and-conditions'),
        AutoRoute(page: PlatesListingsRoute.page, path: "/plates"),
        AutoRoute(page: PhoneListingsRoute.page, path: "/phones"),
        AutoRoute(page: RequestsRoute.page, path: "/requests"),
        AutoRoute(page: MyNumbersRoute.page, path: "/my_numbers"),
        AutoRoute(page: MyRequestsRoute.page, path: "/my_requests"),
        AutoRoute(page: EditPlateListingRoute.page, path: "/edit_plate_listing"),
        AutoRoute(page: EditPhoneListingRoute.page, path: "/edit_phone_listing"),
        AutoRoute(page: QuicksaleRoute.page, path: "/quicksale"),
        AutoRoute(page: EditPlateRequestRoute.page, path: "/edit_plate_request"),
        AutoRoute(page: EditPhoneRequestRoute.page, path: "/edit_phone_request"),
        AutoRoute(page: UserProfileRoute.page, path: "/user/:userId"),
        AutoRoute(page: FollowersRoute.page, path: "/followers/:userId"),
        AutoRoute(page: FollowingRoute.page, path: "/following/:userId"),
        AutoRoute(page: FavoritesRoute.page, path: "/favorites"),
        AutoRoute(page: FeedRoute.page, path: "/feed"),
        AutoRoute(page: NotificationsRoute.page, path: "/notifications"),
        AutoRoute(page: ForgotPasswordRoute.page, path: "/forgot-password"),
        AutoRoute(page: ResetPasswordRoute.page, path: "/reset-password"),
        AutoRoute(page: VerificationCodeRoute.page, path: "/verification-code"),
      ];
}
