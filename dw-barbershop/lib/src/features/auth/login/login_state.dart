import 'package:flutter/material.dart';

enum LoginStateStatus { initial, error, employeeLogin, admLogin }

class LoginState {
  final LoginStateStatus status;
  final String? errorMessage;

  LoginState.initial() : this(status: LoginStateStatus.initial);

  LoginState({
    this.status = LoginStateStatus.initial,
    this.errorMessage,
  });

  LoginState copyWith({
    LoginStateStatus? status,
    ValueGetter<String?>? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }
}
