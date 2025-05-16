// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountPage();
    },
  );
}

/// generated route for
/// [AddPhoneNumberPage]
class AddPhoneNumberRoute extends PageRouteInfo<void> {
  const AddPhoneNumberRoute({List<PageRouteInfo>? children})
    : super(AddPhoneNumberRoute.name, initialChildren: children);

  static const String name = 'AddPhoneNumberRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddPhoneNumberPage();
    },
  );
}

/// generated route for
/// [AddPhoneRequestPage]
class AddPhoneRequestRoute extends PageRouteInfo<void> {
  const AddPhoneRequestRoute({List<PageRouteInfo>? children})
    : super(AddPhoneRequestRoute.name, initialChildren: children);

  static const String name = 'AddPhoneRequestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddPhoneRequestPage();
    },
  );
}

/// generated route for
/// [AddPlateNumberPage]
class AddPlateNumberRoute extends PageRouteInfo<void> {
  const AddPlateNumberRoute({List<PageRouteInfo>? children})
    : super(AddPlateNumberRoute.name, initialChildren: children);

  static const String name = 'AddPlateNumberRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddPlateNumberPage();
    },
  );
}

/// generated route for
/// [AddPlateRequestPage]
class AddPlateRequestRoute extends PageRouteInfo<void> {
  const AddPlateRequestRoute({List<PageRouteInfo>? children})
    : super(AddPlateRequestRoute.name, initialChildren: children);

  static const String name = 'AddPlateRequestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddPlateRequestPage();
    },
  );
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthPage();
    },
  );
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangePasswordPage();
    },
  );
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardPage();
    },
  );
}

/// generated route for
/// [EditEmailPage]
class EditEmailRoute extends PageRouteInfo<void> {
  const EditEmailRoute({List<PageRouteInfo>? children})
    : super(EditEmailRoute.name, initialChildren: children);

  static const String name = 'EditEmailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EditEmailPage();
    },
  );
}

/// generated route for
/// [EditFullNamePage]
class EditFullNameRoute extends PageRouteInfo<void> {
  const EditFullNameRoute({List<PageRouteInfo>? children})
    : super(EditFullNameRoute.name, initialChildren: children);

  static const String name = 'EditFullNameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EditFullNamePage();
    },
  );
}

/// generated route for
/// [EditPhoneListingPage]
class EditPhoneListingRoute extends PageRouteInfo<EditPhoneListingRouteArgs> {
  EditPhoneListingRoute({
    Key? key,
    required PhoneListing listing,
    List<PageRouteInfo>? children,
  }) : super(
         EditPhoneListingRoute.name,
         args: EditPhoneListingRouteArgs(key: key, listing: listing),
         initialChildren: children,
       );

  static const String name = 'EditPhoneListingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditPhoneListingRouteArgs>();
      return EditPhoneListingPage(key: args.key, listing: args.listing);
    },
  );
}

class EditPhoneListingRouteArgs {
  const EditPhoneListingRouteArgs({this.key, required this.listing});

  final Key? key;

  final PhoneListing listing;

  @override
  String toString() {
    return 'EditPhoneListingRouteArgs{key: $key, listing: $listing}';
  }
}

/// generated route for
/// [EditPhoneNumberPage]
class EditPhoneNumberRoute extends PageRouteInfo<void> {
  const EditPhoneNumberRoute({List<PageRouteInfo>? children})
    : super(EditPhoneNumberRoute.name, initialChildren: children);

  static const String name = 'EditPhoneNumberRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EditPhoneNumberPage();
    },
  );
}

/// generated route for
/// [EditPhoneRequestPage]
class EditPhoneRequestRoute extends PageRouteInfo<EditPhoneRequestRouteArgs> {
  EditPhoneRequestRoute({
    Key? key,
    required PhoneRequest request,
    List<PageRouteInfo>? children,
  }) : super(
         EditPhoneRequestRoute.name,
         args: EditPhoneRequestRouteArgs(key: key, request: request),
         initialChildren: children,
       );

  static const String name = 'EditPhoneRequestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditPhoneRequestRouteArgs>();
      return EditPhoneRequestPage(key: args.key, request: args.request);
    },
  );
}

class EditPhoneRequestRouteArgs {
  const EditPhoneRequestRouteArgs({this.key, required this.request});

  final Key? key;

  final PhoneRequest request;

  @override
  String toString() {
    return 'EditPhoneRequestRouteArgs{key: $key, request: $request}';
  }
}

/// generated route for
/// [EditPlateListingPage]
class EditPlateListingRoute extends PageRouteInfo<EditPlateListingRouteArgs> {
  EditPlateListingRoute({
    Key? key,
    required PlateListing listing,
    List<PageRouteInfo>? children,
  }) : super(
         EditPlateListingRoute.name,
         args: EditPlateListingRouteArgs(key: key, listing: listing),
         initialChildren: children,
       );

  static const String name = 'EditPlateListingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditPlateListingRouteArgs>();
      return EditPlateListingPage(key: args.key, listing: args.listing);
    },
  );
}

class EditPlateListingRouteArgs {
  const EditPlateListingRouteArgs({this.key, required this.listing});

  final Key? key;

  final PlateListing listing;

  @override
  String toString() {
    return 'EditPlateListingRouteArgs{key: $key, listing: $listing}';
  }
}

/// generated route for
/// [EditPlateRequestPage]
class EditPlateRequestRoute extends PageRouteInfo<EditPlateRequestRouteArgs> {
  EditPlateRequestRoute({
    Key? key,
    required PlateRequest request,
    List<PageRouteInfo>? children,
  }) : super(
         EditPlateRequestRoute.name,
         args: EditPlateRequestRouteArgs(key: key, request: request),
         initialChildren: children,
       );

  static const String name = 'EditPlateRequestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditPlateRequestRouteArgs>();
      return EditPlateRequestPage(key: args.key, request: args.request);
    },
  );
}

class EditPlateRequestRouteArgs {
  const EditPlateRequestRouteArgs({this.key, required this.request});

  final Key? key;

  final PlateRequest request;

  @override
  String toString() {
    return 'EditPlateRequestRouteArgs{key: $key, request: $request}';
  }
}

/// generated route for
/// [FavoritesPage]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
    : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoritesPage();
    },
  );
}

/// generated route for
/// [FeedPage]
class FeedRoute extends PageRouteInfo<void> {
  const FeedRoute({List<PageRouteInfo>? children})
    : super(FeedRoute.name, initialChildren: children);

  static const String name = 'FeedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FeedPage();
    },
  );
}

/// generated route for
/// [FollowersPage]
class FollowersRoute extends PageRouteInfo<FollowersRouteArgs> {
  FollowersRoute({
    Key? key,
    required String userId,
    List<PageRouteInfo>? children,
  }) : super(
         FollowersRoute.name,
         args: FollowersRouteArgs(key: key, userId: userId),
         rawPathParams: {'userId': userId},
         initialChildren: children,
       );

  static const String name = 'FollowersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<FollowersRouteArgs>(
        orElse:
            () => FollowersRouteArgs(userId: pathParams.getString('userId')),
      );
      return FollowersPage(key: args.key, userId: args.userId);
    },
  );
}

class FollowersRouteArgs {
  const FollowersRouteArgs({this.key, required this.userId});

  final Key? key;

  final String userId;

  @override
  String toString() {
    return 'FollowersRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [FollowingPage]
class FollowingRoute extends PageRouteInfo<FollowingRouteArgs> {
  FollowingRoute({
    Key? key,
    required String userId,
    List<PageRouteInfo>? children,
  }) : super(
         FollowingRoute.name,
         args: FollowingRouteArgs(key: key, userId: userId),
         rawPathParams: {'userId': userId},
         initialChildren: children,
       );

  static const String name = 'FollowingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<FollowingRouteArgs>(
        orElse:
            () => FollowingRouteArgs(userId: pathParams.getString('userId')),
      );
      return FollowingPage(key: args.key, userId: args.userId);
    },
  );
}

class FollowingRouteArgs {
  const FollowingRouteArgs({this.key, required this.userId});

  final Key? key;

  final String userId;

  @override
  String toString() {
    return 'FollowingRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [MyNumbersPage]
class MyNumbersRoute extends PageRouteInfo<void> {
  const MyNumbersRoute({List<PageRouteInfo>? children})
    : super(MyNumbersRoute.name, initialChildren: children);

  static const String name = 'MyNumbersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyNumbersPage();
    },
  );
}

/// generated route for
/// [MyPlanPage]
class MyPlanRoute extends PageRouteInfo<void> {
  const MyPlanRoute({List<PageRouteInfo>? children})
    : super(MyPlanRoute.name, initialChildren: children);

  static const String name = 'MyPlanRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyPlanPage();
    },
  );
}

/// generated route for
/// [MyRequestsPage]
class MyRequestsRoute extends PageRouteInfo<void> {
  const MyRequestsRoute({List<PageRouteInfo>? children})
    : super(MyRequestsRoute.name, initialChildren: children);

  static const String name = 'MyRequestsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyRequestsPage();
    },
  );
}

/// generated route for
/// [PhoneDetailsPage]
class PhoneDetailsRoute extends PageRouteInfo<PhoneDetailsRouteArgs> {
  PhoneDetailsRoute({
    Key? key,
    required String listingId,
    List<PageRouteInfo>? children,
  }) : super(
         PhoneDetailsRoute.name,
         args: PhoneDetailsRouteArgs(key: key, listingId: listingId),
         rawPathParams: {'listingId': listingId},
         initialChildren: children,
       );

  static const String name = 'PhoneDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PhoneDetailsRouteArgs>(
        orElse:
            () => PhoneDetailsRouteArgs(
              listingId: pathParams.getString('listingId'),
            ),
      );
      return PhoneDetailsPage(key: args.key, listingId: args.listingId);
    },
  );
}

class PhoneDetailsRouteArgs {
  const PhoneDetailsRouteArgs({this.key, required this.listingId});

  final Key? key;

  final String listingId;

  @override
  String toString() {
    return 'PhoneDetailsRouteArgs{key: $key, listingId: $listingId}';
  }
}

/// generated route for
/// [PhoneListingsPage]
class PhoneListingsRoute extends PageRouteInfo<void> {
  const PhoneListingsRoute({List<PageRouteInfo>? children})
    : super(PhoneListingsRoute.name, initialChildren: children);

  static const String name = 'PhoneListingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PhoneListingsPage();
    },
  );
}

/// generated route for
/// [PhoneRequestDetailsPage]
class PhoneRequestDetailsRoute
    extends PageRouteInfo<PhoneRequestDetailsRouteArgs> {
  PhoneRequestDetailsRoute({
    Key? key,
    required String phoneNumberRequestId,
    List<PageRouteInfo>? children,
  }) : super(
         PhoneRequestDetailsRoute.name,
         args: PhoneRequestDetailsRouteArgs(
           key: key,
           phoneNumberRequestId: phoneNumberRequestId,
         ),
         initialChildren: children,
       );

  static const String name = 'PhoneRequestDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneRequestDetailsRouteArgs>();
      return PhoneRequestDetailsPage(
        key: args.key,
        phoneNumberRequestId: args.phoneNumberRequestId,
      );
    },
  );
}

class PhoneRequestDetailsRouteArgs {
  const PhoneRequestDetailsRouteArgs({
    this.key,
    required this.phoneNumberRequestId,
  });

  final Key? key;

  final String phoneNumberRequestId;

  @override
  String toString() {
    return 'PhoneRequestDetailsRouteArgs{key: $key, phoneNumberRequestId: $phoneNumberRequestId}';
  }
}

/// generated route for
/// [PlansPage]
class PlansRoute extends PageRouteInfo<void> {
  const PlansRoute({List<PageRouteInfo>? children})
    : super(PlansRoute.name, initialChildren: children);

  static const String name = 'PlansRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PlansPage();
    },
  );
}

/// generated route for
/// [PlateRequestDetailsPage]
class PlateRequestDetailsRoute
    extends PageRouteInfo<PlateRequestDetailsRouteArgs> {
  PlateRequestDetailsRoute({
    Key? key,
    required String requestId,
    List<PageRouteInfo>? children,
  }) : super(
         PlateRequestDetailsRoute.name,
         args: PlateRequestDetailsRouteArgs(key: key, requestId: requestId),
         rawPathParams: {'requestId': requestId},
         initialChildren: children,
       );

  static const String name = 'PlateRequestDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PlateRequestDetailsRouteArgs>(
        orElse:
            () => PlateRequestDetailsRouteArgs(
              requestId: pathParams.getString('requestId'),
            ),
      );
      return PlateRequestDetailsPage(key: args.key, requestId: args.requestId);
    },
  );
}

class PlateRequestDetailsRouteArgs {
  const PlateRequestDetailsRouteArgs({this.key, required this.requestId});

  final Key? key;

  final String requestId;

  @override
  String toString() {
    return 'PlateRequestDetailsRouteArgs{key: $key, requestId: $requestId}';
  }
}

/// generated route for
/// [PlatesDetailsPage]
class PlatesDetailsRoute extends PageRouteInfo<PlatesDetailsRouteArgs> {
  PlatesDetailsRoute({
    Key? key,
    required String listingId,
    List<PageRouteInfo>? children,
  }) : super(
         PlatesDetailsRoute.name,
         args: PlatesDetailsRouteArgs(key: key, listingId: listingId),
         rawPathParams: {'listingId': listingId},
         initialChildren: children,
       );

  static const String name = 'PlatesDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PlatesDetailsRouteArgs>(
        orElse:
            () => PlatesDetailsRouteArgs(
              listingId: pathParams.getString('listingId'),
            ),
      );
      return PlatesDetailsPage(key: args.key, listingId: args.listingId);
    },
  );
}

class PlatesDetailsRouteArgs {
  const PlatesDetailsRouteArgs({this.key, required this.listingId});

  final Key? key;

  final String listingId;

  @override
  String toString() {
    return 'PlatesDetailsRouteArgs{key: $key, listingId: $listingId}';
  }
}

/// generated route for
/// [PlatesListingsPage]
class PlatesListingsRoute extends PageRouteInfo<void> {
  const PlatesListingsRoute({List<PageRouteInfo>? children})
    : super(PlatesListingsRoute.name, initialChildren: children);

  static const String name = 'PlatesListingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PlatesListingsPage();
    },
  );
}

/// generated route for
/// [PrivacyPolicyPage]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PrivacyPolicyPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [QuicksalePage]
class QuicksaleRoute extends PageRouteInfo<void> {
  const QuicksaleRoute({List<PageRouteInfo>? children})
    : super(QuicksaleRoute.name, initialChildren: children);

  static const String name = 'QuicksaleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QuicksalePage();
    },
  );
}

/// generated route for
/// [RequestsPage]
class RequestsRoute extends PageRouteInfo<void> {
  const RequestsRoute({List<PageRouteInfo>? children})
    : super(RequestsRoute.name, initialChildren: children);

  static const String name = 'RequestsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RequestsPage();
    },
  );
}

/// generated route for
/// [TermsAndConditionsPage]
class TermsAndConditionsRoute extends PageRouteInfo<void> {
  const TermsAndConditionsRoute({List<PageRouteInfo>? children})
    : super(TermsAndConditionsRoute.name, initialChildren: children);

  static const String name = 'TermsAndConditionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TermsAndConditionsPage();
    },
  );
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    Key? key,
    required String userId,
    List<PageRouteInfo>? children,
  }) : super(
         UserProfileRoute.name,
         args: UserProfileRouteArgs(key: key, userId: userId),
         rawPathParams: {'userId': userId},
         initialChildren: children,
       );

  static const String name = 'UserProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<UserProfileRouteArgs>(
        orElse:
            () => UserProfileRouteArgs(userId: pathParams.getString('userId')),
      );
      return UserProfilePage(key: args.key, userId: args.userId);
    },
  );
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({this.key, required this.userId});

  final Key? key;

  final String userId;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key, userId: $userId}';
  }
}
