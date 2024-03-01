import 'package:dw_barbershop/src/core/constants/local_store_keys.dart';
import 'package:dw_barbershop/src/core/exceptions/auth_exception.dart';
import 'package:dw_barbershop/src/core/exceptions/service_exceptions.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/fp/nil.dart';
import 'package:dw_barbershop/src/repositories/user/user_repository.dart';
import 'package:dw_barbershop/src/services/user_login/user_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginServiceImpl implements UserLoginService {
  final UserRepository userRepository;

  UserLoginServiceImpl({required this.userRepository});

  @override
  Future<Either<Exception, Nil>> execute(String email, String password) async {
    final loginResult = await userRepository.login(email, password);

    switch (loginResult) {
      case Sucess(value: final acessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStoreKeys.acessToken, acessToken);
        return Sucess(const Nil());

      case Failure(:final exception):
        return switch (exception) {
          AuthError() =>
            Failure(ServiceExceptions(message: 'Erro ao realizar login')),
          AuthUnauThorizedException() =>
            Failure(ServiceExceptions(message: 'Email ou senha inválidos'))
        };
    }
  }
}
