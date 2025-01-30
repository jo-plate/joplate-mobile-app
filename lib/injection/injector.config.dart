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

import '../domain/repositories/firestore.dart' as _i156;
import '../domain/usecases/auth/login_with_email.dart' as _i457;
import '../presentation/cubits/auth/auth_cubit.dart' as _i352;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i457.LoginWithEmailAndPasswordUseCase>(
      () => _i457.LoginWithEmailAndPasswordUseCase());
  gh.factory<_i156.FirestoreUserRepository>(
      () => _i156.FirestoreUserRepository());
  gh.singleton<_i352.AuthCubit>(
      () => _i352.AuthCubit(gh<_i156.FirestoreUserRepository>()));
  return getIt;
}
