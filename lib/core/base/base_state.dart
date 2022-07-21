import 'package:equatable/equatable.dart';
import 'package:themovieapp/core/enums/status_enum.dart';

abstract class BaseState extends Equatable {
  final Status status;

  const BaseState({required this.status});
}
