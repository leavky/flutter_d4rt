import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClassDefinition for the Flutter FloatingActionButtonThemeData class.
BridgedClassDefinition getFloatingActionButtonThemeDataBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: FloatingActionButtonThemeData,
    name: 'FloatingActionButtonThemeData',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return FloatingActionButtonThemeData(
          foregroundColor: namedArgs.get<Color?>('foregroundColor'),
          backgroundColor: namedArgs.get<Color?>('backgroundColor'),
          focusColor: namedArgs.get<Color?>('focusColor'),
          hoverColor: namedArgs.get<Color?>('hoverColor'),
          splashColor: namedArgs.get<Color?>('splashColor'),
          elevation: namedArgs.getToDouble('elevation'),
          focusElevation: namedArgs.getToDouble('focusElevation'),
          hoverElevation: namedArgs.getToDouble('hoverElevation'),
          disabledElevation: namedArgs.getToDouble('disabledElevation'),
          highlightElevation: namedArgs.getToDouble('highlightElevation'),
          shape: namedArgs.get<ShapeBorder?>('shape'),
          enableFeedback: namedArgs.get<bool?>('enableFeedback'),
          iconSize: namedArgs.getToDouble('iconSize'),
          smallSizeConstraints: namedArgs.get<BoxConstraints?>(
            'smallSizeConstraints',
          ),
          largeSizeConstraints: namedArgs.get<BoxConstraints?>(
            'largeSizeConstraints',
          ),
          extendedSizeConstraints: namedArgs.get<BoxConstraints?>(
            'extendedSizeConstraints',
          ),
          extendedIconLabelSpacing: namedArgs.getToDouble(
            'extendedIconLabelSpacing',
          ),
          extendedPadding: namedArgs.get<EdgeInsetsGeometry?>(
            'extendedPadding',
          ),
          extendedTextStyle: namedArgs.get<TextStyle?>('extendedTextStyle'),
          mouseCursor: namedArgs.get<MaterialStateProperty<MouseCursor?>?>(
            'mouseCursor',
          ),
        );
      },
    },
    getters: {
      'foregroundColor': (visitor, target) =>
          (target as FloatingActionButtonThemeData).foregroundColor,
      'backgroundColor': (visitor, target) =>
          (target as FloatingActionButtonThemeData).backgroundColor,
      'focusColor': (visitor, target) =>
          (target as FloatingActionButtonThemeData).focusColor,
      'hoverColor': (visitor, target) =>
          (target as FloatingActionButtonThemeData).hoverColor,
      'splashColor': (visitor, target) =>
          (target as FloatingActionButtonThemeData).splashColor,
      'elevation': (visitor, target) =>
          (target as FloatingActionButtonThemeData).elevation,
      'focusElevation': (visitor, target) =>
          (target as FloatingActionButtonThemeData).focusElevation,
      'hoverElevation': (visitor, target) =>
          (target as FloatingActionButtonThemeData).hoverElevation,
      'disabledElevation': (visitor, target) =>
          (target as FloatingActionButtonThemeData).disabledElevation,
      'highlightElevation': (visitor, target) =>
          (target as FloatingActionButtonThemeData).highlightElevation,
      'shape': (visitor, target) =>
          (target as FloatingActionButtonThemeData).shape,
      'enableFeedback': (visitor, target) =>
          (target as FloatingActionButtonThemeData).enableFeedback,
      'iconSize': (visitor, target) =>
          (target as FloatingActionButtonThemeData).iconSize,
      'smallSizeConstraints': (visitor, target) =>
          (target as FloatingActionButtonThemeData).smallSizeConstraints,
      'largeSizeConstraints': (visitor, target) =>
          (target as FloatingActionButtonThemeData).largeSizeConstraints,
      'extendedSizeConstraints': (visitor, target) =>
          (target as FloatingActionButtonThemeData).extendedSizeConstraints,
      'extendedIconLabelSpacing': (visitor, target) =>
          (target as FloatingActionButtonThemeData).extendedIconLabelSpacing,
      'extendedPadding': (visitor, target) =>
          (target as FloatingActionButtonThemeData).extendedPadding,
      'extendedTextStyle': (visitor, target) =>
          (target as FloatingActionButtonThemeData).extendedTextStyle,
      'mouseCursor': (visitor, target) =>
          (target as FloatingActionButtonThemeData).mouseCursor,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as FloatingActionButtonThemeData).copyWith(
          foregroundColor: namedArgs.get<Color?>('foregroundColor'),
          backgroundColor: namedArgs.get<Color?>('backgroundColor'),
          focusColor: namedArgs.get<Color?>('focusColor'),
          hoverColor: namedArgs.get<Color?>('hoverColor'),
          splashColor: namedArgs.get<Color?>('splashColor'),
          elevation: namedArgs.getToDouble('elevation'),
          focusElevation: namedArgs.getToDouble('focusElevation'),
          hoverElevation: namedArgs.getToDouble('hoverElevation'),
          disabledElevation: namedArgs.getToDouble('disabledElevation'),
          highlightElevation: namedArgs.getToDouble('highlightElevation'),
          shape: namedArgs.get<ShapeBorder?>('shape'),
          enableFeedback: namedArgs.get<bool?>('enableFeedback'),
          iconSize: namedArgs.getToDouble('iconSize'),
          smallSizeConstraints: namedArgs.get<BoxConstraints?>(
            'smallSizeConstraints',
          ),
          largeSizeConstraints: namedArgs.get<BoxConstraints?>(
            'largeSizeConstraints',
          ),
          extendedSizeConstraints: namedArgs.get<BoxConstraints?>(
            'extendedSizeConstraints',
          ),
          extendedIconLabelSpacing: namedArgs.getToDouble(
            'extendedIconLabelSpacing',
          ),
          extendedPadding: namedArgs.get<EdgeInsetsGeometry?>(
            'extendedPadding',
          ),
          extendedTextStyle: namedArgs.get<TextStyle?>('extendedTextStyle'),
          mouseCursor: namedArgs.get<MaterialStateProperty<MouseCursor?>?>(
            'mouseCursor',
          ),
        );
      },
    },
    staticMethods: {
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs[0] as FloatingActionButtonThemeData?;
        final b = positionalArgs[1] as FloatingActionButtonThemeData?;
        final t = positionalArgs[2] as double;
        return FloatingActionButtonThemeData.lerp(a, b, t);
      },
    },
  );
}
