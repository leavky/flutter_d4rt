import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getEagerGestureRecognizerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: EagerGestureRecognizer,
    name: 'EagerGestureRecognizer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return EagerGestureRecognizer();
      },
    },
    methods: {
      'addPointer': (visitor, target, positionalArgs, namedArgs) {
        final details = positionalArgs[0] as PointerDownEvent;
        (target as EagerGestureRecognizer).addPointer(details);
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as EagerGestureRecognizer).dispose();
        return null;
      },
    },
    getters: {},
  );
}
