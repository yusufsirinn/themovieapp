import 'package:dio/dio.dart';
import '../../../constants/app_constants.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, handler) {
    options.queryParameters['api_key'] = Environment.apiKey;
    return handler.next(options);
  }
}
