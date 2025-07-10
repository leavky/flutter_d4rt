import 'package:d4rt/d4rt.dart';
import 'package:flutter/rendering.dart';

BridgedEnumDefinition getBlendModeBridgingDefinition() {
  return BridgedEnumDefinition<BlendMode>(
    name: 'BlendMode',
    values: BlendMode.values,
    getters: {
      'name': (visitor, target) => (target as BlendMode).name,
      'index': (visitor, target) => (target as BlendMode).index,
    },
  );
}
