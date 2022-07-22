import 'package:async/async.dart';

import '../enums/duration_enum.dart';

mixin DebounceMixin {
  CancelableOperation<void>? _cancelableOperation;

  Future<void> debounce(Function action) async {
    _cancelableOperation?.cancel();
    _cancelableOperation = CancelableOperation.fromFuture(
      Future.delayed(AppDuration.low.value()),
      onCancel: () {},
    );

    await _cancelableOperation?.value.then((result) async {
      action();
    });
  }
}
