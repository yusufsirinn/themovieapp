import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<T> droppableTransformer<T>() {
  return ((events, mapper) {
    return droppable<T>().call(events.throttle(const Duration(milliseconds: 200)), mapper);
  });
}
