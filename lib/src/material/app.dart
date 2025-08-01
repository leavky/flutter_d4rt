import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

// Helper function for route builder callbacks
Map<String, Widget Function(BuildContext)>? _handleRoutes(
  InterpreterVisitor visitor,
  dynamic routes,
) {
  if (routes == null) return null;
  if (routes is Map<String, dynamic>) {
    final Map<String, Widget Function(BuildContext)> processedRoutes = {};
    routes.forEach((key, value) {
      if (value is InterpretedFunction) {
        processedRoutes[key] = (BuildContext context) {
          final result = value.call(visitor, [context]);
          return visitor.toWidgets(result);
        };
      } else if (value is Widget Function(BuildContext)) {
        processedRoutes[key] = value;
      }
    });
    return processedRoutes;
  }
  return (routes as Map?)?.cast();
}

/// Returns the BridgedClassDefinition for the Flutter MaterialApp widget.
BridgedClassDefinition getMaterialAppBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: MaterialApp,
    name: 'MaterialApp',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final home = visitor.toWidgets(namedArgs['home']);
        final title = namedArgs.get<String?>('title') ?? '';
        final theme = namedArgs.get<ThemeData?>('theme');
        final darkTheme = namedArgs.get<ThemeData?>('darkTheme');
        final themeMode =
            namedArgs.get<ThemeMode?>('themeMode') ?? ThemeMode.system;
        final debugShowCheckedModeBanner =
            namedArgs.get<bool?>('debugShowCheckedModeBanner') ?? true;
        final color = namedArgs.get<Color?>('color');

        // Gestion des routes
        final routes = _handleRoutes(visitor, namedArgs['routes']);
        final initialRoute = namedArgs.get<String?>('initialRoute');

        return MaterialApp(
          key: key,
          home: home,
          title: title,
          theme: theme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          color: color,
          routes: routes ?? {},
          initialRoute: initialRoute,
        );
      },
    },
    getters: {
      'home': (visitor, target) => (target as MaterialApp).home,
      'title': (visitor, target) => (target as MaterialApp).title,
      'theme': (visitor, target) => (target as MaterialApp).theme,
      'darkTheme': (visitor, target) => (target as MaterialApp).darkTheme,
      'themeMode': (visitor, target) => (target as MaterialApp).themeMode,
      'debugShowCheckedModeBanner': (visitor, target) =>
          (target as MaterialApp).debugShowCheckedModeBanner,
      'color': (visitor, target) => (target as MaterialApp).color,
      'key': (visitor, target) => (target as MaterialApp).key,
    },
  );
}

BridgedEnumDefinition getThemeModeBridgingDefinition() {
  return BridgedEnumDefinition<ThemeMode>(
    name: 'ThemeMode',
    values: ThemeMode.values,
    getters: {
      'name': (visitor, target) => (target as ThemeMode).name,
      'index': (visitor, target) => (target as ThemeMode).index,
    },
  );
}
