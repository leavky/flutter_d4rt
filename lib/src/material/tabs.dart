import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClassDefinition for the Flutter TabBar widget.
BridgedClassDefinition getTabBarBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: TabBar,
    name: 'TabBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller = namedArgs.get<TabController?>('controller');
        final isScrollable = namedArgs.get<bool?>('isScrollable') ?? false;
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final indicatorColor = namedArgs.get<Color?>('indicatorColor');
        final indicatorWeight = namedArgs.getToDouble('indicatorWeight') ?? 2.0;
        final indicatorPadding =
            namedArgs.get<EdgeInsetsGeometry?>('indicatorPadding') ??
            EdgeInsets.zero;
        final labelColor = namedArgs.get<Color?>('labelColor');
        final unselectedLabelColor = namedArgs.get<Color?>(
          'unselectedLabelColor',
        );
        final labelStyle = namedArgs.get<TextStyle?>('labelStyle');
        final unselectedLabelStyle = namedArgs.get<TextStyle?>(
          'unselectedLabelStyle',
        );
        final tabAlignment = namedArgs.get<TabAlignment?>('tabAlignment');
        final tabs = visitor.toWidgets(namedArgs['tabs']);

        return TabBar(
          key: key,
          tabs: tabs,
          controller: controller,
          isScrollable: isScrollable,
          padding: padding,
          indicatorColor: indicatorColor,
          indicatorWeight: indicatorWeight,
          indicatorPadding: indicatorPadding,
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
          labelStyle: labelStyle,
          unselectedLabelStyle: unselectedLabelStyle,
          tabAlignment: tabAlignment,
        );
      },
    },
    getters: {
      'tabs': (visitor, target) => (target as TabBar).tabs,
      'controller': (visitor, target) => (target as TabBar).controller,
      'isScrollable': (visitor, target) => (target as TabBar).isScrollable,
      'indicatorColor': (visitor, target) => (target as TabBar).indicatorColor,
      'indicatorWeight': (visitor, target) =>
          (target as TabBar).indicatorWeight,
      'key': (visitor, target) => (target as TabBar).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter Tab widget.
BridgedClassDefinition getTabBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Tab,
    name: 'Tab',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final text = namedArgs.get<String?>('text');
        final height = namedArgs.getToDouble('height');

        final icon = visitor.toWidgets(namedArgs['icon']);
        final child = visitor.toWidgets(namedArgs['child']);

        return Tab(
          key: key,
          text: text,
          icon: icon,
          height: height,
          child: child,
        );
      },
    },
    getters: {
      'text': (visitor, target) => (target as Tab).text,
      'icon': (visitor, target) => (target as Tab).icon,
      'child': (visitor, target) => (target as Tab).child,
      'height': (visitor, target) => (target as Tab).height,
      'key': (visitor, target) => (target as Tab).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter TabBarView widget.
BridgedClassDefinition getTabBarViewBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: TabBarView,
    name: 'TabBarView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller = namedArgs.get<TabController?>('controller');
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final dragStartBehavior =
            namedArgs.get<DragStartBehavior?>('dragStartBehavior') ??
            DragStartBehavior.start;

        final children = visitor.toWidgets(namedArgs['children']);

        return TabBarView(
          key: key,
          controller: controller,
          physics: physics,
          dragStartBehavior: dragStartBehavior,
          children: children,
        );
      },
    },
    getters: {
      'children': (visitor, target) => (target as TabBarView).children,
      'controller': (visitor, target) => (target as TabBarView).controller,
      'physics': (visitor, target) => (target as TabBarView).physics,
      'key': (visitor, target) => (target as TabBarView).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter DefaultTabController widget.
BridgedClassDefinition getDefaultTabControllerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DefaultTabController,
    name: 'DefaultTabController',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final length = namedArgs.get<int>('length') ?? 0;
        final initialIndex = namedArgs.get<int?>('initialIndex') ?? 0;
        final animationDuration = namedArgs.get<Duration?>('animationDuration');
        final child = visitor.toWidgets(namedArgs['child']);

        return DefaultTabController(
          key: key,
          length: length,
          initialIndex: initialIndex,
          animationDuration: animationDuration,
          child: child ?? const SizedBox.shrink(),
        );
      },
    },
    getters: {
      'length': (visitor, target) => (target as DefaultTabController).length,
      'initialIndex': (visitor, target) =>
          (target as DefaultTabController).initialIndex,
      'child': (visitor, target) => (target as DefaultTabController).child,
      'key': (visitor, target) => (target as DefaultTabController).key,
    },
  );
}
