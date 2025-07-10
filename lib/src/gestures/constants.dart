import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedEnumDefinition getDragStartBehaviorBridgingDefinition() {
  return BridgedEnumDefinition<DragStartBehavior>(
    name: 'DragStartBehavior',
    values: DragStartBehavior.values,
    getters: {
      'name': (visitor, target) => (target as DragStartBehavior).name,
      'index': (visitor, target) => (target as DragStartBehavior).index,
    },
  );
}
