import 'dart:io';

import 'package:dio/dio.dart';

import '../../base/base_response_model.dart';
import '../../constants/app_constants.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  late Dio _client;

  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: AppConstants.baseURL);
    _client = Dio(baseOptions);
  }

  Future<void> fetch({
    required Function onSuccess,
    required Function onError,
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
        var data = model.fromJson(response.data);
        onSuccess(data);
      } else {
        throw Exception(response.data);
      }
    } catch (e) {
      onError(e);
    }
  }
}
