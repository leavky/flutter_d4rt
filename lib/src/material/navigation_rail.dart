import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

import '../../utils/extensions/widget.dart';

// Helper function for ValueChanged<int> callback handling
ValueChanged<int>? _handleIntValueCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (int value) => callback.call(visitor, [value]);
  }
  return callback as ValueChanged<int>?;
}

/// Returns the BridgedClassDefinition for the Flutter NavigationRail widget.
BridgedClassDefinition getNavigationRailBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: NavigationRail,
    name: 'NavigationRail',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final extended = namedArgs.get<bool?>('extended') ?? false;
        final leading = visitor.toWidgets(namedArgs['leading']);
        final trailing = visitor.toWidgets(namedArgs['trailing']);
        final destinations =
            visitor.toElements(namedArgs['destinations']) as List;
        final selectedIndex = namedArgs.get<int?>('selectedIndex');
        final onDestinationSelected = _handleIntValueCallback(
          visitor,
          namedArgs['onDestinationSelected'],
        );
        final elevation = namedArgs.getToDouble('elevation');
        final groupAlignment = namedArgs.getToDouble('groupAlignment');
        final labelType = namedArgs.get<NavigationRailLabelType?>('labelType');
        final unselectedLabelTextStyle = namedArgs.get<TextStyle?>(
          'unselectedLabelTextStyle',
        );
        final selectedLabelTextStyle = namedArgs.get<TextStyle?>(
          'selectedLabelTextStyle',
        );
        final unselectedIconTheme = namedArgs.get<IconThemeData?>(
          'unselectedIconTheme',
        );
        final selectedIconTheme = namedArgs.get<IconThemeData?>(
          'selectedIconTheme',
        );
        final minWidth = namedArgs.getToDouble('minWidth');
        final minExtendedWidth = namedArgs.getToDouble('minExtendedWidth');

        return NavigationRail(
          key: key,
          backgroundColor: backgroundColor,
          extended: extended,
          leading: leading,
          trailing: trailing,
          destinations: destinations.cast(),
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          elevation: elevation,
          groupAlignment: groupAlignment,
          labelType: labelType,
          unselectedLabelTextStyle: unselectedLabelTextStyle,
          selectedLabelTextStyle: selectedLabelTextStyle,
          unselectedIconTheme: unselectedIconTheme,
          selectedIconTheme: selectedIconTheme,
          minWidth: minWidth,
          minExtendedWidth: minExtendedWidth,
        );
      },
    },
    getters: {
      'backgroundColor': (visitor, target) =>
          (target as NavigationRail).backgroundColor,
      'extended': (visitor, target) => (target as NavigationRail).extended,
      'leading': (visitor, target) => (target as NavigationRail).leading,
      'trailing': (visitor, target) => (target as NavigationRail).trailing,
      'destinations': (visitor, target) =>
          (target as NavigationRail).destinations,
      'selectedIndex': (visitor, target) =>
          (target as NavigationRail).selectedIndex,
      'elevation': (visitor, target) => (target as NavigationRail).elevation,
      'labelType': (visitor, target) => (target as NavigationRail).labelType,
      'key': (visitor, target) => (target as NavigationRail).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter NavigationRailDestination.
BridgedClassDefinition getNavigationRailDestinationBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: NavigationRailDestination,
    name: 'NavigationRailDestination',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final label = namedArgs.get<String?>('label');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final icon = visitor.toWidgets(namedArgs['icon']);
        final selectedIcon = visitor.toWidgets(namedArgs['selectedIcon']);

        return NavigationRailDestination(
          icon: icon ?? const Icon(Icons.home),
          selectedIcon: selectedIcon,
          label: label != null ? Text(label) : const Text(''),
          padding: padding,
        );
      },
    },
    getters: {
      'icon': (visitor, target) => (target as NavigationRailDestination).icon,
      'selectedIcon': (visitor, target) =>
          (target as NavigationRailDestination).selectedIcon,
      'label': (visitor, target) => (target as NavigationRailDestination).label,
      'padding': (visitor, target) =>
          (target as NavigationRailDestination).padding,
    },
  );
}

BridgedEnumDefinition getNavigationRailLabelTypeBridgingDefinition() {
  return BridgedEnumDefinition<NavigationRailLabelType>(
    name: 'NavigationRailLabelType',
    values: NavigationRailLabelType.values,
    getters: {
      'name': (visitor, target) => (target as NavigationRailLabelType).name,
      'index': (visitor, target) => (target as NavigationRailLabelType).index,
    },
  );
}
