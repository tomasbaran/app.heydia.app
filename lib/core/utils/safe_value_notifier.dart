import 'package:flutter/material.dart';

class SafeValueNotifier<T> extends ValueNotifier<T> {
  bool _disposed = false;

  SafeValueNotifier(super.value);

  @override
  set value(T newValue) {
    if (_disposed) return;
    super.value = newValue;
  }

  @override
  void notifyListeners() {
    if (_disposed) return; // ← CRITICAL: Prevent notifications after disposal
    super.notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
