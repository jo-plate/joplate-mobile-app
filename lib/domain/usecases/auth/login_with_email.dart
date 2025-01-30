import 'package:injectable/injectable.dart';
import 'package:joplate/domain/usecases/usecases.dart';
import 'package:tuple/tuple.dart';

typedef LoginInput = Tuple2<String, String>;

@injectable
class LoginWithEmailAndPasswordUseCase extends FutureUseCase<LoginInput, void> {
  LoginWithEmailAndPasswordUseCase();

  // final AuthService _authService;
  @override
  Future<void> call(LoginInput input) async {
    // if (!input.item1.isValid && !input.item2.hasMinimumLength) {
    // throw const ResponseError.invalidLoginCredentials();
    // }

    // final _email = input.item1.value;
    // final _password = input.item2.value;

    // final loginRequestBody = LoginRequestBody(
    //   email: _email,
    //   password: _password,
    // );

    // await _authService.login(loginRequestBody);
  }
}
