import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getGestureArenaManagerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: GestureArenaManager,
    name: 'GestureArenaManager',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return GestureArenaManager();
      },
    },
    methods: {
      'add': (visitor, target, positionalArgs, namedArgs) {
        final pointer = positionalArgs[0] as int;
        final member = positionalArgs[1] as GestureArenaMember;
        return (target as GestureArenaManager).add(pointer, member);
      },
      'close': (visitor, target, positionalArgs, namedArgs) {
        final pointer = positionalArgs[0] as int;
        (target as GestureArenaManager).close(pointer);
        return null;
      },
    },
    getters: {},
  );
}

BridgedClassDefinition getGestureArenaEntryBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: GestureArenaEntry,
    name: 'GestureArenaEntry',
    constructors: {},
    methods: {
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final disposition = positionalArgs[0] as GestureDisposition;
        (target as GestureArenaEntry).resolve(disposition);
        return null;
      },
    },
    getters: {},
  );
}

BridgedEnumDefinition getGestureDispositionBridgingDefinition() {
  return BridgedEnumDefinition<GestureDisposition>(
    name: 'GestureDisposition',
    values: GestureDisposition.values,
    getters: {
      'name': (visitor, target) => (target as GestureDisposition).name,
      'index': (visitor, target) => (target as GestureDisposition).index,
    },
  );
}
