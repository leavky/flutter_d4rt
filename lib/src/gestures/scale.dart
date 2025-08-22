import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/double.dart';

BridgedClass getScaleGestureRecognizerBridgingDefinition() {
  return BridgedClass(
    nativeType: ScaleGestureRecognizer,
    name: 'ScaleGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ScaleGestureRecognizer(debugOwner: namedArgs['debugOwner']);
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as ScaleGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as ScaleGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onStart': (visitor, target) =>
          (target as ScaleGestureRecognizer).onStart,
      'onUpdate': (visitor, target) =>
          (target as ScaleGestureRecognizer).onUpdate,
      'onEnd': (visitor, target) => (target as ScaleGestureRecognizer).onEnd,
    },
  );
}

BridgedClass getScaleStartDetailsBridgingDefinition() {
  return BridgedClass(
    nativeType: ScaleStartDetails,
    name: 'ScaleStartDetails',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ScaleStartDetails(
          focalPoint: namedArgs.get<Offset>('focalPoint') ?? Offset.zero,
          localFocalPoint: namedArgs['localFocalPoint'] as Offset?,
          pointerCount: namedArgs.get<int?>('pointerCount') ?? 1,
        );
      },
    },
    getters: {
      'focalPoint': (visitor, target) =>
          (target as ScaleStartDetails).focalPoint,
      'localFocalPoint': (visitor, target) =>
          (target as ScaleStartDetails).localFocalPoint,
      'pointerCount': (visitor, target) =>
          (target as ScaleStartDetails).pointerCount,
    },
  );
}

BridgedClass getScaleUpdateDetailsBridgingDefinition() {
  return BridgedClass(
    nativeType: ScaleUpdateDetails,
    name: 'ScaleUpdateDetails',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ScaleUpdateDetails(
          focalPoint: namedArgs.get<Offset>('focalPoint') ?? Offset.zero,
          localFocalPoint: namedArgs['localFocalPoint'] as Offset?,
          scale: toDouble(namedArgs.get<dynamic>('scale')) ?? 1.0,
          horizontalScale:
              toDouble(namedArgs.get<dynamic>('horizontalScale')) ?? 1.0,
          verticalScale:
              toDouble(namedArgs.get<dynamic>('verticalScale')) ?? 1.0,
          rotation: toDouble(namedArgs.get<dynamic>('rotation')) ?? 0.0,
          pointerCount: namedArgs.get<int?>('pointerCount') ?? 0,
          focalPointDelta:
              namedArgs.get<Offset?>('focalPointDelta') ?? Offset.zero,
        );
      },
    },
    getters: {
      'focalPoint': (visitor, target) =>
          (target as ScaleUpdateDetails).focalPoint,
      'localFocalPoint': (visitor, target) =>
          (target as ScaleUpdateDetails).localFocalPoint,
      'scale': (visitor, target) => (target as ScaleUpdateDetails).scale,
      'horizontalScale': (visitor, target) =>
          (target as ScaleUpdateDetails).horizontalScale,
      'verticalScale': (visitor, target) =>
          (target as ScaleUpdateDetails).verticalScale,
      'rotation': (visitor, target) => (target as ScaleUpdateDetails).rotation,
      'pointerCount': (visitor, target) =>
          (target as ScaleUpdateDetails).pointerCount,
      'focalPointDelta': (visitor, target) =>
          (target as ScaleUpdateDetails).focalPointDelta,
    },
  );
}

BridgedClass getScaleEndDetailsBridgingDefinition() {
  return BridgedClass(
    nativeType: ScaleEndDetails,
    name: 'ScaleEndDetails',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ScaleEndDetails(
          velocity: namedArgs.get<Velocity>('velocity') ?? Velocity.zero,
          scaleVelocity:
              toDouble(namedArgs.get<dynamic>('scaleVelocity')) ?? 0.0,
          pointerCount: namedArgs.get<int?>('pointerCount') ?? 0,
        );
      },
    },
    getters: {
      'velocity': (visitor, target) => (target as ScaleEndDetails).velocity,
      'scaleVelocity': (visitor, target) =>
          (target as ScaleEndDetails).scaleVelocity,
      'pointerCount': (visitor, target) =>
          (target as ScaleEndDetails).pointerCount,
    },
  );
}
