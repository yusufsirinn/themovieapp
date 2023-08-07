import 'package:flutter/material.dart';
import 'package:themovieapp/core/extensions/context_extensions.dart';

import '../../core/managers/code_push/code_push_manager.dart';
import '../atoms/indicator.dart';

class TMDBIAppUpdater extends StatefulWidget {
  const TMDBIAppUpdater({super.key});

  @override
  State<TMDBIAppUpdater> createState() => _TMDBIAppUpdaterState();
}

class _TMDBIAppUpdaterState extends State<TMDBIAppUpdater> {
  late bool _isCheckingForUpdate;

  @override
  void initState() {
    super.initState();
    _isCheckingForUpdate = false;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _isCheckingForUpdate ? null : _checkForUpdate,
      icon: _isCheckingForUpdate
          ? const Indicator(
              color: Colors.white,
            )
          : const Icon(
              Icons.update,
              color: Colors.white,
            ),
    );
  }

  Future<void> _checkForUpdate() async {
    setState(() {
      _isCheckingForUpdate = true;
    });

    final isUpdateAvailable = await CodePushManager.instance.checkForUpdate();

    if (!mounted) return;

    setState(() {
      _isCheckingForUpdate = false;
    });

    if (isUpdateAvailable) {
      await _showUpdateAvailableBanner();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.tr.noUpdateAvailable),
        ),
      );
    }
  }

  Future<void> _showUpdateAvailableBanner() async {
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    await _downloadUpdate();

    if (!mounted) return;
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
  }

  Future<void> _downloadUpdate() async {
    _showDownloadingBanner();
    await CodePushManager.instance.downloadUpdate();
  }

  void _showDownloadingBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(context.tr.downloading),
        actions: const [
          Indicator(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
