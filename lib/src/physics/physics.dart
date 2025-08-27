import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/physics/simulation.dart';
import 'package:flutter_d4rt/src/physics/spring_simulation.dart';
import 'package:flutter_d4rt/src/physics/tolerance.dart';

void registerPhysicsBridges(D4rt interpreter) {
  interpreter.registerBridgedClass(
    getSimulationBridgingDefinition(),
    'package:flutter/physics_.dart',
  );
  interpreter.registerBridgedClass(
    getSpringDescriptionBridgingDefinition(),
    'package:flutter/physics_.dart',
  );
  interpreter.registerBridgedClass(
    getSpringSimulationBridgingDefinition(),
    'package:flutter/physics_.dart',
  );
  interpreter.registerBridgedEnum(
    getSpringTypeBridgingDefinition(),
    'package:flutter/physics_.dart',
  );
  interpreter.registerBridgedClass(
    getToleranceBridgingDefinition(),
    'package:flutter/physics_.dart',
  );
}
