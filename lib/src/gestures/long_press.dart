import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getLongPressGestureRecognizerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: LongPressGestureRecognizer,
    name: 'LongPressGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return LongPressGestureRecognizer(
          duration: namedArgs['duration'] as Duration?,
          postAcceptSlopTolerance:
              namedArgs['postAcceptSlopTolerance'] as double?,
          debugOwner: namedArgs['debugOwner'],
        );
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as LongPressGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as LongPressGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onLongPress': (visitor, target) =>
          (target as LongPressGestureRecognizer).onLongPress,
      'onLongPressStart': (visitor, target) =>
          (target as LongPressGestureRecognizer).onLongPressStart,
      'onLongPressMoveUpdate': (visitor, target) =>
          (target as LongPressGestureRecognizer).onLongPressMoveUpdate,
      'onLongPressUp': (visitor, target) =>
          (target as LongPressGestureRecognizer).onLongPressUp,
      'onLongPressEnd': (visitor, target) =>
          (target as LongPressGestureRecognizer).onLongPressEnd,
      'onSecondaryLongPress': (visitor, target) =>
          (target as LongPressGestureRecognizer).onSecondaryLongPress,
      'onSecondaryLongPressStart': (visitor, target) =>
          (target as LongPressGestureRecognizer).onSecondaryLongPressStart,
      'onSecondaryLongPressMoveUpdate': (visitor, target) =>
          (target as LongPressGestureRecognizer).onSecondaryLongPressMoveUpdate,
      'onSecondaryLongPressUp': (visitor, target) =>
          (target as LongPressGestureRecognizer).onSecondaryLongPressUp,
      'onSecondaryLongPressEnd': (visitor, target) =>
          (target as LongPressGestureRecognizer).onSecondaryLongPressEnd,
      'onTertiaryLongPress': (visitor, target) =>
          (target as LongPressGestureRecognizer).onTertiaryLongPress,
      'onTertiaryLongPressStart': (visitor, target) =>
          (target as LongPressGestureRecognizer).onTertiaryLongPressStart,
      'onTertiaryLongPressMoveUpdate': (visitor, target) =>
          (target as LongPressGestureRecognizer).onTertiaryLongPressMoveUpdate,
      'onTertiaryLongPressUp': (visitor, target) =>
          (target as LongPressGestureRecognizer).onTertiaryLongPressUp,
      'onTertiaryLongPressEnd': (visitor, target) =>
          (target as LongPressGestureRecognizer).onTertiaryLongPressEnd,
    },
  );
}

BridgedClassDefinition getLongPressStartDetailsBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: LongPressStartDetails,
    name: 'LongPressStartDetails',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return LongPressStartDetails(
          globalPosition:
              namedArgs.get<Offset>('globalPosition') ?? Offset.zero,
          localPosition: namedArgs['localPosition'] as Offset?,
        );
      },
    },
    getters: {
      'globalPosition': (visitor, target) =>
          (target as LongPressStartDetails).globalPosition,
      'localPosition': (visitor, target) =>
          (target as LongPressStartDetails).localPosition,
    },
  );
}

BridgedClassDefinition getLongPressMoveUpdateDetailsBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: LongPressMoveUpdateDetails,
    name: 'LongPressMoveUpdateDetails',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return LongPressMoveUpdateDetails(
          globalPosition:
              namedArgs.get<Offset>('globalPosition') ?? Offset.zero,
          localPosition: namedArgs['localPosition'] as Offset?,
          offsetFromOrigin:
              namedArgs.get<Offset>('offsetFromOrigin') ?? Offset.zero,
          localOffsetFromOrigin: namedArgs['localOffsetFromOrigin'] as Offset?,
        );
      },
    },
    getters: {
      'globalPosition': (visitor, target) =>
          (target as LongPressMoveUpdateDetails).globalPosition,
      'localPosition': (visitor, target) =>
          (target as LongPressMoveUpdateDetails).localPosition,
      'offsetFromOrigin': (visitor, target) =>
          (target as LongPressMoveUpdateDetails).offsetFromOrigin,
      'localOffsetFromOrigin': (visitor, target) =>
          (target as LongPressMoveUpdateDetails).localOffsetFromOrigin,
    },
  );
}

BridgedClassDefinition getLongPressEndDetailsBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: LongPressEndDetails,
    name: 'LongPressEndDetails',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return LongPressEndDetails(
          globalPosition:
              namedArgs.get<Offset>('globalPosition') ?? Offset.zero,
          localPosition: namedArgs['localPosition'] as Offset?,
          velocity: namedArgs.get<Velocity>('velocity') ?? Velocity.zero,
        );
      },
    },
    getters: {
      'globalPosition': (visitor, target) =>
          (target as LongPressEndDetails).globalPosition,
      'localPosition': (visitor, target) =>
          (target as LongPressEndDetails).localPosition,
      'velocity': (visitor, target) => (target as LongPressEndDetails).velocity,
    },
  );
}
