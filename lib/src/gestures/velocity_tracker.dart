import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/double.dart';

BridgedClassDefinition getVelocityTrackerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: VelocityTracker,
    name: 'VelocityTracker',
    constructors: {
      'withKind': (visitor, positionalArgs, namedArgs) {
        final kind = positionalArgs[0] as PointerDeviceKind;
        return VelocityTracker.withKind(kind);
      },
    },
    methods: {
      'addPosition': (visitor, target, positionalArgs, namedArgs) {
        final timeStamp = positionalArgs[0] as Duration;
        final position = positionalArgs[1] as Offset;
        (target as VelocityTracker).addPosition(timeStamp, position);
        return null;
      },
      'getVelocity': (visitor, target, positionalArgs, namedArgs) {
        return (target as VelocityTracker).getVelocity();
      },
      'getVelocityEstimate': (visitor, target, positionalArgs, namedArgs) {
        return (target as VelocityTracker).getVelocityEstimate();
      },
    },
    getters: {},
  );
}

BridgedClassDefinition getVelocityBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Velocity,
    name: 'Velocity',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Velocity(
          pixelsPerSecond:
              namedArgs.get<Offset>('pixelsPerSecond') ?? Offset.zero,
        );
      },
    },
    staticMethods: {
      'zero': (visitor, positionalArgs, namedArgs) {
        return Velocity.zero;
      },
    },
    getters: {
      'pixelsPerSecond': (visitor, target) =>
          (target as Velocity).pixelsPerSecond,
    },
    methods: {
      'clampMagnitude': (visitor, target, positionalArgs, namedArgs) {
        final minValue = toDouble(positionalArgs[0]);
        final maxValue = toDouble(positionalArgs[1]);
        return (target as Velocity).clampMagnitude(minValue, maxValue);
      },
    },
  );
}

BridgedClassDefinition getVelocityEstimateBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: VelocityEstimate,
    name: 'VelocityEstimate',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return VelocityEstimate(
          pixelsPerSecond:
              namedArgs.get<Offset>('pixelsPerSecond') ?? Offset.zero,
          confidence: toDouble(namedArgs.get('confidence')),
          duration: namedArgs.get<Duration>('duration')!,
          offset: namedArgs.get<Offset>('offset')!,
        );
      },
    },
    getters: {
      'pixelsPerSecond': (visitor, target) =>
          (target as VelocityEstimate).pixelsPerSecond,
      'confidence': (visitor, target) =>
          (target as VelocityEstimate).confidence,
      'duration': (visitor, target) => (target as VelocityEstimate).duration,
      'offset': (visitor, target) => (target as VelocityEstimate).offset,
    },
  );
}
