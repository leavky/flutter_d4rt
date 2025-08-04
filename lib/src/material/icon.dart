import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClass for the Flutter Icon widget.
BridgedClass getIconBridgingDefinition() {
  return BridgedClass(
    nativeType: Icon,
    name: 'Icon',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final icon = positionalArgs.get<IconData?>(0);
        final key = namedArgs.get<Key?>('key');
        final size = namedArgs.getToDouble('size');
        final color = namedArgs.get<Color?>('color');
        final semanticLabel = namedArgs.get<String?>('semanticLabel');
        final textDirection = namedArgs.get<TextDirection?>('textDirection');

        return Icon(
          icon,
          key: key,
          size: size,
          color: color,
          semanticLabel: semanticLabel,
          textDirection: textDirection,
        );
      },
    },
    getters: {
      'icon': (visitor, target) => (target as Icon).icon,
      'size': (visitor, target) => (target as Icon).size,
      'color': (visitor, target) => (target as Icon).color,
      'semanticLabel': (visitor, target) => (target as Icon).semanticLabel,
      'textDirection': (visitor, target) => (target as Icon).textDirection,
      'key': (visitor, target) => (target as Icon).key,
    },
  );
}
