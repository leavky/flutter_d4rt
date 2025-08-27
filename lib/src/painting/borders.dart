import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClass for the Flutter BorderSide class.
BridgedClass getBorderSideBridgingDefinition() {
  return BridgedClass(
    nativeType: BorderSide,
    name: 'BorderSide',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final color = namedArgs.get<Color?>('color') ?? const Color(0xFF000000);
        final width = namedArgs.getToDouble('width') ?? 1.0;
        final style = namedArgs.get<BorderStyle?>('style') ?? BorderStyle.solid;
        final strokeAlign =
            namedArgs.getToDouble('strokeAlign') ??
            BorderSide.strokeAlignInside;
        return BorderSide(
          color: color,
          width: width,
          style: style,
          strokeAlign: strokeAlign,
        );
      },
      'none': (visitor, positionalArgs, namedArgs) {
        return BorderSide.none;
      },
    },
    getters: {
      'color': (visitor, target) => (target as BorderSide).color,
      'width': (visitor, target) => (target as BorderSide).width,
      'style': (visitor, target) => (target as BorderSide).style,
      'strokeAlign': (visitor, target) => (target as BorderSide).strokeAlign,
    },
  );
}

/// Returns the BridgedClass for the Flutter RoundedRectangleBorder class.
BridgedClass getRoundedRectangleBorderBridgingDefinition() {
  return BridgedClass(
    nativeType: RoundedRectangleBorder,
    name: 'RoundedRectangleBorder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return RoundedRectangleBorder(
          side: namedArgs['side'] as BorderSide? ?? BorderSide.none,
          borderRadius:
              namedArgs['borderRadius'] as BorderRadius? ?? BorderRadius.zero,
        );
      },
    },
    getters: {
      'side': (visitor, target) => (target as RoundedRectangleBorder).side,
      'borderRadius': (visitor, target) =>
          (target as RoundedRectangleBorder).borderRadius,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as RoundedRectangleBorder).copyWith(
          side: namedArgs['side'] as BorderSide?,
          borderRadius: namedArgs['borderRadius'] as BorderRadius?,
        );
      },
      'scale': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.first);
        return (target as RoundedRectangleBorder).scale(t);
      },
      'lerpFrom': (visitor, target, positionalArgs, namedArgs) {
        final a = positionalArgs[0] as ShapeBorder?;
        final t = toDouble(positionalArgs[1]);
        return (target as RoundedRectangleBorder).lerpFrom(a, t);
      },
      'lerpTo': (visitor, target, positionalArgs, namedArgs) {
        final b = positionalArgs[0] as ShapeBorder?;
        final t = toDouble(positionalArgs[1]);
        return (target as RoundedRectangleBorder).lerpTo(b, t);
      },
      'getInnerPath': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs[0] as Rect;
        final textDirection = positionalArgs.length > 1
            ? positionalArgs[1] as TextDirection?
            : null;
        return (target as RoundedRectangleBorder).getInnerPath(
          rect,
          textDirection: textDirection,
        );
      },
      'getOuterPath': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs[0] as Rect;
        final textDirection = positionalArgs.length > 1
            ? positionalArgs[1] as TextDirection?
            : null;
        return (target as RoundedRectangleBorder).getOuterPath(
          rect,
          textDirection: textDirection,
        );
      },
      'paint': (visitor, target, positionalArgs, namedArgs) {
        final canvas = positionalArgs[0] as Canvas;
        final rect = positionalArgs[1] as Rect;
        final textDirection = positionalArgs.length > 2
            ? positionalArgs[2] as TextDirection?
            : null;
        (target as RoundedRectangleBorder).paint(
          canvas,
          rect,
          textDirection: textDirection,
        );
        return null;
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter CircleBorder class.
BridgedClass getCircleBorderBridgingDefinition() {
  return BridgedClass(
    nativeType: CircleBorder,
    name: 'CircleBorder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return CircleBorder(
          side: namedArgs['side'] as BorderSide? ?? BorderSide.none,
        );
      },
    },
    getters: {'side': (visitor, target) => (target as CircleBorder).side},
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as CircleBorder).copyWith(
          side: namedArgs['side'] as BorderSide?,
        );
      },
      'scale': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.first);
        return (target as CircleBorder).scale(t);
      },
      'lerpFrom': (visitor, target, positionalArgs, namedArgs) {
        final a = positionalArgs[0] as ShapeBorder?;
        final t = toDouble(positionalArgs[1]);
        return (target as CircleBorder).lerpFrom(a, t);
      },
      'lerpTo': (visitor, target, positionalArgs, namedArgs) {
        final b = positionalArgs[0] as ShapeBorder?;
        final t = toDouble(positionalArgs[1]);
        return (target as CircleBorder).lerpTo(b, t);
      },
      'getInnerPath': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs[0] as Rect;
        final textDirection = positionalArgs.length > 1
            ? positionalArgs[1] as TextDirection?
            : null;
        return (target as CircleBorder).getInnerPath(
          rect,
          textDirection: textDirection,
        );
      },
      'getOuterPath': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs[0] as Rect;
        final textDirection = positionalArgs.length > 1
            ? positionalArgs[1] as TextDirection?
            : null;
        return (target as CircleBorder).getOuterPath(
          rect,
          textDirection: textDirection,
        );
      },
      'paint': (visitor, target, positionalArgs, namedArgs) {
        final canvas = positionalArgs[0] as Canvas;
        final rect = positionalArgs[1] as Rect;
        final textDirection = positionalArgs.length > 2
            ? positionalArgs[2] as TextDirection?
            : null;
        (target as CircleBorder).paint(
          canvas,
          rect,
          textDirection: textDirection,
        );
        return null;
      },
    },
  );
}
