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
/// [PhoneDetailsPage]
class PhoneDetailsRoute extends PageRouteInfo<PhoneDetailsRouteArgs> {
  PhoneDetailsRoute({
    Key? key,
    required PhoneNumber phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
         PhoneDetailsRoute.name,
         args: PhoneDetailsRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'PhoneDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneDetailsRouteArgs>();
      return PhoneDetailsPage(key: args.key, phoneNumber: args.phoneNumber);
    },
  );
}

class PhoneDetailsRouteArgs {
  const PhoneDetailsRouteArgs({this.key, required this.phoneNumber});

  final Key? key;

  final PhoneNumber phoneNumber;

  @override
  String toString() {
    return 'PhoneDetailsRouteArgs{key: $key, phoneNumber: $phoneNumber}';
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
/// [PlatesDetailsPage]
class PlatesDetailsRoute extends PageRouteInfo<PlatesDetailsRouteArgs> {
  PlatesDetailsRoute({
    Key? key,
    required String plateNumber,
    List<PageRouteInfo>? children,
  }) : super(
         PlatesDetailsRoute.name,
         args: PlatesDetailsRouteArgs(key: key, plateNumber: plateNumber),
         rawPathParams: {'plateNumber': plateNumber},
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
              plateNumber: pathParams.getString('plateNumber'),
            ),
      );
      return PlatesDetailsPage(key: args.key, plateNumber: args.plateNumber);
    },
  );
}

class PlatesDetailsRouteArgs {
  const PlatesDetailsRouteArgs({this.key, required this.plateNumber});

  final Key? key;

  final String plateNumber;

  @override
  String toString() {
    return 'PlatesDetailsRouteArgs{key: $key, plateNumber: $plateNumber}';
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
