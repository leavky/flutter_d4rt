import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClassDefinition for the Flutter Container widget.
BridgedClassDefinition getContainerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Container,
    name: 'Container',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);
        final alignment = namedArgs.get<AlignmentGeometry?>('alignment');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final color = namedArgs.get<Color?>('color');
        final decoration = namedArgs.get<Decoration?>('decoration');
        final foregroundDecoration = namedArgs.get<Decoration?>(
          'foregroundDecoration',
        );
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final margin = namedArgs.get<EdgeInsetsGeometry?>('margin');
        final transform = namedArgs.get<Matrix4?>('transform');
        final transformAlignment = namedArgs.get<AlignmentGeometry?>(
          'transformAlignment',
        );
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;

        return Container(
          key: key,
          alignment: alignment,
          padding: padding,
          color: color,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          width: width,
          height: height,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          clipBehavior: clipBehavior,
          child: child,
        );
      },
    },
    getters: {
      'alignment': (visitor, target) => (target as Container).alignment,
      'padding': (visitor, target) => (target as Container).padding,
      'color': (visitor, target) => (target as Container).color,
      'decoration': (visitor, target) => (target as Container).decoration,
      'foregroundDecoration': (visitor, target) =>
          (target as Container).foregroundDecoration,
      'margin': (visitor, target) => (target as Container).margin,
      'transform': (visitor, target) => (target as Container).transform,
      'transformAlignment': (visitor, target) =>
          (target as Container).transformAlignment,
      'clipBehavior': (visitor, target) => (target as Container).clipBehavior,
      'child': (visitor, target) => (target as Container).child,
      'key': (visitor, target) => (target as Container).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter DecoratedBox widget.
BridgedClassDefinition getDecoratedBoxBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DecoratedBox,
    name: 'DecoratedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final decoration = namedArgs.get<Decoration?>('decoration');
        final position =
            namedArgs.get<DecorationPosition?>('position') ??
            DecorationPosition.background;

        final child = visitor.toWidgets(namedArgs['child']);
        return DecoratedBox(
          key: key,
          decoration: decoration!,
          position: position,
          child: child,
        );
      },
    },
    getters: {
      'decoration': (visitor, target) => (target as DecoratedBox).decoration,
      'position': (visitor, target) => (target as DecoratedBox).position,
      'child': (visitor, target) => (target as DecoratedBox).child,
      'key': (visitor, target) => (target as DecoratedBox).key,
    },
  );
}
