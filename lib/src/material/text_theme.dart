import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClassDefinition for the Flutter TextTheme class.
BridgedClassDefinition getTextThemeBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: TextTheme,
    name: 'TextTheme',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return TextTheme(
          displayLarge: namedArgs.get<TextStyle?>('displayLarge'),
          displayMedium: namedArgs.get<TextStyle?>('displayMedium'),
          displaySmall: namedArgs.get<TextStyle?>('displaySmall'),
          headlineLarge: namedArgs.get<TextStyle?>('headlineLarge'),
          headlineMedium: namedArgs.get<TextStyle?>('headlineMedium'),
          headlineSmall: namedArgs.get<TextStyle?>('headlineSmall'),
          titleLarge: namedArgs.get<TextStyle?>('titleLarge'),
          titleMedium: namedArgs.get<TextStyle?>('titleMedium'),
          titleSmall: namedArgs.get<TextStyle?>('titleSmall'),
          bodyLarge: namedArgs.get<TextStyle?>('bodyLarge'),
          bodyMedium: namedArgs.get<TextStyle?>('bodyMedium'),
          bodySmall: namedArgs.get<TextStyle?>('bodySmall'),
          labelLarge: namedArgs.get<TextStyle?>('labelLarge'),
          labelMedium: namedArgs.get<TextStyle?>('labelMedium'),
          labelSmall: namedArgs.get<TextStyle?>('labelSmall'),
        );
      },
    },
    getters: {
      // Modern Material 3 properties
      'displayLarge': (visitor, target) => (target as TextTheme).displayLarge,
      'displayMedium': (visitor, target) => (target as TextTheme).displayMedium,
      'displaySmall': (visitor, target) => (target as TextTheme).displaySmall,
      'headlineLarge': (visitor, target) => (target as TextTheme).headlineLarge,
      'headlineMedium': (visitor, target) =>
          (target as TextTheme).headlineMedium,
      'headlineSmall': (visitor, target) => (target as TextTheme).headlineSmall,
      'titleLarge': (visitor, target) => (target as TextTheme).titleLarge,
      'titleMedium': (visitor, target) => (target as TextTheme).titleMedium,
      'titleSmall': (visitor, target) => (target as TextTheme).titleSmall,
      'bodyLarge': (visitor, target) => (target as TextTheme).bodyLarge,
      'bodyMedium': (visitor, target) => (target as TextTheme).bodyMedium,
      'bodySmall': (visitor, target) => (target as TextTheme).bodySmall,
      'labelLarge': (visitor, target) => (target as TextTheme).labelLarge,
      'labelMedium': (visitor, target) => (target as TextTheme).labelMedium,
      'labelSmall': (visitor, target) => (target as TextTheme).labelSmall,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as TextTheme).copyWith(
          displayLarge: namedArgs.get<TextStyle?>('displayLarge'),
          displayMedium: namedArgs.get<TextStyle?>('displayMedium'),
          displaySmall: namedArgs.get<TextStyle?>('displaySmall'),
          headlineLarge: namedArgs.get<TextStyle?>('headlineLarge'),
          headlineMedium: namedArgs.get<TextStyle?>('headlineMedium'),
          headlineSmall: namedArgs.get<TextStyle?>('headlineSmall'),
          titleLarge: namedArgs.get<TextStyle?>('titleLarge'),
          titleMedium: namedArgs.get<TextStyle?>('titleMedium'),
          titleSmall: namedArgs.get<TextStyle?>('titleSmall'),
          bodyLarge: namedArgs.get<TextStyle?>('bodyLarge'),
          bodyMedium: namedArgs.get<TextStyle?>('bodyMedium'),
          bodySmall: namedArgs.get<TextStyle?>('bodySmall'),
          labelLarge: namedArgs.get<TextStyle?>('labelLarge'),
          labelMedium: namedArgs.get<TextStyle?>('labelMedium'),
          labelSmall: namedArgs.get<TextStyle?>('labelSmall'),
        );
      },
      'apply': (visitor, target, positionalArgs, namedArgs) {
        return (target as TextTheme).apply(
          fontFamily: namedArgs.get<String?>('fontFamily'),
          fontSizeFactor: namedArgs.getToDouble('fontSizeFactor') ?? 1.0,
          fontSizeDelta: namedArgs.getToDouble('fontSizeDelta') ?? 0.0,
          displayColor: namedArgs.get<Color?>('displayColor'),
          bodyColor: namedArgs.get<Color?>('bodyColor'),
          decorationColor: namedArgs.get<Color?>('decorationColor'),
        );
      },
      'merge': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.firstOrNull as TextTheme?;
        return (target as TextTheme).merge(other);
      },
    },
    staticMethods: {
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs[0] as TextTheme?;
        final b = positionalArgs[1] as TextTheme?;
        final t = toDouble(positionalArgs[2]);
        return TextTheme.lerp(a, b, t);
      },
    },
  );
}
