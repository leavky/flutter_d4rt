import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClassDefinition for the Flutter BottomNavigationBarItem.
BridgedClassDefinition getBottomNavigationBarItemBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: BottomNavigationBarItem,
    name: 'BottomNavigationBarItem',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final label = namedArgs.get<String?>('label');
        final tooltip = namedArgs.get<String?>('tooltip');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final icon = visitor.toWidgets(namedArgs['icon']);
        final activeIcon = visitor.toWidgets(namedArgs['activeIcon']);

        return BottomNavigationBarItem(
          icon: icon!,
          activeIcon: activeIcon,
          label: label,
          tooltip: tooltip,
          backgroundColor: backgroundColor,
        );
      },
    },
    getters: {
      'icon': (visitor, target) => (target as BottomNavigationBarItem).icon,
      'activeIcon': (visitor, target) =>
          (target as BottomNavigationBarItem).activeIcon,
      'label': (visitor, target) => (target as BottomNavigationBarItem).label,
      'tooltip': (visitor, target) =>
          (target as BottomNavigationBarItem).tooltip,
      'backgroundColor': (visitor, target) =>
          (target as BottomNavigationBarItem).backgroundColor,
    },
  );
}
