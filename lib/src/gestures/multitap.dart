import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClass getMultiTapGestureRecognizerBridgingDefinition() {
  return BridgedClass(
    nativeType: MultiTapGestureRecognizer,
    name: 'MultiTapGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return MultiTapGestureRecognizer(
          longTapDelay:
              (namedArgs['longTapDelay'] as Duration?) ?? Duration.zero,
          debugOwner: namedArgs['debugOwner'],
        );
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as MultiTapGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as MultiTapGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onTapDown': (visitor, target) =>
          (target as MultiTapGestureRecognizer).onTapDown,
      'onTapUp': (visitor, target) =>
          (target as MultiTapGestureRecognizer).onTapUp,
      'onTap': (visitor, target) => (target as MultiTapGestureRecognizer).onTap,
      'onTapCancel': (visitor, target) =>
          (target as MultiTapGestureRecognizer).onTapCancel,
      'onLongTapDown': (visitor, target) =>
          (target as MultiTapGestureRecognizer).onLongTapDown,
      'longTapDelay': (visitor, target) =>
          (target as MultiTapGestureRecognizer).longTapDelay,
    },
  );
}

BridgedClass getSerialTapGestureRecognizerBridgingDefinition() {
  return BridgedClass(
    nativeType: SerialTapGestureRecognizer,
    name: 'SerialTapGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return SerialTapGestureRecognizer(debugOwner: namedArgs['debugOwner']);
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as SerialTapGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as SerialTapGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onSerialTapDown': (visitor, target) =>
          (target as SerialTapGestureRecognizer).onSerialTapDown,
      'onSerialTapCancel': (visitor, target) =>
          (target as SerialTapGestureRecognizer).onSerialTapCancel,
      'onSerialTapUp': (visitor, target) =>
          (target as SerialTapGestureRecognizer).onSerialTapUp,
    },
  );
}
