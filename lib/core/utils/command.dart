import 'dart:async';

import 'package:dia_app/core/utils/safe_value_notifier.dart';
import 'package:flutter/foundation.dart';
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
  ValueListenable<CommandState<T>> get state => _state;

  Future<void> execute(A arg) async {
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

final class StreamCommand<T, A> {
  final Stream<Result<T>> Function(A arg) _watch;

  StreamCommand({required Stream<Result<T>> Function(A arg) watch})
    : _watch = watch;

  bool _disposed = false;
  StreamSubscription<Result<T>>? _subscription;

  final _state = SafeValueNotifier<CommandState<T>>(CommandState.idle());
  ValueListenable<CommandState<T>> get state => _state;

  bool get isActive => _subscription != null && !_disposed;

  StreamSubscription<Result<T>> watch(A arg) {
    // Defensive check: if disposed, return an empty subscription that immediately completes
    if (_disposed) {
      return Stream<Result<T>>.empty().listen(null, onDone: () {});
    }

    // Defensive check: if already executing, return existing subscription to prevent duplicates
    // (Alternative: remove this check if you want to allow cancel-and-restart behavior)
    if (state.value is Executing<T> && _subscription != null) {
      return _subscription!;
    }

    _state.value = CommandState.executing();

    // Cancel existing subscription if any
    _subscription?.cancel();

    // Start new subscription
    return _subscription = _watch(arg).listen(
      (result) {
        if (_disposed) return;
        result.when(
          ok: (value) => _state.value = CommandState.succeeded(value),
          error: (message) => _state.value = CommandState.failed(message),
        );
      },
      // onError: (error) {
      //   if (!_disposed) {
      //     _state.value = Result.error(error.toString());
      //   }
      // },
      onDone: () {
        _subscription = null;
      },
    );
  }

  void cancel() {
    _subscription?.cancel();
    _subscription = null;
    if (!_disposed) {
      // reset the state to idle
      // this is to prevent the state from being stuck in executing state
      // if the stream is not closed
      _state.value = CommandState.idle();
    }
  }

  void dispose() {
    if (!_disposed) {
      _disposed = true;
      _subscription?.cancel();
      _subscription = null;
      _state.dispose();
    }
  }
}
