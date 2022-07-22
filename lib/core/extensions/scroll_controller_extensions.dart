import 'package:flutter/cupertino.dart';

extension ScrollControllerExtension on ScrollController {
  void jumpToTop() {
    if (hasClients) jumpTo(0);
  }
}
