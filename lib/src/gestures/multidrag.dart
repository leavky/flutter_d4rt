import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClass getMultiDragGestureRecognizerBridgingDefinition() {
  return BridgedClass(
    nativeType: MultiDragGestureRecognizer,
    name: 'MultiDragGestureRecognizer',
    constructors: {},
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as MultiDragGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as MultiDragGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {},
  );
}

BridgedClass getImmediateMultiDragGestureRecognizerBridgingDefinition() {
  return BridgedClass(
    nativeType: ImmediateMultiDragGestureRecognizer,
    name: 'ImmediateMultiDragGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ImmediateMultiDragGestureRecognizer(
          debugOwner: namedArgs['debugOwner'],
        );
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as ImmediateMultiDragGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as ImmediateMultiDragGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onStart': (visitor, target) =>
          (target as ImmediateMultiDragGestureRecognizer).onStart,
    },
  );
}

BridgedClass getHorizontalMultiDragGestureRecognizerBridgingDefinition() {
  return BridgedClass(
    nativeType: HorizontalMultiDragGestureRecognizer,
    name: 'HorizontalMultiDragGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return HorizontalMultiDragGestureRecognizer(
          debugOwner: namedArgs['debugOwner'],
        );
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as HorizontalMultiDragGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as HorizontalMultiDragGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onStart': (visitor, target) =>
          (target as HorizontalMultiDragGestureRecognizer).onStart,
    },
  );
}

BridgedClass getVerticalMultiDragGestureRecognizerBridgingDefinition() {
  return BridgedClass(
    nativeType: VerticalMultiDragGestureRecognizer,
    name: 'VerticalMultiDragGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return VerticalMultiDragGestureRecognizer(
          debugOwner: namedArgs['debugOwner'],
        );
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as VerticalMultiDragGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as VerticalMultiDragGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onStart': (visitor, target) =>
          (target as VerticalMultiDragGestureRecognizer).onStart,
    },
  );
}

BridgedClass getDelayedMultiDragGestureRecognizerBridgingDefinition() {
  return BridgedClass(
    nativeType: DelayedMultiDragGestureRecognizer,
    name: 'DelayedMultiDragGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return DelayedMultiDragGestureRecognizer(
          delay: namedArgs['delay'] as Duration,
          debugOwner: namedArgs['debugOwner'],
        );
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as DelayedMultiDragGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as DelayedMultiDragGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onStart': (visitor, target) =>
          (target as DelayedMultiDragGestureRecognizer).onStart,
      'delay': (visitor, target) =>
          (target as DelayedMultiDragGestureRecognizer).delay,
    },
  );
}
