import 'package:d4rt/d4rt.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_d4rt/utils/double.dart';

/// Returns the BridgedClass for Simulation
BridgedClass getSimulationBridgingDefinition() {
  return BridgedClass(
    nativeType: Simulation,
    name: 'Simulation',
    constructors: {},
    getters: {
      'tolerance': (visitor, target) => (target as Simulation).tolerance,
    },
    setters: {
      'tolerance': (visitor, target, value) {
        (target as Simulation).tolerance = value as Tolerance;
      },
    },
    methods: {
      'x': (visitor, target, positionalArgs, namedArgs) {
        final time = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Simulation).x(time);
      },
      'dx': (visitor, target, positionalArgs, namedArgs) {
        final time = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Simulation).dx(time);
      },
      'isDone': (visitor, target, positionalArgs, namedArgs) {
        final time = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Simulation).isDone(time);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as Simulation).toString();
      },
    },
  );
}
