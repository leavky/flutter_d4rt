import 'package:d4rt/d4rt.dart';
import 'package:flutter/painting.dart'; // For TextStyle
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart'; // For Colors (common with TextStyle)

/// Returns the BridgedClass for the Flutter TextStyle class.
BridgedClass getTextStyleBridgingDefinition() {
  return BridgedClass(
    nativeType: TextStyle,
    name: 'TextStyle', // The name used in interpreted code
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final inherit = namedArgs.get<bool?>('inherit') ?? true;
        final color = namedArgs.get<Color?>('color');
        final fontSize = namedArgs.getToDouble('fontSize');
        final fontWeight = namedArgs.get<FontWeight?>('fontWeight');
        final fontStyle = namedArgs.get<FontStyle?>('fontStyle');
        final letterSpacing = namedArgs.getToDouble('letterSpacing');
        final wordSpacing = namedArgs.getToDouble('wordSpacing');
        final height = namedArgs.getToDouble('height');
        final decoration = namedArgs.get<TextDecoration?>('decoration');
        final decorationColor = namedArgs.get<Color?>('decorationColor');
        final decorationStyle = namedArgs.get<TextDecorationStyle?>(
          'decorationStyle',
        );
        final decorationThickness = namedArgs.getToDouble(
          'decorationThickness',
        );
        final locale = namedArgs.get<Locale?>('locale');
        final shadows = namedArgs.get<List?>('shadows');
        final background = namedArgs.get<Paint?>('background');
        final foreground = namedArgs.get<Paint?>('foreground');
        final fontFamily = namedArgs.get<String?>('fontFamily');
        final fontFamilyFallback = namedArgs.get<List?>('fontFamilyFallback');
        final textBaseline = namedArgs.get<TextBaseline?>('textBaseline');
        final package = namedArgs.get<String?>('package');
        final overflow = namedArgs.get<TextOverflow?>('overflow');

        return TextStyle(
          inherit: inherit,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          height: height,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          locale: locale,
          shadows: shadows?.cast(),
          background: background,
          foreground: foreground,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback?.cast(),
          textBaseline: textBaseline,
          package: package,
          overflow: overflow,
        );
      },
    },
    getters: {
      'inherit': (visitor, target) => (target as TextStyle).inherit,
      'color': (visitor, target) => (target as TextStyle).color,
      'fontSize': (visitor, target) => (target as TextStyle).fontSize,
      'fontWeight': (visitor, target) => (target as TextStyle).fontWeight,
      'fontStyle': (visitor, target) => (target as TextStyle).fontStyle,
      'letterSpacing': (visitor, target) => (target as TextStyle).letterSpacing,
      'wordSpacing': (visitor, target) => (target as TextStyle).wordSpacing,
      'height': (visitor, target) => (target as TextStyle).height,
      'decoration': (visitor, target) => (target as TextStyle).decoration,
      'decorationColor': (visitor, target) =>
          (target as TextStyle).decorationColor,
      'decorationStyle': (visitor, target) =>
          (target as TextStyle).decorationStyle,
      'decorationThickness': (visitor, target) =>
          (target as TextStyle).decorationThickness,
      'locale': (visitor, target) => (target as TextStyle).locale,
      'shadows': (visitor, target) => (target as TextStyle).shadows,
      'background': (visitor, target) => (target as TextStyle).background,
      'foreground': (visitor, target) => (target as TextStyle).foreground,
      'fontFamily': (visitor, target) => (target as TextStyle).fontFamily,
      'fontFamilyFallback': (visitor, target) =>
          (target as TextStyle).fontFamilyFallback,
      'textBaseline': (visitor, target) => (target as TextStyle).textBaseline,
      'overflow': (visitor, target) => (target as TextStyle).overflow,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        final textStyle = target as TextStyle;
        final inherit = namedArgs.get<bool?>('inherit');
        final color = namedArgs.get<Color?>('color');
        final fontSize = namedArgs.getToDouble('fontSize');
        final fontWeight = namedArgs.get<FontWeight?>('fontWeight');
        final fontStyle = namedArgs.get<FontStyle?>('fontStyle');
        final letterSpacing = namedArgs.getToDouble('letterSpacing');
        final wordSpacing = namedArgs.getToDouble('wordSpacing');
        final height = namedArgs.getToDouble('height');
        final decoration = namedArgs.get<TextDecoration?>('decoration');
        final decorationColor = namedArgs.get<Color?>('decorationColor');
        final decorationStyle = namedArgs.get<TextDecorationStyle?>(
          'decorationStyle',
        );
        final decorationThickness = namedArgs.getToDouble(
          'decorationThickness',
        );
        final locale = namedArgs.get<Locale?>('locale');
        final shadows = namedArgs.get<List?>('shadows');
        final background = namedArgs.get<Paint?>('background');
        final foreground = namedArgs.get<Paint?>('foreground');
        final fontFamily = namedArgs.get<String?>('fontFamily');
        final fontFamilyFallback = namedArgs.get<List?>('fontFamilyFallback');
        final textBaseline = namedArgs.get<TextBaseline?>('textBaseline');
        final overflow = namedArgs.get<TextOverflow?>('overflow');

        return textStyle.copyWith(
          inherit: inherit,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          height: height,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          locale: locale,
          shadows: shadows?.cast(),
          background: background,
          foreground: foreground,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback?.cast(),
          textBaseline: textBaseline,
          overflow: overflow,
        );
      },
    },
  );
}
