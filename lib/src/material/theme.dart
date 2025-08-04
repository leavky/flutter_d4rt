import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter Theme widget.
BridgedClass getThemeBridgingDefinition() {
  return BridgedClass(
    nativeType: Theme,
    name: 'Theme',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs['key'] as Key?;
        final data = namedArgs['data'] as ThemeData;
        final child = visitor.toWidgets(namedArgs['child']);

        return Theme(key: key, data: data, child: child!);
      },
    },
    getters: {
      'data': (visitor, target) => (target as Theme).data,
      'child': (visitor, target) => (target as Theme).child,
      'key': (visitor, target) => (target as Theme).key,
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        return Theme.of(context);
      },
    },
  );
}

/// Returns the BridgedClass for the AnimatedTheme widget.
BridgedClass getAnimatedThemeBridgingDefinition() {
  return BridgedClass(
    nativeType: AnimatedTheme,
    name: 'AnimatedTheme',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final data = namedArgs.get<ThemeData>('data');
        final child = visitor.toWidgets(namedArgs['child']);
        final duration = namedArgs.get<Duration?>('duration');
        final curve = namedArgs.get<Curve?>('curve');
        final onEnd = namedArgs.get<InterpretedFunction?>('onEnd');

        return AnimatedTheme(
          key: key,
          data: data!,
          child: child!,
          duration: duration ?? const Duration(milliseconds: 200),
          curve: curve ?? Curves.linear,
          onEnd: onEnd != null ? () => onEnd.call(visitor, []) : null,
        );
      },
    },
    getters: {
      'data': (visitor, target) => (target as AnimatedTheme).data,
      'child': (visitor, target) => (target as AnimatedTheme).child,
      'duration': (visitor, target) => (target as AnimatedTheme).duration,
      'curve': (visitor, target) => (target as AnimatedTheme).curve,
      'onEnd': (visitor, target) => (target as AnimatedTheme).onEnd,
      'key': (visitor, target) => (target as AnimatedTheme).key,
    },
  );
}

/// Returns the BridgedClass for ThemeExtension.
BridgedClass getThemeExtensionBridgingDefinition() {
  return BridgedClass(
    nativeType: ThemeExtension,
    name: 'ThemeExtension',
    getters: {'type': (visitor, target) => (target as ThemeExtension).type},
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as ThemeExtension).copyWith();
      },
      'lerp': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs[0] as ThemeExtension?;
        final t = toDouble(positionalArgs[1]);
        return (target as ThemeExtension).lerp(other, t);
      },
    },
  );
}
