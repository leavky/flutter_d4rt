import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

/// Returns the BridgedClass for the Flutter ElevatedButtonThemeData class.
BridgedClass getElevatedButtonThemeDataBridgingDefinition() {
  return BridgedClass(
    nativeType: ElevatedButtonThemeData,
    name: 'ElevatedButtonThemeData',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ElevatedButtonThemeData(
          style: namedArgs['style'] as ButtonStyle?,
        );
      },
    },
    getters: {
      'style': (visitor, target) => (target as ElevatedButtonThemeData).style,
    },
  );
}

/// Returns the BridgedClass for the Flutter ButtonStyle class.
BridgedClass getButtonStyleBridgingDefinition() {
  return BridgedClass(
    nativeType: ButtonStyle,
    name: 'ButtonStyle',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ButtonStyle(
          textStyle: namedArgs.get<WidgetStateProperty<TextStyle?>?>(
            'textStyle',
          ),
          backgroundColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'backgroundColor',
          ),
          foregroundColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'foregroundColor',
          ),
          overlayColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'overlayColor',
          ),
          shadowColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'shadowColor',
          ),
          surfaceTintColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'surfaceTintColor',
          ),
          elevation: namedArgs.get<WidgetStateProperty<double?>?>('elevation'),
          padding: namedArgs.get<WidgetStateProperty<EdgeInsetsGeometry?>?>(
            'padding',
          ),
          minimumSize: namedArgs.get<WidgetStateProperty<Size?>?>(
            'minimumSize',
          ),
          fixedSize: namedArgs.get<WidgetStateProperty<Size?>?>('fixedSize'),
          maximumSize: namedArgs.get<WidgetStateProperty<Size?>?>(
            'maximumSize',
          ),
          side: namedArgs.get<WidgetStateProperty<BorderSide?>?>('side'),
          shape: namedArgs.get<WidgetStateProperty<OutlinedBorder?>?>('shape'),
          mouseCursor: namedArgs.get<WidgetStateProperty<MouseCursor?>?>(
            'mouseCursor',
          ),
          visualDensity: namedArgs.get<VisualDensity?>('visualDensity'),
          tapTargetSize: namedArgs.get<MaterialTapTargetSize?>('tapTargetSize'),
          animationDuration: namedArgs.get<Duration?>('animationDuration'),
          enableFeedback: namedArgs.get<bool?>('enableFeedback'),
          alignment: namedArgs.get<AlignmentGeometry?>('alignment'),
          splashFactory: namedArgs.get<InteractiveInkFeatureFactory?>(
            'splashFactory',
          ),
        );
      },
    },
    staticMethods: {
      'resolveWith': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs.first as WidgetPropertyResolver;
        return WidgetStateProperty.resolveWith(callback);
      },
    },
    getters: {
      'textStyle': (visitor, target) => (target as ButtonStyle).textStyle,
      'backgroundColor': (visitor, target) =>
          (target as ButtonStyle).backgroundColor,
      'foregroundColor': (visitor, target) =>
          (target as ButtonStyle).foregroundColor,
      'overlayColor': (visitor, target) => (target as ButtonStyle).overlayColor,
      'shadowColor': (visitor, target) => (target as ButtonStyle).shadowColor,
      'surfaceTintColor': (visitor, target) =>
          (target as ButtonStyle).surfaceTintColor,
      'elevation': (visitor, target) => (target as ButtonStyle).elevation,
      'padding': (visitor, target) => (target as ButtonStyle).padding,
      'minimumSize': (visitor, target) => (target as ButtonStyle).minimumSize,
      'fixedSize': (visitor, target) => (target as ButtonStyle).fixedSize,
      'maximumSize': (visitor, target) => (target as ButtonStyle).maximumSize,
      'side': (visitor, target) => (target as ButtonStyle).side,
      'shape': (visitor, target) => (target as ButtonStyle).shape,
      'mouseCursor': (visitor, target) => (target as ButtonStyle).mouseCursor,
      'visualDensity': (visitor, target) =>
          (target as ButtonStyle).visualDensity,
      'tapTargetSize': (visitor, target) =>
          (target as ButtonStyle).tapTargetSize,
      'animationDuration': (visitor, target) =>
          (target as ButtonStyle).animationDuration,
      'enableFeedback': (visitor, target) =>
          (target as ButtonStyle).enableFeedback,
      'alignment': (visitor, target) => (target as ButtonStyle).alignment,
      'splashFactory': (visitor, target) =>
          (target as ButtonStyle).splashFactory,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as ButtonStyle).copyWith(
          textStyle: namedArgs.get<WidgetStateProperty<TextStyle?>?>(
            'textStyle',
          ),
          backgroundColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'backgroundColor',
          ),
          foregroundColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'foregroundColor',
          ),
          overlayColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'overlayColor',
          ),
          shadowColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'shadowColor',
          ),
          surfaceTintColor: namedArgs.get<WidgetStateProperty<Color?>?>(
            'surfaceTintColor',
          ),
          elevation: namedArgs.get<WidgetStateProperty<double?>?>('elevation'),
          padding: namedArgs.get<WidgetStateProperty<EdgeInsetsGeometry?>?>(
            'padding',
          ),
          minimumSize: namedArgs.get<WidgetStateProperty<Size?>?>(
            'minimumSize',
          ),
          fixedSize: namedArgs.get<WidgetStateProperty<Size?>?>('fixedSize'),
          maximumSize: namedArgs.get<WidgetStateProperty<Size?>?>(
            'maximumSize',
          ),
          side: namedArgs.get<WidgetStateProperty<BorderSide?>?>('side'),
          shape: namedArgs.get<WidgetStateProperty<OutlinedBorder?>?>('shape'),
          mouseCursor: namedArgs.get<WidgetStateProperty<MouseCursor?>?>(
            'mouseCursor',
          ),
          visualDensity: namedArgs.get<VisualDensity?>('visualDensity'),
          tapTargetSize: namedArgs.get<MaterialTapTargetSize?>('tapTargetSize'),
          animationDuration: namedArgs.get<Duration?>('animationDuration'),
          enableFeedback: namedArgs.get<bool?>('enableFeedback'),
          alignment: namedArgs.get<AlignmentGeometry?>('alignment'),
          splashFactory: namedArgs.get<InteractiveInkFeatureFactory?>(
            'splashFactory',
          ),
        );
      },
      'merge': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.firstOrNull as ButtonStyle?;
        return (target as ButtonStyle).merge(other);
      },
    },
  );
}

/// Returns the BridgedClass for WidgetStateProperty class.
BridgedClass getWidgetStatePropertyBridgingDefinition() {
  return BridgedClass(
    nativeType: WidgetStateProperty,
    name: 'WidgetStateProperty',
    constructors: {},
    staticMethods: {
      'all': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.first;
        return WidgetStateProperty.all(value);
      },
      'resolveWith': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs.first as WidgetPropertyResolver;
        return WidgetStateProperty.resolveWith(callback);
      },
    },
    methods: {
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final states = positionalArgs.first as Set;
        return (target as WidgetStateProperty).resolve(states.cast());
      },
    },
  );
}
