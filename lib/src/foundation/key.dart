import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';

BridgedClass getKeyBridgingDefinition() {
  return BridgedClass(
    nativeType: Key,
    name: 'Key',
    getters: {
      'hashCode': (visitor, target) => (target as Key).hashCode,
      'runtimeType': (visitor, target) => (target as Key).runtimeType,
    },
  );
}

BridgedClass getLocalKeyBridgingDefinition() {
  return BridgedClass(
    nativeType: LocalKey,
    name: 'LocalKey',
    getters: {
      'hashCode': (visitor, target) => (target as LocalKey).hashCode,
      'runtimeType': (visitor, target) => (target as LocalKey).runtimeType,
    },
  );
}

BridgedClass getValueKeyBridgingDefinition() {
  return BridgedClass(
    nativeType: ValueKey,
    name: 'ValueKey',
    getters: {
      'value': (visitor, target) => (target as ValueKey).value,
      'hashCode': (visitor, target) => (target as ValueKey).hashCode,
      'runtimeType': (visitor, target) => (target as LocalKey).runtimeType,
    },
    methods: {
      '==': (visitor, target, positionalArgs, namedArgs) {
        return (target as ValueKey) == positionalArgs[0];
      },
    },
  );
}
