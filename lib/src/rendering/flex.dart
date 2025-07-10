import 'package:d4rt/d4rt.dart';
import 'package:flutter/rendering.dart';

BridgedEnumDefinition getMainAxisAlignmentBridgingDefinition() {
  return BridgedEnumDefinition<MainAxisAlignment>(
    name: 'MainAxisAlignment',
    values: MainAxisAlignment.values,
    getters: {
      'name': (visitor, target) => (target as MainAxisAlignment).name,
      'index': (visitor, target) => (target as MainAxisAlignment).index,
    },
  );
}

BridgedEnumDefinition getCrossAxisAlignmentBridgingDefinition() {
  return BridgedEnumDefinition<CrossAxisAlignment>(
    name: 'CrossAxisAlignment',
    values: CrossAxisAlignment.values,
    getters: {
      'name': (visitor, target) => (target as CrossAxisAlignment).name,
      'index': (visitor, target) => (target as CrossAxisAlignment).index,
    },
  );
}

BridgedEnumDefinition getMainAxisSizeBridgingDefinition() {
  return BridgedEnumDefinition<MainAxisSize>(
    name: 'MainAxisSize',
    values: MainAxisSize.values,
    getters: {
      'name': (visitor, target) => (target as MainAxisSize).name,
      'index': (visitor, target) => (target as MainAxisSize).index,
    },
  );
}

BridgedEnumDefinition getFlexFitBridgingDefinition() {
  return BridgedEnumDefinition<FlexFit>(
    name: 'FlexFit',
    values: FlexFit.values,
    getters: {
      'name': (visitor, target) => (target as FlexFit).name,
      'index': (visitor, target) => (target as FlexFit).index,
    },
  );
}
