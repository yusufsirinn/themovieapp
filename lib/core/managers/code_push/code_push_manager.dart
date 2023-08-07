import 'package:restart_app/restart_app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

class CodePushManager {
  static CodePushManager? _instance;
  static late ShorebirdCodePush _shorebirdCodePush;
  static CodePushManager get instance {
    _instance ??= CodePushManager._init();
    return _instance!;
  }

  CodePushManager._init() {
    _shorebirdCodePush = ShorebirdCodePush();
  }

  Future<bool> checkForUpdate() async {
    final isUpdateAvailable = await _shorebirdCodePush.isNewPatchAvailableForDownload();
    return isUpdateAvailable;
  }

  Future<void> downloadUpdate() async {
    await _shorebirdCodePush.downloadUpdateIfAvailable();
    Restart.restartApp.call();
  }
}
