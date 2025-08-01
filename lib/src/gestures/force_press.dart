import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/double.dart';

BridgedClassDefinition getForcePressGestureRecognizerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ForcePressGestureRecognizer,
    name: 'ForcePressGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ForcePressGestureRecognizer(
          startPressure: toDouble(namedArgs.get('startPressure')) ?? 0.4,
          peakPressure: toDouble(namedArgs.get('peakPressure')) ?? 0.85,
        );
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as ForcePressGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as ForcePressGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onStart': (visitor, target) =>
          (target as ForcePressGestureRecognizer).onStart,
      'onUpdate': (visitor, target) =>
          (target as ForcePressGestureRecognizer).onUpdate,
      'onPeak': (visitor, target) =>
          (target as ForcePressGestureRecognizer).onPeak,
      'onEnd': (visitor, target) =>
          (target as ForcePressGestureRecognizer).onEnd,
      'startPressure': (visitor, target) =>
          (target as ForcePressGestureRecognizer).startPressure,
      'peakPressure': (visitor, target) =>
          (target as ForcePressGestureRecognizer).peakPressure,
    },
  );
}

BridgedClassDefinition getForcePressDetailsBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ForcePressDetails,
    name: 'ForcePressDetails',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ForcePressDetails(
          globalPosition:
              namedArgs.get<Offset>('globalPosition') ?? Offset.zero,
          localPosition: namedArgs['localPosition'] as Offset?,
          pressure: toDouble(namedArgs.get('pressure')),
        );
      },
    },
    getters: {
      'globalPosition': (visitor, target) =>
          (target as ForcePressDetails).globalPosition,
      'localPosition': (visitor, target) =>
          (target as ForcePressDetails).localPosition,
      'pressure': (visitor, target) => (target as ForcePressDetails).pressure,
    },
  );
}
