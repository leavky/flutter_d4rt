import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

BridgedEnumDefinition getButtonTextThemeBridgingDefinition() {
  return BridgedEnumDefinition<ButtonTextTheme>(
    name: 'ButtonTextTheme',
    values: ButtonTextTheme.values,
    getters: {
      'name': (visitor, target) => (target as ButtonTextTheme).name,
      'index': (visitor, target) => (target as ButtonTextTheme).index,
    },
  );
}
