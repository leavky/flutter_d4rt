import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

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

/// Returns the BridgedClassDefinition for the Flutter BottomNavigationBar widget.
BridgedClassDefinition getBottomNavigationBarBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: BottomNavigationBar,
    name: 'BottomNavigationBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final items = visitor.toElements(namedArgs['items']) as List;
        final currentIndex = namedArgs.get<int?>('currentIndex') ?? 0;
        final onTap = _handleIntValueCallback(visitor, namedArgs['onTap']);
        final type = namedArgs.get<BottomNavigationBarType?>('type');
        final fixedColor = namedArgs.get<Color?>('fixedColor');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final iconSize = namedArgs.getToDouble('iconSize') ?? 24.0;
        final selectedItemColor = namedArgs.get<Color?>('selectedItemColor');
        final unselectedItemColor = namedArgs.get<Color?>(
          'unselectedItemColor',
        );
        final selectedLabelStyle = namedArgs.get<TextStyle?>(
          'selectedLabelStyle',
        );
        final unselectedLabelStyle = namedArgs.get<TextStyle?>(
          'unselectedLabelStyle',
        );
        final showSelectedLabels = namedArgs.get<bool?>('showSelectedLabels');
        final showUnselectedLabels = namedArgs.get<bool?>(
          'showUnselectedLabels',
        );
        final elevation = namedArgs.getToDouble('elevation');

        return BottomNavigationBar(
          key: key,
          items: items.cast(),
          currentIndex: currentIndex,
          onTap: onTap,
          type: type,
          fixedColor: fixedColor,
          backgroundColor: backgroundColor,
          iconSize: iconSize,
          selectedItemColor: selectedItemColor,
          unselectedItemColor: unselectedItemColor,
          selectedLabelStyle: selectedLabelStyle,
          unselectedLabelStyle: unselectedLabelStyle,
          showSelectedLabels: showSelectedLabels,
          showUnselectedLabels: showUnselectedLabels,
          elevation: elevation,
        );
      },
    },
    getters: {
      'items': (visitor, target) => (target as BottomNavigationBar).items,
      'currentIndex': (visitor, target) =>
          (target as BottomNavigationBar).currentIndex,
      'type': (visitor, target) => (target as BottomNavigationBar).type,
      'backgroundColor': (visitor, target) =>
          (target as BottomNavigationBar).backgroundColor,
      'selectedItemColor': (visitor, target) =>
          (target as BottomNavigationBar).selectedItemColor,
      'unselectedItemColor': (visitor, target) =>
          (target as BottomNavigationBar).unselectedItemColor,
      'iconSize': (visitor, target) => (target as BottomNavigationBar).iconSize,
      'elevation': (visitor, target) =>
          (target as BottomNavigationBar).elevation,
      'key': (visitor, target) => (target as BottomNavigationBar).key,
    },
  );
}

BridgedEnumDefinition getBottomNavigationBarTypeBridgingDefinition() {
  return BridgedEnumDefinition<BottomNavigationBarType>(
    name: 'BottomNavigationBarType',
    values: BottomNavigationBarType.values,
    getters: {
      'name': (visitor, target) => (target as BottomNavigationBarType).name,
      'index': (visitor, target) => (target as BottomNavigationBarType).index,
    },
  );
}
