import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClassDefinition for the Flutter Card widget.
BridgedClassDefinition getCardBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Card,
    name: 'Card',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final color = namedArgs.get<Color?>('color');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final elevation = namedArgs.getToDouble('elevation');
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final borderOnForeground =
            namedArgs.get<bool?>('borderOnForeground') ?? true;
        final margin = namedArgs.get<EdgeInsetsGeometry?>('margin');
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior');
        final semanticContainer =
            namedArgs.get<bool?>('semanticContainer') ?? true;
        final child = visitor.toWidgets(namedArgs['child']);

        return Card(
          key: key,
          color: color,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          elevation: elevation,
          shape: shape,
          borderOnForeground: borderOnForeground,
          margin: margin,
          clipBehavior: clipBehavior,
          semanticContainer: semanticContainer,
          child: child,
        );
      },
    },
    getters: {
      'color': (visitor, target) => (target as Card).color,
      'shadowColor': (visitor, target) => (target as Card).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as Card).surfaceTintColor,
      'elevation': (visitor, target) => (target as Card).elevation,
      'shape': (visitor, target) => (target as Card).shape,
      'borderOnForeground': (visitor, target) =>
          (target as Card).borderOnForeground,
      'margin': (visitor, target) => (target as Card).margin,
      'clipBehavior': (visitor, target) => (target as Card).clipBehavior,
      'child': (visitor, target) => (target as Card).child,
      'key': (visitor, target) => (target as Card).key,
    },
  );
}
