import 'package:dio/dio.dart';
import 'package:dw_barbershop/src/core/constants/dio_auth_key.dart';
import 'package:dw_barbershop/src/core/constants/local_store_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final RequestOptions(:headers, :extra) = options;

    const authHeaderKey = 'Authorization';
    //evitar else e if desnecessários
    headers.remove(authHeaderKey);

    if (extra case {DioAuthKey.dioAuthKey: true}) {
      final sp = await SharedPreferences.getInstance();
      headers.addAll(
          {authHeaderKey: 'Bearer ${sp.getString(LocalStoreKeys.acessToken)}'});
    }
    handler.next(options);
  }
}
