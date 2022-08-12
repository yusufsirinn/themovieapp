import 'package:flutter/material.dart';
import 'package:themovieapp/core/enums/status_enum.dart';

class ViewStateWidget extends StatelessWidget {
  final Status status;
  final Widget? initial;
  final Widget? success;
  final Widget? failure;
  final Widget? loading;
  final Widget? defaultWidget;
  const ViewStateWidget({
    Key? key,
    required this.status,
    this.initial,
    this.success,
    this.failure,
    this.loading,
    this.defaultWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == Status.initial && initial != null) {
      return initial!;
    } else if (status == Status.success && success != null) {
      return success!;
    } else if (status == Status.failure && failure != null) {
      return failure!;
    } else if (status == Status.loading && loading != null) {
      return loading!;
    } else if (defaultWidget != null) {
      return defaultWidget!;
    } else {
      return const SizedBox();
    }
  }
}
