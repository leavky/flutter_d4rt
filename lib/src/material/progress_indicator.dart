import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClassDefinition for the Flutter CircularProgressIndicator widget.
BridgedClassDefinition getCircularProgressIndicatorBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: CircularProgressIndicator,
    name: 'CircularProgressIndicator',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.getToDouble('value');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final color = namedArgs.get<Color?>('color');
        final valueColor = namedArgs.get<Animation<Color?>?>('valueColor');
        final strokeWidth = namedArgs.getToDouble('strokeWidth') ?? 4.0;
        final semanticsLabel = namedArgs.get<String?>('semanticsLabel');
        final semanticsValue = namedArgs.get<String?>('semanticsValue');

        return CircularProgressIndicator(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          color: color,
          valueColor: valueColor,
          strokeWidth: strokeWidth,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
        );
      },
      'adaptive': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.getToDouble('value');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final valueColor = namedArgs.get<Animation<Color?>?>('valueColor');
        final strokeWidth = namedArgs.getToDouble('strokeWidth') ?? 4.0;
        final semanticsLabel = namedArgs.get<String?>('semanticsLabel');
        final semanticsValue = namedArgs.get<String?>('semanticsValue');

        return CircularProgressIndicator.adaptive(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          valueColor: valueColor,
          strokeWidth: strokeWidth,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as CircularProgressIndicator).value,
      'backgroundColor': (visitor, target) =>
          (target as CircularProgressIndicator).backgroundColor,
      'valueColor': (visitor, target) =>
          (target as CircularProgressIndicator).valueColor,
      'strokeWidth': (visitor, target) =>
          (target as CircularProgressIndicator).strokeWidth,
      'semanticsLabel': (visitor, target) =>
          (target as CircularProgressIndicator).semanticsLabel,
      'semanticsValue': (visitor, target) =>
          (target as CircularProgressIndicator).semanticsValue,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter LinearProgressIndicator widget.
BridgedClassDefinition getLinearProgressIndicatorBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: LinearProgressIndicator,
    name: 'LinearProgressIndicator',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.getToDouble('value');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final color = namedArgs.get<Color?>('color');
        final valueColor = namedArgs.get<Animation<Color?>?>('valueColor');
        final minHeight = namedArgs.getToDouble('minHeight');
        final semanticsLabel = namedArgs.get<String?>('semanticsLabel');
        final semanticsValue = namedArgs.get<String?>('semanticsValue');

        return LinearProgressIndicator(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          color: color,
          valueColor: valueColor,
          minHeight: minHeight,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as LinearProgressIndicator).value,
      'backgroundColor': (visitor, target) =>
          (target as LinearProgressIndicator).backgroundColor,
      'valueColor': (visitor, target) =>
          (target as LinearProgressIndicator).valueColor,
      'minHeight': (visitor, target) =>
          (target as LinearProgressIndicator).minHeight,
      'semanticsLabel': (visitor, target) =>
          (target as LinearProgressIndicator).semanticsLabel,
      'semanticsValue': (visitor, target) =>
          (target as LinearProgressIndicator).semanticsValue,
    },
  );
}
