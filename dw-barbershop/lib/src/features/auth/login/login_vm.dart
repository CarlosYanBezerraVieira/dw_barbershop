import 'package:asyncstate/asyncstate.dart';
import 'package:dw_barbershop/src/core/exceptions/service_exceptions.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/providers/application_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'login_state.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVm extends _$LoginVm {
  @override
  LoginState build() => LoginState.initial();

  Future<void> login(String email, String password) async {
    final loaderHandle = AsyncLoaderHandler.start();

    final loginService = ref.watch(userLoginServiceProvider);

    final result = await loginService.execute(email, password);
    switch (result) {
      case Sucess():
        //buscar dados do usuario
        //fazer uma analise para saber se é adm ou funcionario
        break;
      case Failure(exception: ServiceExceptions(:final message)):
        state = state.copyWith(
            status: LoginStateStatus.error, errorMessage: () => message);
        break;
    }
    loaderHandle.close();
  }
}
