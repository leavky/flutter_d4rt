import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/animation/animation_controller.dart';
import 'package:flutter_d4rt/src/animation/animation_style.dart';
import 'package:flutter_d4rt/src/animation/curves.dart';

void registerAnimationBridges(D4rt interpreter) {
  interpreter.registerBridgedClass(
    getAnimationControllerBridgingDefinition(),
    'package:flutter/animation_.dart',
  );

  interpreter.registerBridgedEnum(
    getAnimationBehaviorBridgingDefinition(),
    'package:flutter/animation_.dart',
  );

  // Register AnimationStyle bridges
  final animationStyleBridges = getAnimationStyleBridgingDefinitions();
  animationStyleBridges.forEach((name, bridge) {
    if (bridge is BridgedClass) {
      interpreter.registerBridgedClass(
        bridge,
        'package:flutter/animation_.dart',
      );
    }
  });

  // Register Curves bridges
  final curvesBridges = getCurvesBridgingDefinitions();
  curvesBridges.forEach((name, bridge) {
    if (bridge is BridgedClass) {
      interpreter.registerBridgedClass(
        bridge,
        'package:flutter/animation_.dart',
      );
    }
  });
}
