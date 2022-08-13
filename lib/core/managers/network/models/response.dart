import 'package:themovieapp/core/base/base_response_model.dart';

import 'error.dart';

abstract class IResponse<T extends BaseResponseModel> {
  final T? response;
  final IError? error;

  IResponse({
    this.response,
    this.error,
  });
}

class Response<T extends BaseResponseModel> extends IResponse<T> {
  Response({
    super.response,
    super.error,
  });
}
