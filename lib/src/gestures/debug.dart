import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

// Module debug pour les fonctionnalités de debug des gestures

String debugDescribeGestureEvent(PointerEvent event) {
  return event.toString();
}

BridgedClass getDebugGestureHelperBridgingDefinition() {
  return BridgedClass(
    nativeType: Object,
    name: 'DebugGestureHelper',
    constructors: {},
    staticMethods: {
      'describeEvent': (visitor, positionalArgs, namedArgs) {
        final event = positionalArgs[0] as PointerEvent;
        return debugDescribeGestureEvent(event);
      },
    },
    getters: {},
  );
}
