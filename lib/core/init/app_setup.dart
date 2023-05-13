import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:themovieapp/core/core.dart';

class AppSetup {
  static init() async {
    if (kDebugMode) Bloc.observer = const AppBlocObserver();
    await dotenv.load(fileName: '.env');
  }
}
