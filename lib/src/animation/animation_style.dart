import 'package:d4rt/d4rt.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_d4rt/utils/double.dart';

/// Returns all animation style bridge definitions
Map<String, dynamic> getAnimationStyleBridgingDefinitions() {
  return {'AnimationStyle': getAnimationStyleBridgingDefinition()};
}

/// Returns the BridgedClass for AnimationStyle
BridgedClass getAnimationStyleBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimationStyle,
    name: 'AnimationStyle',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final curve = namedArgs.get<Curve?>('curve');
        final duration = namedArgs.get<Duration?>('duration');
        final reverseCurve = namedArgs.get<Curve?>('reverseCurve');
        final reverseDuration = namedArgs.get<Duration?>('reverseDuration');

        return AnimationStyle(
          curve: curve,
          duration: duration,
          reverseCurve: reverseCurve,
          reverseDuration: reverseDuration,
        );
      },
    },
    getters: {
      'curve': (visitor, target) => (target as AnimationStyle).curve,
      'duration': (visitor, target) => (target as AnimationStyle).duration,
      'reverseCurve': (visitor, target) =>
          (target as AnimationStyle).reverseCurve,
      'reverseDuration': (visitor, target) =>
          (target as AnimationStyle).reverseDuration,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        final curve = namedArgs.get<Curve?>('curve');
        final duration = namedArgs.get<Duration?>('duration');
        final reverseCurve = namedArgs.get<Curve?>('reverseCurve');
        final reverseDuration = namedArgs.get<Duration?>('reverseDuration');

        return (target as AnimationStyle).copyWith(
          curve: curve,
          duration: duration,
          reverseCurve: reverseCurve,
          reverseDuration: reverseDuration,
        );
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as AnimationStyle).toString();
      },
      'debugFillProperties': (visitor, target, positionalArgs, namedArgs) {
        final properties = positionalArgs.get<dynamic>(0);
        (target as AnimationStyle).debugFillProperties(properties);
        return null;
      },
    },
    staticMethods: {
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<AnimationStyle?>(0);
        final b = positionalArgs.get<AnimationStyle?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2))!;
        return AnimationStyle.lerp(a, b, t);
      },
    },
    staticGetters: {'noAnimation': (visitor) => AnimationStyle.noAnimation},
  );
}
