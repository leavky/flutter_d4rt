import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getPointerSignalResolverBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: PointerSignalResolver,
    name: 'PointerSignalResolver',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PointerSignalResolver();
      },
    },
    methods: {
      'register': (visitor, target, positionalArgs, namedArgs) {
        final event = positionalArgs[0] as PointerSignalEvent;
        final callback = positionalArgs[1] as PointerSignalResolvedCallback;
        (target as PointerSignalResolver).register(event, callback);
        return null;
      },
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final event = positionalArgs[0] as PointerSignalEvent;
        (target as PointerSignalResolver).resolve(event);
        return null;
      },
    },
    getters: {},
  );
}
