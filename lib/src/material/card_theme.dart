import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClass for the Flutter CardTheme class.
BridgedClass getCardThemeBridgingDefinition() {
  return BridgedClass(
    nativeType: CardTheme,
    name: 'CardTheme',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return CardTheme(
          clipBehavior: namedArgs.get<Clip?>('clipBehavior'),
          color: namedArgs.get<Color?>('color'),
          shadowColor: namedArgs.get<Color?>('shadowColor'),
          surfaceTintColor: namedArgs.get<Color?>('surfaceTintColor'),
          elevation: namedArgs.getToDouble('elevation'),
          margin: namedArgs.get<EdgeInsetsGeometry?>('margin'),
          shape: namedArgs.get<ShapeBorder?>('shape'),
        );
      },
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs.first as BuildContext;
        return CardTheme.of(context);
      },
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs[0] as CardTheme?;
        final b = positionalArgs[1] as CardTheme?;
        final t = toDouble(positionalArgs[2]);
        return CardTheme.lerp(a, b, t);
      },
    },
    getters: {
      'clipBehavior': (visitor, target) => (target as CardTheme).clipBehavior,
      'color': (visitor, target) => (target as CardTheme).color,
      'shadowColor': (visitor, target) => (target as CardTheme).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as CardTheme).surfaceTintColor,
      'elevation': (visitor, target) => (target as CardTheme).elevation,
      'margin': (visitor, target) => (target as CardTheme).margin,
      'shape': (visitor, target) => (target as CardTheme).shape,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as CardTheme).copyWith(
          clipBehavior: namedArgs.get<Clip?>('clipBehavior'),
          color: namedArgs.get<Color?>('color'),
          shadowColor: namedArgs.get<Color?>('shadowColor'),
          surfaceTintColor: namedArgs.get<Color?>('surfaceTintColor'),
          elevation: namedArgs.getToDouble('elevation'),
          margin: namedArgs.get<EdgeInsetsGeometry?>('margin'),
          shape: namedArgs.get<ShapeBorder?>('shape'),
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter CardThemeData class (legacy alias).
BridgedClass getCardThemeDataBridgingDefinition() {
  return BridgedClass(
    nativeType: CardThemeData,
    name: 'CardThemeData',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return CardThemeData(
          clipBehavior: namedArgs.get<Clip?>('clipBehavior'),
          color: namedArgs.get<Color?>('color'),
          shadowColor: namedArgs.get<Color?>('shadowColor'),
          surfaceTintColor: namedArgs.get<Color?>('surfaceTintColor'),
          elevation: namedArgs.getToDouble('elevation'),
          margin: namedArgs.get<EdgeInsetsGeometry?>('margin'),
          shape: namedArgs.get<ShapeBorder?>('shape'),
        );
      },
    },
    staticMethods: {
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs[0] as CardThemeData?;
        final b = positionalArgs[1] as CardThemeData?;
        final t = toDouble(positionalArgs[2]);
        return CardThemeData.lerp(a, b, t);
      },
    },
    getters: {
      'clipBehavior': (visitor, target) =>
          (target as CardThemeData).clipBehavior,
      'color': (visitor, target) => (target as CardThemeData).color,
      'shadowColor': (visitor, target) => (target as CardThemeData).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as CardThemeData).surfaceTintColor,
      'elevation': (visitor, target) => (target as CardThemeData).elevation,
      'margin': (visitor, target) => (target as CardThemeData).margin,
      'shape': (visitor, target) => (target as CardThemeData).shape,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as CardThemeData).copyWith(
          clipBehavior: namedArgs.get<Clip?>('clipBehavior'),
          color: namedArgs.get<Color?>('color'),
          shadowColor: namedArgs.get<Color?>('shadowColor'),
          surfaceTintColor: namedArgs.get<Color?>('surfaceTintColor'),
          elevation: namedArgs.getToDouble('elevation'),
          margin: namedArgs.get<EdgeInsetsGeometry?>('margin'),
          shape: namedArgs.get<ShapeBorder?>('shape'),
        );
      },
    },
  );
}
