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
/// [PlatesDetailsPage]
class PlatesDetailsRoute extends PageRouteInfo<PlatesDetailsRouteArgs> {
  PlatesDetailsRoute({
    Key? key,
    required PlateNumber plateNumber,
    List<PageRouteInfo>? children,
  }) : super(
         PlatesDetailsRoute.name,
         args: PlatesDetailsRouteArgs(key: key, plateNumber: plateNumber),
         initialChildren: children,
       );

  static const String name = 'PlatesDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PlatesDetailsRouteArgs>();
      return PlatesDetailsPage(key: args.key, plateNumber: args.plateNumber);
    },
  );
}

class PlatesDetailsRouteArgs {
  const PlatesDetailsRouteArgs({this.key, required this.plateNumber});

  final Key? key;

  final PlateNumber plateNumber;

  @override
  String toString() {
    return 'PlatesDetailsRouteArgs{key: $key, plateNumber: $plateNumber}';
  }
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
