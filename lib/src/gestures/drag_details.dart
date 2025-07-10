import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getDragStartDetailsBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DragStartDetails,
    name: 'DragStartDetails',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return DragStartDetails(
          sourceTimeStamp: namedArgs['sourceTimeStamp'] as Duration?,
          globalPosition:
              namedArgs.get<Offset>('globalPosition') ?? Offset.zero,
          localPosition: namedArgs['localPosition'] as Offset?,
          kind: namedArgs['kind'] as PointerDeviceKind?,
        );
      },
    },
    getters: {
      'sourceTimeStamp': (visitor, target) =>
          (target as DragStartDetails).sourceTimeStamp,
      'globalPosition': (visitor, target) =>
          (target as DragStartDetails).globalPosition,
      'localPosition': (visitor, target) =>
          (target as DragStartDetails).localPosition,
      'kind': (visitor, target) => (target as DragStartDetails).kind,
    },
  );
}

BridgedClassDefinition getDragUpdateDetailsBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DragUpdateDetails,
    name: 'DragUpdateDetails',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return DragUpdateDetails(
          sourceTimeStamp: namedArgs['sourceTimeStamp'] as Duration?,
          delta: namedArgs.get<Offset>('delta') ?? Offset.zero,
          primaryDelta: namedArgs['primaryDelta'] as double?,
          globalPosition:
              namedArgs.get<Offset>('globalPosition') ?? Offset.zero,
          localPosition: namedArgs['localPosition'] as Offset?,
        );
      },
    },
    getters: {
      'sourceTimeStamp': (visitor, target) =>
          (target as DragUpdateDetails).sourceTimeStamp,
      'delta': (visitor, target) => (target as DragUpdateDetails).delta,
      'primaryDelta': (visitor, target) =>
          (target as DragUpdateDetails).primaryDelta,
      'globalPosition': (visitor, target) =>
          (target as DragUpdateDetails).globalPosition,
      'localPosition': (visitor, target) =>
          (target as DragUpdateDetails).localPosition,
    },
  );
}

BridgedClassDefinition getDragEndDetailsBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DragEndDetails,
    name: 'DragEndDetails',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return DragEndDetails(
          velocity: namedArgs.get<Velocity>('velocity') ?? Velocity.zero,
          primaryVelocity: namedArgs['primaryVelocity'] as double?,
        );
      },
    },
    getters: {
      'velocity': (visitor, target) => (target as DragEndDetails).velocity,
      'primaryVelocity': (visitor, target) =>
          (target as DragEndDetails).primaryVelocity,
    },
  );
}
