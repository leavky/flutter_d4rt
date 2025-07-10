import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

// Le module monodrag est principalement couvert par les classes de drag
// déjà définies dans drag.dart, mais nous ajoutons ici des références supplémentaires

BridgedClassDefinition getMonoDragGestureRecognizerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DragGestureRecognizer,
    name: 'MonoDragGestureRecognizer',
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
    },
  );
}
