import 'package:d4rt/d4rt.dart';
import 'package:flutter/rendering.dart';

BridgedEnumDefinition getWrapAlignmentBridgingDefinition() {
  return BridgedEnumDefinition<WrapAlignment>(
    name: 'WrapAlignment',
    values: WrapAlignment.values,
    getters: {
      'name': (visitor, target) => (target as WrapAlignment).name,
      'index': (visitor, target) => (target as WrapAlignment).index,
    },
  );
}

BridgedEnumDefinition getWrapCrossAlignmentBridgingDefinition() {
  return BridgedEnumDefinition<WrapCrossAlignment>(
    name: 'WrapCrossAlignment',
    values: WrapCrossAlignment.values,
    getters: {
      'name': (visitor, target) => (target as WrapCrossAlignment).name,
      'index': (visitor, target) => (target as WrapCrossAlignment).index,
    },
  );
}
