import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logger {
  static void success(String text) {
    if (kReleaseMode) return;
    log('\x1B[32m📗 $text\x1B[0m', name: 'Success');
  }

  static void info(String text) {
    if (kReleaseMode) return;
    log('\x1B[33m📙 $text\x1B[0m', name: 'Info');
  }

  static void error(String text) {
    if (kReleaseMode) return;
    log('\x1B[31m📕 $text\x1B[0m', name: 'Error');
  }
}
