import 'dart:ui';
import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/list.dart';

/// Returns the BridgedClass for the Flutter Color class.
BridgedClass getColorBridgingDefinition() {
  return BridgedClass(
    nativeType: Color,
    name: 'Color',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.get<int>(0);
        return Color(value!);
      },
      'fromARGB': (visitor, positionalArgs, namedArgs) {
        final alpha = positionalArgs.get<int>(0);
        final red = positionalArgs.get<int>(1);
        final green = positionalArgs.get<int>(2);
        final blue = positionalArgs.get<int>(3);
        return Color.fromARGB(alpha!, red!, green!, blue!);
      },
      'fromRGBO': (visitor, positionalArgs, namedArgs) {
        final red = positionalArgs.get<int>(0);
        final green = positionalArgs.get<int>(1);
        final blue = positionalArgs.get<int>(2);
        final opacity = toDouble(positionalArgs.get<dynamic>(3));
        return Color.fromRGBO(red!, green!, blue!, opacity!);
      },
      'lerp': (visitor, positionalArgs, namedArgs) {
        final x = positionalArgs.get<Color?>(0);
        final y = positionalArgs.get<Color?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2));
        return Color.lerp(x, y, t!);
      },
    },
    getters: {
      'alpha': (visitor, target) => (target as Color).alpha,
      'red': (visitor, target) => (target as Color).red,
      'green': (visitor, target) => (target as Color).green,
      'blue': (visitor, target) => (target as Color).blue,
      'opacity': (visitor, target) => (target as Color).opacity,
      'value': (visitor, target) => (target as Color).value,
    },
    methods: {
      'withAlpha': (visitor, target, positionalArgs, namedArgs) {
        final alpha = positionalArgs.get<int>(0);
        return (target as Color).withAlpha(alpha!);
      },
      'withRed': (visitor, target, positionalArgs, namedArgs) {
        final red = positionalArgs.get<int>(0);
        return (target as Color).withRed(red!);
      },
      'withGreen': (visitor, target, positionalArgs, namedArgs) {
        final green = positionalArgs.get<int>(0);
        return (target as Color).withGreen(green!);
      },
      'withBlue': (visitor, target, positionalArgs, namedArgs) {
        final blue = positionalArgs.get<int>(0);
        return (target as Color).withBlue(blue!);
      },
      'withOpacity': (visitor, target, positionalArgs, namedArgs) {
        final opacity = toDouble(positionalArgs.get<dynamic>(0));
        return (target as Color).withOpacity(opacity!);
      },
      'withValues': (visitor, target, positionalArgs, namedArgs) {
        final red = positionalArgs.getToDouble(0);
        final green = positionalArgs.getToDouble(1);
        final blue = positionalArgs.getToDouble(2);
        final alpha = positionalArgs.getToDouble(3);
        final colorSpace = positionalArgs.get<ColorSpace?>(4);
        return (target as Color).withValues(
          alpha: alpha,
          green: green,
          blue: blue,
          red: red,
          colorSpace: colorSpace,
        );
      },
    },
  );
}

BridgedEnumDefinition getClipBridgingDefinition() {
  return BridgedEnumDefinition<Clip>(
    name: 'Clip',
    values: Clip.values,
    getters: {
      'name': (visitor, target) => (target as Clip).name,
      'index': (visitor, target) => (target as Clip).index,
    },
  );
}
