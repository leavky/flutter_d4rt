import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClassDefinition for the Flutter BottomNavigationBarThemeData class.
BridgedClassDefinition getBottomNavigationBarThemeDataBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: BottomNavigationBarThemeData,
    name: 'BottomNavigationBarThemeData',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return BottomNavigationBarThemeData(
          backgroundColor: namedArgs.get<Color?>('backgroundColor'),
          elevation: namedArgs.getToDouble('elevation'),
          selectedIconTheme: namedArgs.get<IconThemeData?>('selectedIconTheme'),
          unselectedIconTheme: namedArgs.get<IconThemeData?>(
            'unselectedIconTheme',
          ),
          selectedItemColor: namedArgs.get<Color?>('selectedItemColor'),
          unselectedItemColor: namedArgs.get<Color?>('unselectedItemColor'),
          selectedLabelStyle: namedArgs.get<TextStyle?>('selectedLabelStyle'),
          unselectedLabelStyle: namedArgs.get<TextStyle?>(
            'unselectedLabelStyle',
          ),
          showSelectedLabels: namedArgs.get<bool?>('showSelectedLabels'),
          showUnselectedLabels: namedArgs.get<bool?>('showUnselectedLabels'),
          type: namedArgs.get<BottomNavigationBarType?>('type'),
          enableFeedback: namedArgs.get<bool?>('enableFeedback'),
          landscapeLayout: namedArgs.get<BottomNavigationBarLandscapeLayout?>(
            'landscapeLayout',
          ),
          mouseCursor: namedArgs.get<WidgetStateProperty<MouseCursor?>?>(
            'mouseCursor',
          ),
        );
      },
    },
    staticMethods: {
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs[0] as BottomNavigationBarThemeData?;
        final b = positionalArgs[1] as BottomNavigationBarThemeData?;
        final t = toDouble(positionalArgs[2]);
        return BottomNavigationBarThemeData.lerp(a, b, t);
      },
    },
    getters: {
      'backgroundColor': (visitor, target) =>
          (target as BottomNavigationBarThemeData).backgroundColor,
      'elevation': (visitor, target) =>
          (target as BottomNavigationBarThemeData).elevation,
      'selectedIconTheme': (visitor, target) =>
          (target as BottomNavigationBarThemeData).selectedIconTheme,
      'unselectedIconTheme': (visitor, target) =>
          (target as BottomNavigationBarThemeData).unselectedIconTheme,
      'selectedItemColor': (visitor, target) =>
          (target as BottomNavigationBarThemeData).selectedItemColor,
      'unselectedItemColor': (visitor, target) =>
          (target as BottomNavigationBarThemeData).unselectedItemColor,
      'selectedLabelStyle': (visitor, target) =>
          (target as BottomNavigationBarThemeData).selectedLabelStyle,
      'unselectedLabelStyle': (visitor, target) =>
          (target as BottomNavigationBarThemeData).unselectedLabelStyle,
      'showSelectedLabels': (visitor, target) =>
          (target as BottomNavigationBarThemeData).showSelectedLabels,
      'showUnselectedLabels': (visitor, target) =>
          (target as BottomNavigationBarThemeData).showUnselectedLabels,
      'type': (visitor, target) =>
          (target as BottomNavigationBarThemeData).type,
      'enableFeedback': (visitor, target) =>
          (target as BottomNavigationBarThemeData).enableFeedback,
      'landscapeLayout': (visitor, target) =>
          (target as BottomNavigationBarThemeData).landscapeLayout,
      'mouseCursor': (visitor, target) =>
          (target as BottomNavigationBarThemeData).mouseCursor,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        return (target as BottomNavigationBarThemeData).copyWith(
          backgroundColor: namedArgs.get<Color?>('backgroundColor'),
          elevation: namedArgs.getToDouble('elevation'),
          selectedIconTheme: namedArgs.get<IconThemeData?>('selectedIconTheme'),
          unselectedIconTheme: namedArgs.get<IconThemeData?>(
            'unselectedIconTheme',
          ),
          selectedItemColor: namedArgs.get<Color?>('selectedItemColor'),
          unselectedItemColor: namedArgs.get<Color?>('unselectedItemColor'),
          selectedLabelStyle: namedArgs.get<TextStyle?>('selectedLabelStyle'),
          unselectedLabelStyle: namedArgs.get<TextStyle?>(
            'unselectedLabelStyle',
          ),
          showSelectedLabels: namedArgs.get<bool?>('showSelectedLabels'),
          showUnselectedLabels: namedArgs.get<bool?>('showUnselectedLabels'),
          type: namedArgs.get<BottomNavigationBarType?>('type'),
          enableFeedback: namedArgs.get<bool?>('enableFeedback'),
          landscapeLayout: namedArgs.get<BottomNavigationBarLandscapeLayout?>(
            'landscapeLayout',
          ),
          mouseCursor: namedArgs.get<WidgetStateProperty<MouseCursor?>?>(
            'mouseCursor',
          ),
        );
      },
    },
  );
}

/// Returns the BridgedEnumDefinition for the Flutter BottomNavigationBarLandscapeLayout enum.
BridgedEnumDefinition
getBottomNavigationBarLandscapeLayoutBridgingDefinition() {
  return BridgedEnumDefinition<BottomNavigationBarLandscapeLayout>(
    name: 'BottomNavigationBarLandscapeLayout',
    values: BottomNavigationBarLandscapeLayout.values,
    getters: {
      'name': (visitor, target) =>
          (target as BottomNavigationBarLandscapeLayout).name,
      'index': (visitor, target) =>
          (target as BottomNavigationBarLandscapeLayout).index,
    },
  );
}
