import 'package:flutter/cupertino.dart';

extension ScrollControllerExtension on ScrollController {
  void jumpToTop() {
    if (hasClients) jumpTo(0);
  }

  bool get isBottom {
    if (!hasClients) return false;
    final maxScroll = position.maxScrollExtent;
    final currentScroll = offset;
    return currentScroll == maxScroll;
  }
}
