import 'package:flutter_bloc/flutter_bloc.dart';

import '../core.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Logger.info("Bloc - Create - $bloc");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger.info("Bloc - Change - $bloc");
    Logger.info(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Logger.info("Bloc - Transition - $bloc");
    Logger.info(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Logger.error("Bloc - Error - $bloc");
    Logger.error(stackTrace.toString());
    Logger.error(error);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Logger.info("Bloc - Close - $bloc");
  }
}
