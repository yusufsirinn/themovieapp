import 'package:equatable/equatable.dart';

import '../core.dart';

abstract class BaseState extends Equatable {
  final Status status;
  const BaseState({required this.status});
}
