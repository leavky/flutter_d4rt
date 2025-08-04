import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClass getPointerRouterBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerRouter,
    name: 'PointerRouter',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PointerRouter();
      },
    },
    methods: {
      'addRoute': (visitor, target, positionalArgs, namedArgs) {
        final pointer = positionalArgs[0] as int;
        final route = positionalArgs[1] as PointerRoute;
        (target as PointerRouter).addRoute(pointer, route);
        return null;
      },
      'removeRoute': (visitor, target, positionalArgs, namedArgs) {
        final pointer = positionalArgs[0] as int;
        final route = positionalArgs[1] as PointerRoute;
        (target as PointerRouter).removeRoute(pointer, route);
        return null;
      },
      'addGlobalRoute': (visitor, target, positionalArgs, namedArgs) {
        final route = positionalArgs[0] as PointerRoute;
        (target as PointerRouter).addGlobalRoute(route);
        return null;
      },
      'removeGlobalRoute': (visitor, target, positionalArgs, namedArgs) {
        final route = positionalArgs[0] as PointerRoute;
        (target as PointerRouter).removeGlobalRoute(route);
        return null;
      },
      'route': (visitor, target, positionalArgs, namedArgs) {
        final event = positionalArgs[0] as PointerEvent;
        (target as PointerRouter).route(event);
        return null;
      },
    },
    getters: {},
  );
}
