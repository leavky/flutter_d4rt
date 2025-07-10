import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';

/// Returns the BridgedClassDefinition for the Flutter TextEditingController class.
BridgedClassDefinition getTextEditingControllerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: TextEditingController,
    name: 'TextEditingController',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final text = namedArgs.get<String?>('text');
        return TextEditingController(text: text);
      },
      'fromValue': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.get<TextEditingValue>(0);
        return TextEditingController.fromValue(value!);
      },
    },
    methods: {
      'clear': (visitor, target, positionalArgs, namedArgs) {
        (target as TextEditingController).clear();
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as TextEditingController).dispose();
        return null;
      },
    },
    getters: {
      'text': (visitor, target) => (target as TextEditingController).text,
      'value': (visitor, target) => (target as TextEditingController).value,
      'selection': (visitor, target) =>
          (target as TextEditingController).selection,
    },
    setters: {
      'text': (visitor, target, value) =>
          (target as TextEditingController).text = value as String,
      'value': (visitor, target, value) =>
          (target as TextEditingController).value = value as TextEditingValue,
      'selection': (visitor, target, value) =>
          (target as TextEditingController).selection = value as TextSelection,
    },
  );
}
