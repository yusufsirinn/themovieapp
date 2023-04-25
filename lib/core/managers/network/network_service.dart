import 'dart:io';

import 'package:dio/dio.dart' hide Response;
import 'package:flutter/foundation.dart';

import '../../core.dart';

typedef FutureResponse<T extends BaseResponseModel> = Future<Response<T>>;

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  late Dio _client;

  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: AppConstants.baseURL);
    _client = Dio(baseOptions);
    _client.interceptors.addAll(
      [
        if (kDebugMode) AppLogInterceptor(),
        ApiKeyInterceptor(),
      ],
    );
  }

  FutureResponse<T> fetch<T extends BaseResponseModel>({
    required String path,
    required BaseResponseModel model,
    Map<String, dynamic>? queryParameters,
  }) async {
    RequestOptions requestOptions = RequestOptions(
      baseUrl: AppConstants.baseURL,
      path: path,
      queryParameters: queryParameters,
    );
    try {
      var response = await _client.fetch(requestOptions);
      if (response.statusCode == HttpStatus.ok) {
        var data = model.fromJson(response.data) as T;
        return Response<T>(response: data);
      } else {
        throw Exception(response.data);
      }
    } catch (e) {
      return Response(error: Error(message: e.toString()));
    }
  }
}
