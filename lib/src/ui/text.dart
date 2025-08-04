import 'dart:ui';
import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/utils/double.dart';

/// Returns the BridgedClass for the Flutter Radius class.
BridgedClass getFontWeightBridgingDefinition() {
  return BridgedClass(
    nativeType: FontWeight,
    name: 'FontWeight',
    staticGetters: {
      'bold': (visitor) => FontWeight.bold,
      'normal': (visitor) => FontWeight.normal,
      'values': (visitor) => FontWeight.values,
      'w100': (visitor) => FontWeight.w100,
      'w200': (visitor) => FontWeight.w200,
      'w300': (visitor) => FontWeight.w300,
      'w400': (visitor) => FontWeight.w400,
      'w500': (visitor) => FontWeight.w500,
      'w600': (visitor) => FontWeight.w600,
      'w700': (visitor) => FontWeight.w700,
      'w800': (visitor) => FontWeight.w800,
      'w900': (visitor) => FontWeight.w900,
    },
    staticMethods: {
      'bold': (visitor, positionalArgs, namedArgs) => FontWeight.lerp(
        positionalArgs.get<FontWeight?>(0),
        positionalArgs.get<FontWeight?>(1),
        toDouble(positionalArgs.get<dynamic>(2))!,
      ),
    },
  );
}

BridgedEnumDefinition getTextAlignBridgingDefinition() {
  return BridgedEnumDefinition<TextAlign>(
    name: 'TextAlign',
    values: TextAlign.values,
    getters: {
      'name': (visitor, target) => (target as TextAlign).name,
      'index': (visitor, target) => (target as TextAlign).index,
    },
  );
}

BridgedEnumDefinition getFontStyleBridgingDefinition() {
  return BridgedEnumDefinition<FontStyle>(
    name: 'FontStyle',
    values: FontStyle.values,
    getters: {
      'name': (visitor, target) => (target as FontStyle).name,
      'index': (visitor, target) => (target as FontStyle).index,
    },
  );
}

BridgedEnumDefinition getTextTextBaselineBridgingDefinition() {
  return BridgedEnumDefinition<TextBaseline>(
    name: 'TextBaseline',
    values: TextBaseline.values,
    getters: {
      'name': (visitor, target) => (target as TextBaseline).name,
      'index': (visitor, target) => (target as TextBaseline).index,
    },
  );
}

BridgedEnumDefinition getTextDirectionBridgingDefinition() {
  return BridgedEnumDefinition<TextDirection>(
    name: 'TextDirection',
    values: TextDirection.values,
    getters: {
      'name': (visitor, target) => (target as TextDirection).name,
      'index': (visitor, target) => (target as TextDirection).index,
    },
  );
}
