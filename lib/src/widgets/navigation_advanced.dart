import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClassDefinition for NavigationBar (Material 3)
BridgedClassDefinition getNavigationBarBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: NavigationBar,
    name: 'NavigationBar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final animationDuration = namedArgs.get<Duration?>('animationDuration');
        final selectedIndex = namedArgs.get<int?>('selectedIndex') ?? 0;
        final onDestinationSelected = namedArgs.get<ValueChanged<int>?>(
          'onDestinationSelected',
        );
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final indicatorColor = namedArgs.get<Color?>('indicatorColor');
        final indicatorShape = namedArgs.get<ShapeBorder?>('indicatorShape');
        final height = namedArgs.get<double?>('height');
        final labelBehavior = namedArgs
            .get<NavigationDestinationLabelBehavior?>('labelBehavior');

        final destinations = <NavigationDestination>[];
        final destinationsValue = namedArgs['destinations'];
        if (destinationsValue is List) {
          for (final dest in destinationsValue) {
            if (dest is NavigationDestination) {
              destinations.add(dest);
            }
          }
        }

        return NavigationBar(
          key: key,
          animationDuration: animationDuration,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          backgroundColor: backgroundColor,
          surfaceTintColor: surfaceTintColor,
          shadowColor: shadowColor,
          indicatorColor: indicatorColor,
          indicatorShape: indicatorShape,
          height: height,
          labelBehavior: labelBehavior,
          destinations: destinations,
        );
      },
    },
    getters: {
      'selectedIndex': (visitor, target) =>
          (target as NavigationBar).selectedIndex,
      'destinations': (visitor, target) =>
          (target as NavigationBar).destinations,
      'backgroundColor': (visitor, target) =>
          (target as NavigationBar).backgroundColor,
      'height': (visitor, target) => (target as NavigationBar).height,
    },
  );
}

/// Returns the BridgedClassDefinition for NavigationDestination
BridgedClassDefinition getNavigationDestinationBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: NavigationDestination,
    name: 'NavigationDestination',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final icon = visitor.toWidgets(namedArgs['icon']);
        final selectedIcon = visitor.toWidgets(namedArgs['selectedIcon']);
        final label = namedArgs.get<String?>('label') ?? '';
        final tooltip = namedArgs.get<String?>('tooltip');
        final enabled = namedArgs.get<bool?>('enabled') ?? true;

        return NavigationDestination(
          key: key,
          icon: icon ?? const Icon(Icons.home),
          selectedIcon: selectedIcon,
          label: label,
          tooltip: tooltip,
          enabled: enabled,
        );
      },
    },
    getters: {
      'icon': (visitor, target) => (target as NavigationDestination).icon,
      'selectedIcon': (visitor, target) =>
          (target as NavigationDestination).selectedIcon,
      'label': (visitor, target) => (target as NavigationDestination).label,
      'enabled': (visitor, target) => (target as NavigationDestination).enabled,
    },
  );
}

/// Returns the BridgedClassDefinition for NavigationDrawer
BridgedClassDefinition getNavigationDrawerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: NavigationDrawer,
    name: 'NavigationDrawer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final surfaceTintColor = namedArgs.get<Color?>('surfaceTintColor');
        final shadowColor = namedArgs.get<Color?>('shadowColor');
        final indicatorColor = namedArgs.get<Color?>('indicatorColor');
        final indicatorShape = namedArgs.get<ShapeBorder?>('indicatorShape');
        final selectedIndex = namedArgs.get<int?>('selectedIndex');
        final onDestinationSelected = namedArgs.get<ValueChanged<int>?>(
          'onDestinationSelected',
        );
        final tilePadding = namedArgs.get<EdgeInsetsGeometry?>('tilePadding');

        final children = <Widget>[];
        final childrenValue = visitor.toWidgets(namedArgs['children']);
        if (childrenValue is List<Widget>) {
          children.addAll(childrenValue);
        }

        return NavigationDrawer(
          key: key,
          backgroundColor: backgroundColor,
          surfaceTintColor: surfaceTintColor,
          shadowColor: shadowColor,
          indicatorColor: indicatorColor,
          indicatorShape: indicatorShape,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          tilePadding: tilePadding ?? EdgeInsets.zero,
          children: children,
        );
      },
    },
    getters: {
      'selectedIndex': (visitor, target) =>
          (target as NavigationDrawer).selectedIndex,
      'children': (visitor, target) => (target as NavigationDrawer).children,
      'backgroundColor': (visitor, target) =>
          (target as NavigationDrawer).backgroundColor,
    },
  );
}

/// Returns the BridgedClassDefinition for NavigationDrawerDestination
BridgedClassDefinition getNavigationDrawerDestinationBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: NavigationDrawerDestination,
    name: 'NavigationDrawerDestination',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final icon = visitor.toWidgets(namedArgs['icon']);
        final selectedIcon = visitor.toWidgets(namedArgs['selectedIcon']);
        final label = visitor.toWidgets(namedArgs['label']);
        final enabled = namedArgs.get<bool?>('enabled') ?? true;

        return NavigationDrawerDestination(
          key: key,
          icon: icon ?? const Icon(Icons.home),
          selectedIcon: selectedIcon,
          label: label ?? const Text(''),
          enabled: enabled,
        );
      },
    },
    getters: {
      'icon': (visitor, target) => (target as NavigationDrawerDestination).icon,
      'selectedIcon': (visitor, target) =>
          (target as NavigationDrawerDestination).selectedIcon,
      'label': (visitor, target) =>
          (target as NavigationDrawerDestination).label,
      'enabled': (visitor, target) =>
          (target as NavigationDrawerDestination).enabled,
    },
  );
}

/// Returns the BridgedClassDefinition for TabBar
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
        final automaticIndicatorColorAdjustment =
            namedArgs.get<bool?>('automaticIndicatorColorAdjustment') ?? true;
        final indicatorWeight =
            namedArgs.get<double?>('indicatorWeight') ?? 2.0;
        final indicatorPadding =
            namedArgs.get<EdgeInsetsGeometry?>('indicatorPadding') ??
            EdgeInsets.zero;
        final indicator = namedArgs.get<Decoration?>('indicator');
        final indicatorSize = namedArgs.get<TabBarIndicatorSize?>(
          'indicatorSize',
        );
        final labelColor = namedArgs.get<Color?>('labelColor');
        final unselectedLabelColor = namedArgs.get<Color?>(
          'unselectedLabelColor',
        );
        final labelStyle = namedArgs.get<TextStyle?>('labelStyle');
        final unselectedLabelStyle = namedArgs.get<TextStyle?>(
          'unselectedLabelStyle',
        );
        final overlayColor = namedArgs.get<MaterialStateProperty<Color?>?>(
          'overlayColor',
        );
        final splashFactory = namedArgs.get<InteractiveInkFeatureFactory?>(
          'splashFactory',
        );
        final onTap = namedArgs.get<ValueChanged<int>?>('onTap');
        final mouseCursor = namedArgs.get<MouseCursor?>('mouseCursor');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');
        final dividerColor = namedArgs.get<Color?>('dividerColor');

        final tabs = <Widget>[];
        final tabsValue = visitor.toWidgets(namedArgs['tabs']);
        if (tabsValue is List<Widget>) {
          tabs.addAll(tabsValue);
        }

        return TabBar(
          key: key,
          tabs: tabs,
          controller: controller,
          isScrollable: isScrollable,
          padding: padding,
          indicatorColor: indicatorColor,
          automaticIndicatorColorAdjustment: automaticIndicatorColorAdjustment,
          indicatorWeight: indicatorWeight,
          indicatorPadding: indicatorPadding,
          indicator: indicator,
          indicatorSize: indicatorSize,
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
          labelStyle: labelStyle,
          unselectedLabelStyle: unselectedLabelStyle,
          overlayColor: overlayColor,
          splashFactory: splashFactory,
          onTap: onTap,
          mouseCursor: mouseCursor,
          enableFeedback: enableFeedback,
          dividerColor: dividerColor,
        );
      },
    },
    getters: {
      'tabs': (visitor, target) => (target as TabBar).tabs,
      'controller': (visitor, target) => (target as TabBar).controller,
      'isScrollable': (visitor, target) => (target as TabBar).isScrollable,
      'indicatorColor': (visitor, target) => (target as TabBar).indicatorColor,
    },
  );
}

/// Returns the BridgedClassDefinition for Tab
BridgedClassDefinition getTabBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Tab,
    name: 'Tab',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final text = namedArgs.get<String?>('text');
        final icon = visitor.toWidgets(namedArgs['icon']);
        final iconMargin =
            namedArgs.get<EdgeInsetsGeometry?>('iconMargin') ??
            const EdgeInsets.only(bottom: 10.0);
        final height = namedArgs.get<double?>('height');
        final child = visitor.toWidgets(namedArgs['child']);

        return Tab(
          key: key,
          text: text,
          icon: icon,
          iconMargin: iconMargin,
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
    },
  );
}

/// Returns the BridgedClassDefinition for TabBarView
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
        final viewportFraction =
            namedArgs.get<double?>('viewportFraction') ?? 1.0;
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;

        final children = <Widget>[];
        final childrenValue = visitor.toWidgets(namedArgs['children']);
        if (childrenValue is List<Widget>) {
          children.addAll(childrenValue);
        }

        return TabBarView(
          key: key,
          controller: controller,
          physics: physics,
          dragStartBehavior: dragStartBehavior,
          viewportFraction: viewportFraction,
          clipBehavior: clipBehavior,
          children: children,
        );
      },
    },
    getters: {
      'children': (visitor, target) => (target as TabBarView).children,
      'controller': (visitor, target) => (target as TabBarView).controller,
      'physics': (visitor, target) => (target as TabBarView).physics,
    },
  );
}

/// Returns the BridgedClassDefinition for DefaultTabController
BridgedClassDefinition getDefaultTabControllerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DefaultTabController,
    name: 'DefaultTabController',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final length = namedArgs.get<int?>('length') ?? 0;
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
    },
  );
}

/// Enums for Navigation

/// Returns the BridgedEnumDefinition for NavigationDestinationLabelBehavior
BridgedEnumDefinition
getNavigationDestinationLabelBehaviorBridgingDefinition() {
  return BridgedEnumDefinition<NavigationDestinationLabelBehavior>(
    name: 'NavigationDestinationLabelBehavior',
    values: NavigationDestinationLabelBehavior.values,
    getters: {
      'name': (visitor, target) =>
          (target as NavigationDestinationLabelBehavior).name,
      'index': (visitor, target) =>
          (target as NavigationDestinationLabelBehavior).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for TabBarIndicatorSize
BridgedEnumDefinition getTabBarIndicatorSizeBridgingDefinition() {
  return BridgedEnumDefinition<TabBarIndicatorSize>(
    name: 'TabBarIndicatorSize',
    values: TabBarIndicatorSize.values,
    getters: {
      'name': (visitor, target) => (target as TabBarIndicatorSize).name,
      'index': (visitor, target) => (target as TabBarIndicatorSize).index,
    },
  );
}

/// Returns the BridgedEnumDefinition for DragStartBehavior
BridgedEnumDefinition getDragStartBehaviorBridgingDefinition() {
  return BridgedEnumDefinition<DragStartBehavior>(
    name: 'DragStartBehavior',
    values: DragStartBehavior.values,
    getters: {
      'name': (visitor, target) => (target as DragStartBehavior).name,
      'index': (visitor, target) => (target as DragStartBehavior).index,
    },
  );
}
