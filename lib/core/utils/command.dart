import 'package:dia_app/core/utils/safe_value_notifier.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'result.dart';

part 'command.freezed.dart';

@freezed
sealed class CommandState<T> with _$CommandState<T> {
  const CommandState._();

  const factory CommandState.idle() = Idle<T>;
  const factory CommandState.executing() = Executing<T>;
  const factory CommandState.succeeded(T value) = Succeeded<T>;
  const factory CommandState.failed(String message) = Failed<T>;

  String get stateName {
    return when(
      idle: () => 'idle',
      executing: () => 'executing',
      succeeded: (value) => 'succeeded',
      failed: (message) => 'failed',
    );
  }
}

final class Command<T, A> {
  final Future<Result<T>> Function(A arg) _execute;
  Command({required Future<Result<T>> Function(A arg) execute})
    : _execute = execute;

  bool _disposed = false;

  final _state = SafeValueNotifier<CommandState<T>>(CommandState.idle());
  ValueNotifier<CommandState<T>> get state => _state;

  execute(A arg) async {
    if (_disposed) return;
    if (state.value is Executing<T>) return;

    _state.value = CommandState.executing();
    // await Future.delayed(const Duration(seconds: 2));
    // if (_disposed) return;

    final result = await _execute(arg);
    if (_disposed) return;

    result.when(
      ok: (value) => _state.value = CommandState.succeeded(value),
      error: (message) => _state.value = CommandState.failed(message),
    );
  }

  void dispose() {
    if (!_disposed) {
      _disposed = true;
      _state.dispose();
    }
  }
}
