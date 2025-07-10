import 'package:d4rt/d4rt.dart';
import 'package:flutter/rendering.dart';

BridgedEnumDefinition getDecorationPositionBridgingDefinition() {
  return BridgedEnumDefinition<DecorationPosition>(
    name: 'DecorationPosition',
    values: DecorationPosition.values,
    getters: {
      'name': (visitor, target) => (target as DecorationPosition).name,
      'index': (visitor, target) => (target as DecorationPosition).index,
    },
  );
}
