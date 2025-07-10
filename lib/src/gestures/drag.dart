import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getDragGestureRecognizerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DragGestureRecognizer,
    name: 'DragGestureRecognizer',
    constructors: {},
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as DragGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as DragGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onDown': (visitor, target) => (target as DragGestureRecognizer).onDown,
      'onStart': (visitor, target) => (target as DragGestureRecognizer).onStart,
      'onUpdate': (visitor, target) =>
          (target as DragGestureRecognizer).onUpdate,
      'onEnd': (visitor, target) => (target as DragGestureRecognizer).onEnd,
      'onCancel': (visitor, target) =>
          (target as DragGestureRecognizer).onCancel,
      'minFlingDistance': (visitor, target) =>
          (target as DragGestureRecognizer).minFlingDistance,
      'minFlingVelocity': (visitor, target) =>
          (target as DragGestureRecognizer).minFlingVelocity,
      'maxFlingVelocity': (visitor, target) =>
          (target as DragGestureRecognizer).maxFlingVelocity,
      'dragStartBehavior': (visitor, target) =>
          (target as DragGestureRecognizer).dragStartBehavior,
    },
    setters: {
      'onDown': (visitor, target, value) =>
          (target as DragGestureRecognizer).onDown =
              value as GestureDragDownCallback?,
      'onStart': (visitor, target, value) =>
          (target as DragGestureRecognizer).onStart =
              value as GestureDragStartCallback?,
      'onUpdate': (visitor, target, value) =>
          (target as DragGestureRecognizer).onUpdate =
              value as GestureDragUpdateCallback?,
      'onEnd': (visitor, target, value) =>
          (target as DragGestureRecognizer).onEnd =
              value as GestureDragEndCallback?,
      'onCancel': (visitor, target, value) =>
          (target as DragGestureRecognizer).onCancel =
              value as GestureDragCancelCallback?,
      'minFlingDistance': (visitor, target, value) =>
          (target as DragGestureRecognizer).minFlingDistance = value as double?,
      'minFlingVelocity': (visitor, target, value) =>
          (target as DragGestureRecognizer).minFlingVelocity = value as double?,
      'maxFlingVelocity': (visitor, target, value) =>
          (target as DragGestureRecognizer).maxFlingVelocity = value as double?,
      'dragStartBehavior': (visitor, target, value) =>
          (target as DragGestureRecognizer).dragStartBehavior =
              value as DragStartBehavior,
    },
  );
}

BridgedClassDefinition getVerticalDragGestureRecognizerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: VerticalDragGestureRecognizer,
    name: 'VerticalDragGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return VerticalDragGestureRecognizer(
          debugOwner: namedArgs['debugOwner'],
        );
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as VerticalDragGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as VerticalDragGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onDown': (visitor, target) =>
          (target as VerticalDragGestureRecognizer).onDown,
      'onStart': (visitor, target) =>
          (target as VerticalDragGestureRecognizer).onStart,
      'onUpdate': (visitor, target) =>
          (target as VerticalDragGestureRecognizer).onUpdate,
      'onEnd': (visitor, target) =>
          (target as VerticalDragGestureRecognizer).onEnd,
      'onCancel': (visitor, target) =>
          (target as VerticalDragGestureRecognizer).onCancel,
    },
    setters: {
      'onDown': (visitor, target, value) =>
          (target as VerticalDragGestureRecognizer).onDown =
              value as GestureDragDownCallback?,
      'onStart': (visitor, target, value) =>
          (target as VerticalDragGestureRecognizer).onStart =
              value as GestureDragStartCallback?,
      'onUpdate': (visitor, target, value) =>
          (target as VerticalDragGestureRecognizer).onUpdate =
              value as GestureDragUpdateCallback?,
      'onEnd': (visitor, target, value) =>
          (target as VerticalDragGestureRecognizer).onEnd =
              value as GestureDragEndCallback?,
      'onCancel': (visitor, target, value) =>
          (target as VerticalDragGestureRecognizer).onCancel =
              value as GestureDragCancelCallback?,
    },
  );
}

BridgedClassDefinition getHorizontalDragGestureRecognizerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: HorizontalDragGestureRecognizer,
    name: 'HorizontalDragGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return HorizontalDragGestureRecognizer(
          debugOwner: namedArgs['debugOwner'],
        );
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as HorizontalDragGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as HorizontalDragGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onDown': (visitor, target) =>
          (target as HorizontalDragGestureRecognizer).onDown,
      'onStart': (visitor, target) =>
          (target as HorizontalDragGestureRecognizer).onStart,
      'onUpdate': (visitor, target) =>
          (target as HorizontalDragGestureRecognizer).onUpdate,
      'onEnd': (visitor, target) =>
          (target as HorizontalDragGestureRecognizer).onEnd,
      'onCancel': (visitor, target) =>
          (target as HorizontalDragGestureRecognizer).onCancel,
    },
    setters: {
      'onDown': (visitor, target, value) =>
          (target as HorizontalDragGestureRecognizer).onDown =
              value as GestureDragDownCallback?,
      'onStart': (visitor, target, value) =>
          (target as HorizontalDragGestureRecognizer).onStart =
              value as GestureDragStartCallback?,
      'onUpdate': (visitor, target, value) =>
          (target as HorizontalDragGestureRecognizer).onUpdate =
              value as GestureDragUpdateCallback?,
      'onEnd': (visitor, target, value) =>
          (target as HorizontalDragGestureRecognizer).onEnd =
              value as GestureDragEndCallback?,
      'onCancel': (visitor, target, value) =>
          (target as HorizontalDragGestureRecognizer).onCancel =
              value as GestureDragCancelCallback?,
    },
  );
}

BridgedClassDefinition getPanGestureRecognizerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: PanGestureRecognizer,
    name: 'PanGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return PanGestureRecognizer(debugOwner: namedArgs['debugOwner']);
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as PanGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as PanGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {
      'onDown': (visitor, target) => (target as PanGestureRecognizer).onDown,
      'onStart': (visitor, target) => (target as PanGestureRecognizer).onStart,
      'onUpdate': (visitor, target) =>
          (target as PanGestureRecognizer).onUpdate,
      'onEnd': (visitor, target) => (target as PanGestureRecognizer).onEnd,
      'onCancel': (visitor, target) =>
          (target as PanGestureRecognizer).onCancel,
    },
    setters: {
      'onDown': (visitor, target, value) =>
          (target as PanGestureRecognizer).onDown =
              value as GestureDragDownCallback?,
      'onStart': (visitor, target, value) =>
          (target as PanGestureRecognizer).onStart =
              value as GestureDragStartCallback?,
      'onUpdate': (visitor, target, value) =>
          (target as PanGestureRecognizer).onUpdate =
              value as GestureDragUpdateCallback?,
      'onEnd': (visitor, target, value) =>
          (target as PanGestureRecognizer).onEnd =
              value as GestureDragEndCallback?,
      'onCancel': (visitor, target, value) =>
          (target as PanGestureRecognizer).onCancel =
              value as GestureDragCancelCallback?,
    },
  );
}
