// ignore_for_file: invalid_use_of_protected_member

import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClass getGestureRecognizerBridgingDefinition() {
  return BridgedClass(
    nativeType: GestureRecognizer,
    name: 'GestureRecognizer',
    constructors: {},
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as GestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as GestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'debugOwner': (visitor, target) =>
          (target as GestureRecognizer).debugOwner,
    },
  );
}

BridgedClass getOneSequenceGestureRecognizerBridgingDefinition() {
  return BridgedClass(
    nativeType: OneSequenceGestureRecognizer,
    name: 'OneSequenceGestureRecognizer',
    constructors: {},
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as OneSequenceGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as OneSequenceGestureRecognizer).dispose();
        return null;
      },
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final disposition = positionalArgs[0] as GestureDisposition;
        (target as OneSequenceGestureRecognizer).resolve(disposition);
        return null;
      },
    },
    getters: {},
  );
}

BridgedClass getPrimaryPointerGestureRecognizerBridgingDefinition() {
  return BridgedClass(
    nativeType: PrimaryPointerGestureRecognizer,
    name: 'PrimaryPointerGestureRecognizer',
    constructors: {},
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as PrimaryPointerGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as PrimaryPointerGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'deadline': (visitor, target) =>
          (target as PrimaryPointerGestureRecognizer).deadline,
      'preAcceptSlopTolerance': (visitor, target) =>
          (target as PrimaryPointerGestureRecognizer).preAcceptSlopTolerance,
      'postAcceptSlopTolerance': (visitor, target) =>
          (target as PrimaryPointerGestureRecognizer).postAcceptSlopTolerance,
    },
  );
}

BridgedEnumDefinition getGestureRecognizerStateBridgingDefinition() {
  return BridgedEnumDefinition<GestureRecognizerState>(
    name: 'GestureRecognizerState',
    values: GestureRecognizerState.values,
    getters: {
      'name': (visitor, target) => (target as GestureRecognizerState).name,
      'index': (visitor, target) => (target as GestureRecognizerState).index,
    },
  );
}
