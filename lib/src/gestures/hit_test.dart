import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getHitTestResultBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: HitTestResult,
    name: 'HitTestResult',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return HitTestResult();
      },
      'wrap': (visitor, positionalArgs, namedArgs) {
        final result = positionalArgs[0] as HitTestResult;
        return HitTestResult.wrap(result);
      },
    },
    methods: {
      'add': (visitor, target, positionalArgs, namedArgs) {
        final entry = positionalArgs[0] as HitTestEntry;
        (target as HitTestResult).add(entry);
        return null;
      },
    },
    getters: {'path': (visitor, target) => (target as HitTestResult).path},
  );
}

BridgedClassDefinition getHitTestEntryBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: HitTestEntry,
    name: 'HitTestEntry',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final target = positionalArgs[0] as HitTestTarget;
        return HitTestEntry(target);
      },
    },
    getters: {'target': (visitor, target) => (target as HitTestEntry).target},
  );
}

abstract class BridgedHitTestTarget {
  static BridgedClassDefinition get definition => BridgedClassDefinition(
    nativeType: HitTestTarget,
    name: 'HitTestTarget',
    constructors: {},
    methods: {
      'handleEvent': (visitor, target, positionalArgs, namedArgs) {
        final event = positionalArgs[0] as PointerEvent;
        final entry = positionalArgs[1] as HitTestEntry;
        (target as HitTestTarget).handleEvent(event, entry);
        return null;
      },
    },
    getters: {},
  );
}

BridgedClassDefinition getHitTestTargetBridgingDefinition() {
  return BridgedHitTestTarget.definition;
}
