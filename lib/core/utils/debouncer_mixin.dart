import 'package:async/async.dart';

import '../core.dart';

mixin DebounceMixin {
  CancelableOperation<void>? _cancelableOperation;

  Future<void> debounce(Function action) async {
    _cancelableOperation?.cancel();
    _cancelableOperation = CancelableOperation.fromFuture(
      Future.delayed(AppDuration.low.time),
    );

    await _cancelableOperation?.value.then((result) async {
      action();
    });
  }
}
