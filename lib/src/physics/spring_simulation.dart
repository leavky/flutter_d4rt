import 'package:d4rt/d4rt.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_d4rt/utils/double.dart';

/// Returns the BridgedEnumDefinition for SpringType
BridgedEnumDefinition getSpringTypeBridgingDefinition() {
  return BridgedEnumDefinition<SpringType>(
    name: 'SpringType',
    values: SpringType.values,
  );
}

/// Returns the BridgedClass for SpringSimulation
BridgedClass getSpringSimulationBridgingDefinition() {
  return BridgedClass(
    nativeType: SpringSimulation,
    name: 'SpringSimulation',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final spring = positionalArgs.get<SpringDescription>(0)!;
        final start = toDouble(positionalArgs.get<dynamic>(1))!;
        final end = toDouble(positionalArgs.get<dynamic>(2))!;
        final velocity = toDouble(positionalArgs.get<dynamic>(3))!;
        final tolerance = namedArgs.get<Tolerance>('tolerance');

        final simulation = SpringSimulation(spring, start, end, velocity);
        if (tolerance != null) {
          simulation.tolerance = tolerance;
        }
        return simulation;
      },
    },
    getters: {
      'type': (visitor, target) => (target as SpringSimulation).type,
      'tolerance': (visitor, target) => (target as SpringSimulation).tolerance,
    },
    setters: {
      'tolerance': (visitor, target, value) {
        (target as SpringSimulation).tolerance = value as Tolerance;
      },
    },
    methods: {
      'x': (visitor, target, positionalArgs, namedArgs) {
        final time = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as SpringSimulation).x(time);
      },
      'dx': (visitor, target, positionalArgs, namedArgs) {
        final time = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as SpringSimulation).dx(time);
      },
      'isDone': (visitor, target, positionalArgs, namedArgs) {
        final time = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as SpringSimulation).isDone(time);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as SpringSimulation).toString();
      },
    },
  );
}

/// Returns the BridgedClass for SpringDescription
BridgedClass getSpringDescriptionBridgingDefinition() {
  return BridgedClass(
    nativeType: SpringDescription,
    name: 'SpringDescription',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final mass = toDouble(namedArgs.get<dynamic>('mass'))!;
        final stiffness = toDouble(namedArgs.get<dynamic>('stiffness'))!;
        final damping = toDouble(namedArgs.get<dynamic>('damping'))!;
        return SpringDescription(
          mass: mass,
          stiffness: stiffness,
          damping: damping,
        );
      },
      'withDampingRatio': (visitor, positionalArgs, namedArgs) {
        final mass = toDouble(namedArgs.get<dynamic>('mass'))!;
        final stiffness = toDouble(namedArgs.get<dynamic>('stiffness'))!;
        final ratio = toDouble(namedArgs.get<dynamic>('ratio')) ?? 1.0;
        return SpringDescription.withDampingRatio(
          mass: mass,
          stiffness: stiffness,
          ratio: ratio,
        );
      },
    },
    getters: {
      'mass': (visitor, target) => (target as SpringDescription).mass,
      'stiffness': (visitor, target) => (target as SpringDescription).stiffness,
      'damping': (visitor, target) => (target as SpringDescription).damping,
    },
    methods: {
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as SpringDescription).toString();
      },
    },
  );
}
