import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/double.dart';

BridgedClass getPointerEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerEvent,
    name: 'PointerEvent',
    constructors: {},
    getters: {
      'timeStamp': (visitor, target) => (target as PointerEvent).timeStamp,
      'pointer': (visitor, target) => (target as PointerEvent).pointer,
      'kind': (visitor, target) => (target as PointerEvent).kind,
      'device': (visitor, target) => (target as PointerEvent).device,
      'position': (visitor, target) => (target as PointerEvent).position,
      'localPosition': (visitor, target) =>
          (target as PointerEvent).localPosition,
    },
  );
}

BridgedClass getPointerDownEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerDownEvent,
    name: 'PointerDownEvent',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PointerDownEvent(
          timeStamp: namedArgs.get<Duration>('timeStamp') ?? Duration.zero,
          pointer: namedArgs.get<int?>('pointer') ?? 0,
          kind:
              namedArgs.get<PointerDeviceKind>('kind') ??
              PointerDeviceKind.touch,
          device: namedArgs.get<int?>('device') ?? 0,
          position: namedArgs.get<Offset>('position') ?? Offset.zero,
          buttons: namedArgs.get<int?>('buttons') ?? 0,
          obscured: namedArgs.get<bool?>('obscured') ?? false,
          pressureMin: toDouble(namedArgs.get<dynamic>('pressureMin')) ?? 1.0,
          pressureMax: toDouble(namedArgs.get<dynamic>('pressureMax')) ?? 1.0,
          distanceMax: toDouble(namedArgs.get<dynamic>('distanceMax')) ?? 0.0,
          radiusMin: toDouble(namedArgs.get<dynamic>('radiusMin')) ?? 0.0,
          radiusMax: toDouble(namedArgs.get<dynamic>('radiusMax')) ?? 0.0,
        );
      },
    },
    getters: {
      'timeStamp': (visitor, target) => (target as PointerDownEvent).timeStamp,
      'pointer': (visitor, target) => (target as PointerDownEvent).pointer,
      'kind': (visitor, target) => (target as PointerDownEvent).kind,
      'device': (visitor, target) => (target as PointerDownEvent).device,
      'position': (visitor, target) => (target as PointerDownEvent).position,
      'localPosition': (visitor, target) =>
          (target as PointerDownEvent).localPosition,
    },
  );
}

BridgedClass getPointerMoveEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerMoveEvent,
    name: 'PointerMoveEvent',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PointerMoveEvent(
          timeStamp: namedArgs.get<Duration>('timeStamp') ?? Duration.zero,
          pointer: namedArgs.get<int?>('pointer') ?? 0,
          kind:
              namedArgs.get<PointerDeviceKind>('kind') ??
              PointerDeviceKind.touch,
          device: namedArgs.get<int?>('device') ?? 0,
          position: namedArgs.get<Offset>('position') ?? Offset.zero,
          delta: namedArgs.get<Offset>('delta') ?? Offset.zero,
          buttons: namedArgs.get<int?>('buttons') ?? 0,
          obscured: namedArgs.get<bool?>('obscured') ?? false,
          pressureMin: toDouble(namedArgs.get<dynamic>('pressureMin')) ?? 1.0,
          pressureMax: toDouble(namedArgs.get<dynamic>('pressureMax')) ?? 1.0,
          distanceMax: toDouble(namedArgs.get<dynamic>('distanceMax')) ?? 0.0,
          radiusMin: toDouble(namedArgs.get<dynamic>('radiusMin')) ?? 0.0,
          radiusMax: toDouble(namedArgs.get<dynamic>('radiusMax')) ?? 0.0,
        );
      },
    },
    getters: {
      'timeStamp': (visitor, target) => (target as PointerMoveEvent).timeStamp,
      'pointer': (visitor, target) => (target as PointerMoveEvent).pointer,
      'delta': (visitor, target) => (target as PointerMoveEvent).delta,
      'position': (visitor, target) => (target as PointerMoveEvent).position,
      'localPosition': (visitor, target) =>
          (target as PointerMoveEvent).localPosition,
    },
  );
}

BridgedClass getPointerUpEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerUpEvent,
    name: 'PointerUpEvent',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PointerUpEvent(
          timeStamp: namedArgs.get<Duration>('timeStamp') ?? Duration.zero,
          pointer: namedArgs.get<int?>('pointer') ?? 0,
          kind:
              namedArgs.get<PointerDeviceKind>('kind') ??
              PointerDeviceKind.touch,
          device: namedArgs.get<int?>('device') ?? 0,
          position: namedArgs.get<Offset>('position') ?? Offset.zero,
          buttons: namedArgs.get<int?>('buttons') ?? 0,
          obscured: namedArgs.get<bool?>('obscured') ?? false,
          pressureMin: toDouble(namedArgs.get<dynamic>('pressureMin')) ?? 1.0,
          pressureMax: toDouble(namedArgs.get<dynamic>('pressureMax')) ?? 1.0,
          distanceMax: toDouble(namedArgs.get<dynamic>('distanceMax')) ?? 0.0,
          radiusMin: toDouble(namedArgs.get<dynamic>('radiusMin')) ?? 0.0,
          radiusMax: toDouble(namedArgs.get<dynamic>('radiusMax')) ?? 0.0,
        );
      },
    },
    getters: {
      'timeStamp': (visitor, target) => (target as PointerUpEvent).timeStamp,
      'pointer': (visitor, target) => (target as PointerUpEvent).pointer,
      'position': (visitor, target) => (target as PointerUpEvent).position,
      'localPosition': (visitor, target) =>
          (target as PointerUpEvent).localPosition,
    },
  );
}

BridgedClass getPointerCancelEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerCancelEvent,
    name: 'PointerCancelEvent',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PointerCancelEvent(
          timeStamp: namedArgs.get<Duration>('timeStamp') ?? Duration.zero,
          pointer: namedArgs.get<int?>('pointer') ?? 0,
          kind:
              namedArgs.get<PointerDeviceKind>('kind') ??
              PointerDeviceKind.touch,
          device: namedArgs.get<int?>('device') ?? 0,
          position: namedArgs.get<Offset>('position') ?? Offset.zero,
          buttons: namedArgs.get<int?>('buttons') ?? 0,
          obscured: namedArgs.get<bool?>('obscured') ?? false,
          pressureMin: toDouble(namedArgs.get<dynamic>('pressureMin')) ?? 1.0,
          pressureMax: toDouble(namedArgs.get<dynamic>('pressureMax')) ?? 1.0,
          distanceMax: toDouble(namedArgs.get<dynamic>('distanceMax')) ?? 0.0,
          radiusMin: toDouble(namedArgs.get<dynamic>('radiusMin')) ?? 0.0,
          radiusMax: toDouble(namedArgs.get<dynamic>('radiusMax')) ?? 0.0,
        );
      },
    },
    getters: {
      'timeStamp': (visitor, target) =>
          (target as PointerCancelEvent).timeStamp,
      'pointer': (visitor, target) => (target as PointerCancelEvent).pointer,
      'position': (visitor, target) => (target as PointerCancelEvent).position,
      'localPosition': (visitor, target) =>
          (target as PointerCancelEvent).localPosition,
    },
  );
}

BridgedClass getPointerAddedEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerAddedEvent,
    name: 'PointerAddedEvent',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PointerAddedEvent(
          timeStamp: namedArgs.get<Duration>('timeStamp') ?? Duration.zero,
          pointer: namedArgs.get<int?>('pointer') ?? 0,
          kind:
              namedArgs.get<PointerDeviceKind>('kind') ??
              PointerDeviceKind.touch,
          device: namedArgs.get<int?>('device') ?? 0,
          position: namedArgs.get<Offset>('position') ?? Offset.zero,
          obscured: namedArgs.get<bool?>('obscured') ?? false,
          pressureMin: toDouble(namedArgs.get<dynamic>('pressureMin')) ?? 1.0,
          pressureMax: toDouble(namedArgs.get<dynamic>('pressureMax')) ?? 1.0,
          distanceMax: toDouble(namedArgs.get<dynamic>('distanceMax')) ?? 0.0,
          radiusMin: toDouble(namedArgs.get<dynamic>('radiusMin')) ?? 0.0,
          radiusMax: toDouble(namedArgs.get<dynamic>('radiusMax')) ?? 0.0,
        );
      },
    },
    getters: {
      'timeStamp': (visitor, target) => (target as PointerAddedEvent).timeStamp,
      'pointer': (visitor, target) => (target as PointerAddedEvent).pointer,
      'position': (visitor, target) => (target as PointerAddedEvent).position,
    },
  );
}

BridgedClass getPointerRemovedEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerRemovedEvent,
    name: 'PointerRemovedEvent',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PointerRemovedEvent(
          timeStamp: namedArgs.get<Duration>('timeStamp') ?? Duration.zero,
          pointer: namedArgs.get<int?>('pointer') ?? 0,
          kind:
              namedArgs.get<PointerDeviceKind>('kind') ??
              PointerDeviceKind.touch,
          device: namedArgs.get<int?>('device') ?? 0,
          position: namedArgs.get<Offset>('position') ?? Offset.zero,
          obscured: namedArgs.get<bool?>('obscured') ?? false,
          pressureMin: toDouble(namedArgs.get<dynamic>('pressureMin')) ?? 1.0,
          pressureMax: toDouble(namedArgs.get<dynamic>('pressureMax')) ?? 1.0,
          distanceMax: toDouble(namedArgs.get<dynamic>('distanceMax')) ?? 0.0,
          radiusMin: toDouble(namedArgs.get<dynamic>('radiusMin')) ?? 0.0,
          radiusMax: toDouble(namedArgs.get<dynamic>('radiusMax')) ?? 0.0,
        );
      },
    },
    getters: {
      'timeStamp': (visitor, target) =>
          (target as PointerRemovedEvent).timeStamp,
      'pointer': (visitor, target) => (target as PointerRemovedEvent).pointer,
      'position': (visitor, target) => (target as PointerRemovedEvent).position,
    },
  );
}

BridgedClass getPointerHoverEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerHoverEvent,
    name: 'PointerHoverEvent',
    constructors: {},
    getters: {
      'timeStamp': (visitor, target) => (target as PointerHoverEvent).timeStamp,
      'pointer': (visitor, target) => (target as PointerHoverEvent).pointer,
      'position': (visitor, target) => (target as PointerHoverEvent).position,
    },
  );
}

BridgedClass getPointerEnterEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerEnterEvent,
    name: 'PointerEnterEvent',
    constructors: {},
    getters: {
      'timeStamp': (visitor, target) => (target as PointerEnterEvent).timeStamp,
      'pointer': (visitor, target) => (target as PointerEnterEvent).pointer,
      'position': (visitor, target) => (target as PointerEnterEvent).position,
    },
  );
}

BridgedClass getPointerExitEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerExitEvent,
    name: 'PointerExitEvent',
    constructors: {},
    getters: {
      'timeStamp': (visitor, target) => (target as PointerExitEvent).timeStamp,
      'pointer': (visitor, target) => (target as PointerExitEvent).pointer,
      'position': (visitor, target) => (target as PointerExitEvent).position,
    },
  );
}

BridgedClass getPointerSignalEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerSignalEvent,
    name: 'PointerSignalEvent',
    constructors: {},
    getters: {
      'timeStamp': (visitor, target) =>
          (target as PointerSignalEvent).timeStamp,
      'pointer': (visitor, target) => (target as PointerSignalEvent).pointer,
      'position': (visitor, target) => (target as PointerSignalEvent).position,
    },
  );
}

BridgedClass getPointerScrollEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerScrollEvent,
    name: 'PointerScrollEvent',
    constructors: {},
    getters: {
      'timeStamp': (visitor, target) =>
          (target as PointerScrollEvent).timeStamp,
      'pointer': (visitor, target) => (target as PointerScrollEvent).pointer,
      'position': (visitor, target) => (target as PointerScrollEvent).position,
      'scrollDelta': (visitor, target) =>
          (target as PointerScrollEvent).scrollDelta,
    },
  );
}

BridgedClass getPointerPanZoomStartEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerPanZoomStartEvent,
    name: 'PointerPanZoomStartEvent',
    constructors: {},
    getters: {
      'timeStamp': (visitor, target) =>
          (target as PointerPanZoomStartEvent).timeStamp,
      'pointer': (visitor, target) =>
          (target as PointerPanZoomStartEvent).pointer,
      'position': (visitor, target) =>
          (target as PointerPanZoomStartEvent).position,
    },
  );
}

BridgedClass getPointerPanZoomUpdateEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerPanZoomUpdateEvent,
    name: 'PointerPanZoomUpdateEvent',
    constructors: {},
    getters: {
      'timeStamp': (visitor, target) =>
          (target as PointerPanZoomUpdateEvent).timeStamp,
      'pointer': (visitor, target) =>
          (target as PointerPanZoomUpdateEvent).pointer,
      'position': (visitor, target) =>
          (target as PointerPanZoomUpdateEvent).position,
      'pan': (visitor, target) => (target as PointerPanZoomUpdateEvent).pan,
      'scale': (visitor, target) => (target as PointerPanZoomUpdateEvent).scale,
      'rotation': (visitor, target) =>
          (target as PointerPanZoomUpdateEvent).rotation,
    },
  );
}

BridgedClass getPointerPanZoomEndEventBridgingDefinition() {
  return BridgedClass(
    nativeType: PointerPanZoomEndEvent,
    name: 'PointerPanZoomEndEvent',
    constructors: {},
    getters: {
      'timeStamp': (visitor, target) =>
          (target as PointerPanZoomEndEvent).timeStamp,
      'pointer': (visitor, target) =>
          (target as PointerPanZoomEndEvent).pointer,
      'position': (visitor, target) =>
          (target as PointerPanZoomEndEvent).position,
    },
  );
}
