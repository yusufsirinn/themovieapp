import 'package:async/async.dart';

mixin DebounceMixin {
  CancelableOperation<void>? _cancelableOperation;

  Future<void> debounce(Function action) async {
    _cancelableOperation?.cancel();
    _cancelableOperation = CancelableOperation.fromFuture(
      Future.delayed(const Duration(seconds: 1)),
      onCancel: () {},
    );

    await _cancelableOperation?.value.then((result) async {
      action();
    });
  }
}
