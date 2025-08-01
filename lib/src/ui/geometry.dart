import 'dart:ui';
import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/utils/double.dart';

/// Returns the BridgedClassDefinition for the Flutter Radius class.
BridgedClassDefinition getRadiusBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Radius,
    name: 'Radius',
    constructors: {
      'circular': (visitor, positionalArgs, namedArgs) {
        final radius = toDouble(positionalArgs.get(0));
        return Radius.circular(radius!);
      },
      'elliptical': (visitor, positionalArgs, namedArgs) {
        final x = toDouble(positionalArgs.get(0));
        final y = toDouble(positionalArgs.get(1));
        return Radius.elliptical(x!, y!);
      },
      'zero': (visitor, positionalArgs, namedArgs) {
        return Radius.zero;
      },
    },
    getters: {
      'x': (visitor, target) => (target as Radius).x,
      'y': (visitor, target) => (target as Radius).y,
    },
  );
}
