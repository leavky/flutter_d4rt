import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

BridgedEnumDefinition getBrightnessBridgingDefinition() {
  return BridgedEnumDefinition<Brightness>(
    name: 'Brightness',
    values: Brightness.values,
    getters: {
      'name': (visitor, target) => (target as Brightness).name,
      'index': (visitor, target) => (target as Brightness).index,
    },
  );
}
