import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

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
        final minValue = positionalArgs[0] as double;
        final maxValue = positionalArgs[1] as double;
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
          confidence: namedArgs.get<double>('confidence') ?? 1.0,
          duration: namedArgs.get<Duration>('duration') ?? Duration.zero,
          offset: namedArgs.get<Offset>('offset') ?? Offset.zero,
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
