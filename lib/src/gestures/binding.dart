import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClass getGestureBindingBridgingDefinition() {
  return BridgedClass(
    nativeType: GestureBinding,
    name: 'GestureBinding',
    constructors: {},
    methods: {
      'handlePointerEvent': (visitor, target, positionalArgs, namedArgs) {
        final event = positionalArgs[0] as PointerEvent;
        (target as GestureBinding).handlePointerEvent(event);
        return null;
      },
      'dispatchEvent': (visitor, target, positionalArgs, namedArgs) {
        final event = positionalArgs[0] as PointerEvent;
        final hitTestResult = positionalArgs[1] as HitTestResult;
        (target as GestureBinding).dispatchEvent(event, hitTestResult);
        return null;
      },
    },
    getters: {
      'gestureArena': (visitor, target) =>
          (target as GestureBinding).gestureArena,
      'pointerRouter': (visitor, target) =>
          (target as GestureBinding).pointerRouter,
      'pointerSignalResolver': (visitor, target) =>
          (target as GestureBinding).pointerSignalResolver,
    },
  );
}
