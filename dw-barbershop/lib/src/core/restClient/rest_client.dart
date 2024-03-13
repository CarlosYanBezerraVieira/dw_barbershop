import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dw_barbershop/src/core/constants/dio_auth_key.dart';
import 'package:dw_barbershop/src/core/restClient/interceptors/auth_interceptor.dart';

final class RestClient extends DioForNative {
  RestClient()
      : super(
          BaseOptions(
            baseUrl: 'http://192.168.0.12:8080',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AuthInterceptor(),
    ]);
  }

  RestClient get auth {
    options.extra[DioAuthKey.dioAuthKey] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra[DioAuthKey.dioAuthKey] = false;
    return this;
  }
}
