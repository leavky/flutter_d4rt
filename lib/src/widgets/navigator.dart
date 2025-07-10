import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Navigation and routing widgets bridging definitions

// Helper functions for callback handling
void Function(bool, Object?)? _handlePopInvokedCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (bool didPop, Object? result) =>
        callback.call(visitor, [didPop, result]);
  }
  return callback as void Function(bool, Object?)?;
}

// Navigator bridging
BridgedClassDefinition getNavigatorBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Navigator,
    name: 'Navigator',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Navigator(
          key: namedArgs.get<Key?>('key'),
          pages: (namedArgs['pages'] as List? ?? []).cast(),
          onPopPage:
              namedArgs['onPopPage'] as bool Function(Route<Object?>, Object?)?,
          initialRoute: namedArgs['initialRoute'] as String?,
          onGenerateInitialRoutes:
              namedArgs['onGenerateInitialRoutes'] as RouteListFactory? ??
              Navigator.defaultGenerateInitialRoutes,
          onGenerateRoute:
              namedArgs['onGenerateRoute']
                  as Route<Object?>? Function(RouteSettings)?,
          onUnknownRoute:
              namedArgs['onUnknownRoute']
                  as Route<Object?>? Function(RouteSettings)?,
          transitionDelegate:
              namedArgs['transitionDelegate'] as TransitionDelegate<dynamic>? ??
              const DefaultTransitionDelegate<dynamic>(),
          reportsRouteUpdateToEngine:
              namedArgs['reportsRouteUpdateToEngine'] as bool? ?? false,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          observers: (namedArgs['observers'] as List? ?? []).cast(),
          restorationScopeId: namedArgs['restorationScopeId'] as String?,
        );
      },
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final rootNavigator = namedArgs['rootNavigator'] as bool? ?? false;
        return Navigator.of(context, rootNavigator: rootNavigator);
      },
      'maybeOf': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final rootNavigator = namedArgs['rootNavigator'] as bool? ?? false;
        return Navigator.maybeOf(context, rootNavigator: rootNavigator);
      },
      'push': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final route = positionalArgs[1] as Route<Object?>;
        return Navigator.push(context, route);
      },
      'pop': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final result = positionalArgs.length > 1
            ? positionalArgs[1]
            : namedArgs['result'];
        return Navigator.pop(context, result);
      },
      'pushNamed': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final routeName = positionalArgs[1] as String;
        final arguments = namedArgs['arguments'];
        return Navigator.pushNamed(context, routeName, arguments: arguments);
      },
      'pushReplacementNamed': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final routeName = positionalArgs[1] as String;
        final result = namedArgs['result'];
        final arguments = namedArgs['arguments'];
        return Navigator.pushReplacementNamed(
          context,
          routeName,
          result: result,
          arguments: arguments,
        );
      },
      'popAndPushNamed': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final routeName = positionalArgs[1] as String;
        final result = namedArgs['result'];
        final arguments = namedArgs['arguments'];
        return Navigator.popAndPushNamed(
          context,
          routeName,
          result: result,
          arguments: arguments,
        );
      },
      'canPop': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        return Navigator.canPop(context);
      },
    },
  );
}

// Hero bridging
BridgedClassDefinition getHeroBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Hero,
    name: 'Hero',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Hero(
          key: namedArgs.get<Key?>('key'),
          tag: namedArgs['tag'] as Object,
          createRectTween: namedArgs['createRectTween'] as CreateRectTween?,
          flightShuttleBuilder:
              namedArgs['flightShuttleBuilder'] as HeroFlightShuttleBuilder?,
          placeholderBuilder:
              namedArgs['placeholderBuilder'] as HeroPlaceholderBuilder?,
          transitionOnUserGestures:
              namedArgs['transitionOnUserGestures'] as bool? ?? false,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// WillPopScope bridging (deprecated but still widely used)
BridgedClassDefinition getWillPopScopeBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: WillPopScope,
    name: 'WillPopScope',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return WillPopScope(
          key: namedArgs.get<Key?>('key'),
          onWillPop: namedArgs['onWillPop'] as Future<bool> Function()?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// PopScope bridging (newer replacement for WillPopScope)
BridgedClassDefinition getPopScopeBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: PopScope,
    name: 'PopScope',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PopScope(
          key: namedArgs.get<Key?>('key'),
          canPop: namedArgs['canPop'] as bool? ?? true,
          onPopInvokedWithResult: _handlePopInvokedCallback(
            visitor,
            namedArgs['onPopInvokedWithResult'],
          ),
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// MaterialPageRoute bridging
BridgedClassDefinition getMaterialPageRouteBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: MaterialPageRoute,
    name: 'MaterialPageRoute',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        // Handle builder function
        Widget Function(BuildContext) builder = (context) =>
            const SizedBox.shrink();
        final builderValue = namedArgs['builder'];
        if (builderValue is InterpretedFunction) {
          builder = (context) {
            final result = builderValue.call(visitor, [context]);
            return visitor.toWidgets(result) ?? const SizedBox.shrink();
          };
        } else if (builderValue is Widget Function(BuildContext)) {
          builder = builderValue;
        }

        return MaterialPageRoute(
          builder: builder,
          settings: namedArgs.get<RouteSettings?>('settings'),
          maintainState: namedArgs.get<bool?>('maintainState') ?? true,
          fullscreenDialog: namedArgs.get<bool?>('fullscreenDialog') ?? false,
          allowSnapshotting: namedArgs.get<bool?>('allowSnapshotting') ?? true,
          barrierDismissible:
              namedArgs.get<bool?>('barrierDismissible') ?? false,
        );
      },
    },
    getters: {
      'settings': (visitor, target) => (target as MaterialPageRoute).settings,
      'maintainState': (visitor, target) =>
          (target as MaterialPageRoute).maintainState,
      'fullscreenDialog': (visitor, target) =>
          (target as MaterialPageRoute).fullscreenDialog,
      'allowSnapshotting': (visitor, target) =>
          (target as MaterialPageRoute).allowSnapshotting,
      'barrierDismissible': (visitor, target) =>
          (target as MaterialPageRoute).barrierDismissible,
      'barrierColor': (visitor, target) =>
          (target as MaterialPageRoute).barrierColor,
      'barrierLabel': (visitor, target) =>
          (target as MaterialPageRoute).barrierLabel,
      'transitionDuration': (visitor, target) =>
          (target as MaterialPageRoute).transitionDuration,
      'reverseTransitionDuration': (visitor, target) =>
          (target as MaterialPageRoute).reverseTransitionDuration,
    },
  );
}

// NavigatorState bridging
BridgedClassDefinition getNavigatorStateBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: NavigatorState,
    name: 'NavigatorState',
    methods: {
      'push': (visitor, target, positionalArgs, namedArgs) {
        final route = positionalArgs[0] as Route<Object?>;
        return (target as NavigatorState).push(route);
      },
      'pushReplacement': (visitor, target, positionalArgs, namedArgs) {
        final newRoute = positionalArgs[0] as Route<Object?>;
        final result = namedArgs['result'];
        return (target as NavigatorState).pushReplacement(
          newRoute,
          result: result,
        );
      },
      'pushNamed': (visitor, target, positionalArgs, namedArgs) {
        final routeName = positionalArgs[0] as String;
        final arguments = namedArgs['arguments'];
        return (target as NavigatorState).pushNamed(
          routeName,
          arguments: arguments,
        );
      },
      'pop': (visitor, target, positionalArgs, namedArgs) {
        final result = positionalArgs.isNotEmpty ? positionalArgs[0] : null;
        (target as NavigatorState).pop(result);
        return null;
      },
      'canPop': (visitor, target, positionalArgs, namedArgs) {
        return (target as NavigatorState).canPop();
      },
      'maybePop': (visitor, target, positionalArgs, namedArgs) {
        final result = positionalArgs.isNotEmpty ? positionalArgs[0] : null;
        return (target as NavigatorState).maybePop(result);
      },
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        final rootNavigator = namedArgs.get<bool?>('rootNavigator') ?? false;
        return Navigator.of(context, rootNavigator: rootNavigator);
      },
    },
    getters: {'widget': (visitor, target) => (target as NavigatorState).widget},
  );
}

/// Returns the BridgedClassDefinition for RouteSettings
BridgedClassDefinition getRouteSettingsBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: RouteSettings,
    name: 'RouteSettings',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final name = namedArgs.get<String?>('name');
        final arguments = namedArgs.get('arguments');

        return RouteSettings(name: name, arguments: arguments);
      },
    },
    getters: {
      'name': (visitor, target) => (target as RouteSettings).name,
      'arguments': (visitor, target) => (target as RouteSettings).arguments,
    },
  );
}
