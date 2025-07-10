import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

BridgedClassDefinition getTextBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Text,
    name: 'Text',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        if (positionalArgs.isNotEmpty && positionalArgs[0] is String) {
          final String data = positionalArgs[0] as String;

          // Handling simple named arguments for Text (like textAlign)
          TextAlign? textAlign;
          if (namedArgs['textAlign'] is int) {
            final int index = namedArgs['textAlign'] as int;
            if (index >= 0 && index < TextAlign.values.length) {
              textAlign = TextAlign.values[index];
            }
          }

          TextStyle? style;
          if (namedArgs['style'] is TextStyle) {
            style = namedArgs['style'] as TextStyle;
          }

          return Text(data, textAlign: textAlign, style: style);
        }
        throw ArgumentError(
          'Text constructor requires at least a String data argument.',
        );
      },
    },

    getters: {
      'data': (visitor, target) {
        if (target is Text) {
          return target.data;
        }
        throw TypeError();
      },
    },
  );
}
