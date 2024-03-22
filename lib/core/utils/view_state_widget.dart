import 'package:flutter/material.dart';

import '../core.dart';

class ViewStateWidget extends StatelessWidget {
  final Status status;
  final Widget? initial;
  final Widget? success;
  final Widget? failure;
  final Widget? loading;
  final Widget? defaultWidget;
  const ViewStateWidget({
    super.key,
    required this.status,
    this.initial,
    this.success,
    this.failure,
    this.loading,
    this.defaultWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (status.isInitial && initial != null) {
      return initial!;
    } else if (status.isSuccess && success != null) {
      return success!;
    } else if (status.isFailure && failure != null) {
      return failure!;
    } else if (status.isLoading && loading != null) {
      return loading!;
    } else if (defaultWidget != null) {
      return defaultWidget!;
    } else {
      return const SizedBox();
    }
  }
}
