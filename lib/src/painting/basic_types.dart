import 'package:d4rt/d4rt.dart';
import 'package:flutter/painting.dart';

BridgedEnumDefinition getVerticalDirectionBridgingDefinition() {
  return BridgedEnumDefinition<VerticalDirection>(
    name: 'VerticalDirection',
    values: VerticalDirection.values,
    getters: {
      'name': (visitor, target) => (target as VerticalDirection).name,
      'index': (visitor, target) => (target as VerticalDirection).index,
    },
  );
}

BridgedEnumDefinition getAxisBridgingDefinition() {
  return BridgedEnumDefinition<Axis>(
    name: 'Axis',
    values: Axis.values,
    getters: {
      'name': (visitor, target) => (target as Axis).name,
      'index': (visitor, target) => (target as Axis).index,
    },
  );
}
