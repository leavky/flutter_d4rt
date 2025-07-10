import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getBaseTapGestureRecognizerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: BaseTapGestureRecognizer,
    name: 'BaseTapGestureRecognizer',
    constructors: {},
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as BaseTapGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as BaseTapGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {},
  );
}

BridgedClassDefinition getTapGestureRecognizerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: TapGestureRecognizer,
    name: 'TapGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return TapGestureRecognizer(debugOwner: namedArgs['debugOwner']);
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as TapGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as TapGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onTapDown': (visitor, target) =>
          (target as TapGestureRecognizer).onTapDown,
      'onTapUp': (visitor, target) => (target as TapGestureRecognizer).onTapUp,
      'onTap': (visitor, target) => (target as TapGestureRecognizer).onTap,
      'onTapCancel': (visitor, target) =>
          (target as TapGestureRecognizer).onTapCancel,
      'onSecondaryTap': (visitor, target) =>
          (target as TapGestureRecognizer).onSecondaryTap,
      'onSecondaryTapDown': (visitor, target) =>
          (target as TapGestureRecognizer).onSecondaryTapDown,
      'onSecondaryTapUp': (visitor, target) =>
          (target as TapGestureRecognizer).onSecondaryTapUp,
      'onSecondaryTapCancel': (visitor, target) =>
          (target as TapGestureRecognizer).onSecondaryTapCancel,
      'onTertiaryTapDown': (visitor, target) =>
          (target as TapGestureRecognizer).onTertiaryTapDown,
      'onTertiaryTapUp': (visitor, target) =>
          (target as TapGestureRecognizer).onTertiaryTapUp,
      'onTertiaryTapCancel': (visitor, target) =>
          (target as TapGestureRecognizer).onTertiaryTapCancel,
    },
    setters: {
      'onTapDown': (visitor, target, value) =>
          (target as TapGestureRecognizer).onTapDown =
              value as GestureTapDownCallback?,
      'onTapUp': (visitor, target, value) =>
          (target as TapGestureRecognizer).onTapUp =
              value as GestureTapUpCallback?,
      'onTap': (visitor, target, value) =>
          (target as TapGestureRecognizer).onTap = value as GestureTapCallback?,
      'onTapCancel': (visitor, target, value) =>
          (target as TapGestureRecognizer).onTapCancel =
              value as GestureTapCancelCallback?,
      'onSecondaryTap': (visitor, target, value) =>
          (target as TapGestureRecognizer).onSecondaryTap =
              value as GestureTapCallback?,
      'onSecondaryTapDown': (visitor, target, value) =>
          (target as TapGestureRecognizer).onSecondaryTapDown =
              value as GestureTapDownCallback?,
      'onSecondaryTapUp': (visitor, target, value) =>
          (target as TapGestureRecognizer).onSecondaryTapUp =
              value as GestureTapUpCallback?,
      'onSecondaryTapCancel': (visitor, target, value) =>
          (target as TapGestureRecognizer).onSecondaryTapCancel =
              value as GestureTapCancelCallback?,
      'onTertiaryTapDown': (visitor, target, value) =>
          (target as TapGestureRecognizer).onTertiaryTapDown =
              value as GestureTapDownCallback?,
      'onTertiaryTapUp': (visitor, target, value) =>
          (target as TapGestureRecognizer).onTertiaryTapUp =
              value as GestureTapUpCallback?,
      'onTertiaryTapCancel': (visitor, target, value) =>
          (target as TapGestureRecognizer).onTertiaryTapCancel =
              value as GestureTapCancelCallback?,
    },
  );
}

BridgedClassDefinition getTapDownDetailsBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: TapDownDetails,
    name: 'TapDownDetails',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return TapDownDetails(
          globalPosition:
              namedArgs.get<Offset>('globalPosition') ?? Offset.zero,
          localPosition: namedArgs['localPosition'] as Offset?,
          kind: namedArgs['kind'] as PointerDeviceKind?,
        );
      },
    },
    getters: {
      'globalPosition': (visitor, target) =>
          (target as TapDownDetails).globalPosition,
      'localPosition': (visitor, target) =>
          (target as TapDownDetails).localPosition,
      'kind': (visitor, target) => (target as TapDownDetails).kind,
    },
  );
}

BridgedClassDefinition getTapUpDetailsBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: TapUpDetails,
    name: 'TapUpDetails',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return TapUpDetails(
          kind:
              namedArgs.get<PointerDeviceKind>('kind') ??
              PointerDeviceKind.touch,
          globalPosition:
              namedArgs.get<Offset>('globalPosition') ?? Offset.zero,
          localPosition: namedArgs['localPosition'] as Offset?,
        );
      },
    },
    getters: {
      'globalPosition': (visitor, target) =>
          (target as TapUpDetails).globalPosition,
      'localPosition': (visitor, target) =>
          (target as TapUpDetails).localPosition,
      'kind': (visitor, target) => (target as TapUpDetails).kind,
    },
  );
}
