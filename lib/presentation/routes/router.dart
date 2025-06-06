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
        // Dashboard with nested routes
        AutoRoute(
          path: '/',
          page: DashboardRoute.page,
          children: [
            AutoRoute(path: '/home', page: HomeRoute.page, initial: true),
            AutoRoute(path: '/profile', page: ProfileRoute.page),
            AutoRoute(path: '/feed', page: FeedRoute.page)
          ],
        ),
        
        // Authentication routes
        AutoRoute(page: AuthRoute.page, path: '/auth'),
        AutoRoute(page: ForgotPasswordRoute.page, path: "/forgot-password"),
        AutoRoute(page: ResetPasswordRoute.page, path: "/reset-password"),
        AutoRoute(page: VerificationCodeRoute.page, path: "/verification-code"),

        // Account management routes
        AutoRoute(page: AccountRoute.page, path: '/account'),
        AutoRoute(page: EditFullNameRoute.page, path: '/account/edit-name'),
        AutoRoute(page: EditEmailRoute.page, path: '/account/edit-email'),
        AutoRoute(page: EditPhoneNumberRoute.page, path: '/account/edit-phone'),
        AutoRoute(page: ChangePasswordRoute.page, path: '/account/change-password'),

        // Details pages with parameters
        AutoRoute(page: PlatesDetailsRoute.page, path: "/plates/:listingId"),
        AutoRoute(page: PhoneDetailsRoute.page, path: "/phones/:listingId"),
        AutoRoute(page: PlateRequestDetailsRoute.page, path: "/plate-requests/:requestId"),
        AutoRoute(page: PhoneRequestDetailsRoute.page, path: "/phone-requests/:phoneNumberRequestId"),

        // Listing pages
        AutoRoute(page: PlatesListingsRoute.page, path: "/plates"),
        AutoRoute(page: PhoneListingsRoute.page, path: "/phones"),
        AutoRoute(page: RequestsRoute.page, path: "/requests"),
        AutoRoute(page: QuicksaleRoute.page, path: "/quicksale"),
        
        // User management
        AutoRoute(page: MyNumbersRoute.page, path: "/my-numbers"),
        AutoRoute(page: MyRequestsRoute.page, path: "/my-requests"),
        AutoRoute(page: UserProfileRoute.page, path: "/user/:userId"),
        AutoRoute(page: FollowersRoute.page, path: "/followers/:userId"),
        AutoRoute(page: FollowingRoute.page, path: "/following/:userId"),
        AutoRoute(page: FavoritesRoute.page, path: "/favorites"),
        AutoRoute(page: NotificationsRoute.page, path: "/notifications"),
        
        // Plans and subscription
        AutoRoute(page: MyPlanRoute.page, path: '/my-plan'),
        AutoRoute(page: PlansRoute.page, path: '/plans'),

        // Add new item routes
        AutoRoute(page: AddPlateNumberRoute.page, path: '/add/plate-number'),
        AutoRoute(page: AddPhoneNumberRoute.page, path: '/add/phone-number'),
        AutoRoute(page: AddPlateRequestRoute.page, path: '/add/plate-request'),
        AutoRoute(page: AddPhoneRequestRoute.page, path: '/add/phone-request'),

        // Edit routes with parameters
        AutoRoute(page: EditPlateListingRoute.page, path: "/edit/plate-listing/:listingId"),
        AutoRoute(page: EditPhoneListingRoute.page, path: "/edit/phone-listing/:listingId"),
        AutoRoute(page: EditPlateRequestRoute.page, path: "/edit/plate-request/:requestId"),
        AutoRoute(page: EditPhoneRequestRoute.page, path: "/edit/phone-request/:requestId"),

        // Static pages
        AutoRoute(page: PrivacyPolicyRoute.page, path: '/privacy-policy'),
        AutoRoute(page: TermsAndConditionsRoute.page, path: '/terms-and-conditions'),
      ];

  bool get preserveState => true;

  bool get restoreState => true;
}
