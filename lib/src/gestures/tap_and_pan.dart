import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getTapAndPanGestureRecognizerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: TapAndPanGestureRecognizer,
    name: 'TapAndPanGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return TapAndPanGestureRecognizer(debugOwner: namedArgs['debugOwner']);
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as TapAndPanGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as TapAndPanGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onTapDown': (visitor, target) =>
          (target as TapAndPanGestureRecognizer).onTapDown,
      'onTapUp': (visitor, target) =>
          (target as TapAndPanGestureRecognizer).onTapUp,
      'onDragStart': (visitor, target) =>
          (target as TapAndPanGestureRecognizer).onDragStart,
      'onDragUpdate': (visitor, target) =>
          (target as TapAndPanGestureRecognizer).onDragUpdate,
      'onDragEnd': (visitor, target) =>
          (target as TapAndPanGestureRecognizer).onDragEnd,
      'onCancel': (visitor, target) =>
          (target as TapAndPanGestureRecognizer).onCancel,
    },
  );
}
