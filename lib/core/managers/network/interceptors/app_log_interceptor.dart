import 'package:dio/dio.dart';
import 'package:themovieapp/core/utils/logger.dart';

class AppLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.info(options.uri.toString());
    Logger.info(options.method);
    Logger.info(options.data.toString());
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.success(response.statusCode.toString());
    Logger.success('Response -> ${response.data}');
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Logger.error(err.error);
    return handler.next(err);
  }
}
