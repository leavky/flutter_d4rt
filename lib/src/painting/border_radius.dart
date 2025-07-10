import 'package:d4rt/d4rt.dart';
import 'package:flutter/painting.dart';

/// Returns the BridgedClassDefinition for the Flutter BorderRadius class.
BridgedClassDefinition getBorderRadiusBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: BorderRadius,
    name: 'BorderRadius',
    constructors: {
      'all': (visitor, positionalArgs, namedArgs) {
        final radius = positionalArgs.get<Radius>(0);
        return BorderRadius.all(radius!);
      },
      'circular': (visitor, positionalArgs, namedArgs) {
        final radius = positionalArgs.get<double>(0);
        return BorderRadius.circular(radius!);
      },
      'horizontal': (visitor, positionalArgs, namedArgs) {
        final left = namedArgs.get<Radius?>('left') ?? Radius.zero;
        final right = namedArgs.get<Radius?>('right') ?? Radius.zero;
        return BorderRadius.horizontal(left: left, right: right);
      },
      'vertical': (visitor, positionalArgs, namedArgs) {
        final top = namedArgs.get<Radius?>('top') ?? Radius.zero;
        final bottom = namedArgs.get<Radius?>('bottom') ?? Radius.zero;
        return BorderRadius.vertical(top: top, bottom: bottom);
      },
      'only': (visitor, positionalArgs, namedArgs) {
        final topLeft = namedArgs.get<Radius?>('topLeft') ?? Radius.zero;
        final topRight = namedArgs.get<Radius?>('topRight') ?? Radius.zero;
        final bottomLeft = namedArgs.get<Radius?>('bottomLeft') ?? Radius.zero;
        final bottomRight =
            namedArgs.get<Radius?>('bottomRight') ?? Radius.zero;
        return BorderRadius.only(
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight,
        );
      },
      'zero': (visitor, positionalArgs, namedArgs) {
        return BorderRadius.zero;
      },
    },
    getters: {
      'topLeft': (visitor, target) => (target as BorderRadius).topLeft,
      'topRight': (visitor, target) => (target as BorderRadius).topRight,
      'bottomLeft': (visitor, target) => (target as BorderRadius).bottomLeft,
      'bottomRight': (visitor, target) => (target as BorderRadius).bottomRight,
    },
  );
}
