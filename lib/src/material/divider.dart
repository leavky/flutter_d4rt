import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClassDefinition for the Flutter Divider widget.
BridgedClassDefinition getDividerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Divider,
    name: 'Divider',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final height = namedArgs.getToDouble('height');
        final thickness = namedArgs.getToDouble('thickness');
        final indent = namedArgs.getToDouble('indent');
        final endIndent = namedArgs.getToDouble('endIndent');
        final color = namedArgs.get<Color?>('color');

        return Divider(
          key: key,
          height: height,
          thickness: thickness,
          indent: indent,
          endIndent: endIndent,
          color: color,
        );
      },
    },
    getters: {
      'height': (visitor, target) => (target as Divider).height,
      'thickness': (visitor, target) => (target as Divider).thickness,
      'indent': (visitor, target) => (target as Divider).indent,
      'endIndent': (visitor, target) => (target as Divider).endIndent,
      'color': (visitor, target) => (target as Divider).color,
      'key': (visitor, target) => (target as Divider).key,
    },
  );
}
