import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';

/// Returns the BridgedClassDefinition for the Flutter ElevatedButtonThemeData class.
BridgedClassDefinition getElevatedButtonThemeDataBridgingDefinition() {
  return BridgedClassDefinition(
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

/// Returns the BridgedClassDefinition for the Flutter ButtonStyle class.
BridgedClassDefinition getButtonStyleBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ButtonStyle,
    name: 'ButtonStyle',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ButtonStyle(
          textStyle: namedArgs.get<MaterialStateProperty<TextStyle?>?>(
            'textStyle',
          ),
          backgroundColor: namedArgs.get<MaterialStateProperty<Color?>?>(
            'backgroundColor',
          ),
          foregroundColor: namedArgs.get<MaterialStateProperty<Color?>?>(
            'foregroundColor',
          ),
          overlayColor: namedArgs.get<MaterialStateProperty<Color?>?>(
            'overlayColor',
          ),
          shadowColor: namedArgs.get<MaterialStateProperty<Color?>?>(
            'shadowColor',
          ),
          surfaceTintColor: namedArgs.get<MaterialStateProperty<Color?>?>(
            'surfaceTintColor',
          ),
          elevation: namedArgs.get<MaterialStateProperty<double?>?>(
            'elevation',
          ),
          padding: namedArgs.get<MaterialStateProperty<EdgeInsetsGeometry?>?>(
            'padding',
          ),
          minimumSize: namedArgs.get<MaterialStateProperty<Size?>?>(
            'minimumSize',
          ),
          fixedSize: namedArgs.get<MaterialStateProperty<Size?>?>('fixedSize'),
          maximumSize: namedArgs.get<MaterialStateProperty<Size?>?>(
            'maximumSize',
          ),
          side: namedArgs.get<MaterialStateProperty<BorderSide?>?>('side'),
          shape: namedArgs.get<MaterialStateProperty<OutlinedBorder?>?>(
            'shape',
          ),
          mouseCursor: namedArgs.get<MaterialStateProperty<MouseCursor?>?>(
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
        final callback = positionalArgs.first as MaterialPropertyResolver;
        return MaterialStateProperty.resolveWith(callback);
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
          textStyle: namedArgs.get<MaterialStateProperty<TextStyle?>?>(
            'textStyle',
          ),
          backgroundColor: namedArgs.get<MaterialStateProperty<Color?>?>(
            'backgroundColor',
          ),
          foregroundColor: namedArgs.get<MaterialStateProperty<Color?>?>(
            'foregroundColor',
          ),
          overlayColor: namedArgs.get<MaterialStateProperty<Color?>?>(
            'overlayColor',
          ),
          shadowColor: namedArgs.get<MaterialStateProperty<Color?>?>(
            'shadowColor',
          ),
          surfaceTintColor: namedArgs.get<MaterialStateProperty<Color?>?>(
            'surfaceTintColor',
          ),
          elevation: namedArgs.get<MaterialStateProperty<double?>?>(
            'elevation',
          ),
          padding: namedArgs.get<MaterialStateProperty<EdgeInsetsGeometry?>?>(
            'padding',
          ),
          minimumSize: namedArgs.get<MaterialStateProperty<Size?>?>(
            'minimumSize',
          ),
          fixedSize: namedArgs.get<MaterialStateProperty<Size?>?>('fixedSize'),
          maximumSize: namedArgs.get<MaterialStateProperty<Size?>?>(
            'maximumSize',
          ),
          side: namedArgs.get<MaterialStateProperty<BorderSide?>?>('side'),
          shape: namedArgs.get<MaterialStateProperty<OutlinedBorder?>?>(
            'shape',
          ),
          mouseCursor: namedArgs.get<MaterialStateProperty<MouseCursor?>?>(
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

/// Returns the BridgedClassDefinition for MaterialStateProperty class.
BridgedClassDefinition getMaterialStatePropertyBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: MaterialStateProperty,
    name: 'MaterialStateProperty',
    constructors: {},
    staticMethods: {
      'all': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.first;
        return MaterialStateProperty.all(value);
      },
      'resolveWith': (visitor, positionalArgs, namedArgs) {
        final callback = positionalArgs.first as MaterialPropertyResolver;
        return MaterialStateProperty.resolveWith(callback);
      },
    },
    methods: {
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final states = positionalArgs.first as Set<MaterialState>;
        return (target as MaterialStateProperty).resolve(states);
      },
    },
  );
}
