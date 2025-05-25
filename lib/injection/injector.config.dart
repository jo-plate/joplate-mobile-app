// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../data/services/fcm_service.dart' as _i894;
import '../domain/repositories/firestore_user_repository.dart' as _i832;
import '../domain/repositories/listings_repository.dart' as _i871;
import '../domain/usecases/auth/login_with_email.dart' as _i457;
import '../presentation/cubits/auth/auth_cubit.dart' as _i352;
import '../presentation/cubits/fcm/fcm_cubit.dart' as _i875;
import '../presentation/cubits/iap_cubit.dart' as _i762;
import '../presentation/cubits/localization/localization_cubit.dart' as _i340;
import '../presentation/cubits/theme_cubit.dart' as _i203;
import '../presentation/widgets/app_snackbar.dart' as _i985;
import 'modules/shared_prefs_module.dart' as _i913;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final sharedPrefsModule = _$SharedPrefsModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => sharedPrefsModule.prefs,
    preResolve: true,
  );
  gh.factory<_i457.LoginWithEmailAndPasswordUseCase>(
      () => _i457.LoginWithEmailAndPasswordUseCase());
  gh.singleton<_i832.FirestoreUserRepository>(
      () => _i832.FirestoreUserRepository());
  gh.singleton<_i762.IAPCubit>(() => _i762.IAPCubit());
  gh.singleton<_i985.AppSnackbar>(() => _i985.AppSnackbar());
  gh.lazySingleton<_i894.FCMService>(() => _i894.FCMService());
  gh.lazySingleton<_i871.FirestoreListingRepository>(
      () => _i871.FirestoreListingRepository());
  gh.lazySingleton<_i340.LocalizationCubit>(() => _i340.LocalizationCubit());
  gh.singleton<_i203.ThemeCubit>(
      () => _i203.ThemeCubit(gh<_i460.SharedPreferences>()));
  gh.singleton<_i352.AuthCubit>(
      () => _i352.AuthCubit(gh<_i832.FirestoreUserRepository>()));
  gh.lazySingleton<_i875.FCMCubit>(
      () => _i875.FCMCubit(gh<_i894.FCMService>()));
  return getIt;
}

class _$SharedPrefsModule extends _i913.SharedPrefsModule {}
