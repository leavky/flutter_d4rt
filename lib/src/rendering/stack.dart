import 'package:d4rt/d4rt.dart';
import 'package:flutter/rendering.dart';

BridgedEnumDefinition getStackFitBridgingDefinition() {
  return BridgedEnumDefinition<StackFit>(
    name: 'StackFit',
    values: StackFit.values,
    getters: {
      'name': (visitor, target) => (target as StackFit).name,
      'index': (visitor, target) => (target as StackFit).index,
    },
  );
}
