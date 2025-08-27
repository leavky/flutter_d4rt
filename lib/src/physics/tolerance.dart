import 'package:d4rt/d4rt.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_d4rt/utils/double.dart';

/// Returns the BridgedClass for Tolerance
BridgedClass getToleranceBridgingDefinition() {
  return BridgedClass(
    nativeType: Tolerance,
    name: 'Tolerance',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final distance = toDouble(namedArgs.get<dynamic>('distance')) ?? 1e-3;
        final time = toDouble(namedArgs.get<dynamic>('time')) ?? 1e-3;
        final velocity = toDouble(namedArgs.get<dynamic>('velocity')) ?? 1e-3;
        return Tolerance(distance: distance, time: time, velocity: velocity);
      },
    },
    getters: {
      'distance': (visitor, target) => (target as Tolerance).distance,
      'time': (visitor, target) => (target as Tolerance).time,
      'velocity': (visitor, target) => (target as Tolerance).velocity,
    },
    methods: {
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as Tolerance).toString();
      },
    },
  );
}
