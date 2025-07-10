import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

BridgedEnumDefinition getSnackBarBehaviorBridgingDefinition() {
  return BridgedEnumDefinition<SnackBarBehavior>(
    name: 'SnackBarBehavior',
    values: SnackBarBehavior.values,
    getters: {
      'name': (visitor, target) => (target as SnackBarBehavior).name,
      'index': (visitor, target) => (target as SnackBarBehavior).index,
    },
  );
}
