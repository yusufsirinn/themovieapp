import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logger {
  static void success(Object object) {
    if (kReleaseMode) return;
    log('\x1B[32m📗 $object\x1B[0m', name: 'Success');
  }

  static void info(Object object) {
    if (kReleaseMode) return;
    log('\x1B[33m📙 $object\x1B[0m', name: 'Info');
  }

  static void error(Object object) {
    if (kReleaseMode) return;
    log('\x1B[31m📕 $object\x1B[0m', name: 'Error');
  }
}
