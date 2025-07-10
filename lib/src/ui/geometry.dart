import 'dart:ui';
import 'package:d4rt/d4rt.dart';

/// Returns the BridgedClassDefinition for the Flutter Radius class.
BridgedClassDefinition getRadiusBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Radius,
    name: 'Radius',
    constructors: {
      'circular': (visitor, positionalArgs, namedArgs) {
        final radius = positionalArgs.get<double>(0);
        return Radius.circular(radius!);
      },
      'elliptical': (visitor, positionalArgs, namedArgs) {
        final x = positionalArgs.get<double>(0);
        final y = positionalArgs.get<double>(1);
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
