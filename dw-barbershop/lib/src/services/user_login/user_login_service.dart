import 'package:dw_barbershop/src/core/exceptions/service_exceptions.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/fp/nil.dart';

abstract interface class UserLoginService {
  Future<Either<ServiceExceptions, Nil>> execute(String email, String password);
}
