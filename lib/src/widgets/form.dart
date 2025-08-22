import 'package:d4rt/d4rt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

BridgedClass getFormStateBridgingDefinition() {
  return BridgedClass(
    nativeType: FormState,
    name: 'FormState',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return FormState();
      },
    },
    getters: {
      'context': (visitor, target) => (target as FormState).context,
      'mounted': (visitor, target) => (target as FormState).mounted,
      'widget': (visitor, target) => (target as FormState).widget,
      'hashCode': (visitor, target) => (target as FormState).hashCode,
      'runtimeType': (visitor, target) => (target as FormState).runtimeType,
    },
    methods: {
      'save': (visitor, target, positionalArgs, namedArgs) {
        (target as FormState).save();
        return null;
      },
      'reset': (visitor, target, positionalArgs, namedArgs) {
        (target as FormState).reset();
        return null;
      },
      'validate': (visitor, target, positionalArgs, namedArgs) {
        return (target as FormState).validate();
      },
      'debugFillProperties': (visitor, target, positionalArgs, namedArgs) {
        (target as FormState).debugFillProperties(
          positionalArgs[0] as DiagnosticPropertiesBuilder,
        );
        return null;
      },
      'toDiagnosticsNode': (visitor, target, positionalArgs, namedArgs) {
        return (target as FormState).toDiagnosticsNode(
          name: namedArgs.get<String?>('name'),
          style: namedArgs.get<DiagnosticsTreeStyle>('style'),
        );
      },
      'validateGranularly': (visitor, target, positionalArgs, namedArgs) {
        return (target as FormState).validateGranularly();
      },
      'toStringShort': (visitor, target, positionalArgs, namedArgs) {
        return (target as FormState).toStringShort();
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as FormState).toString();
      },
    },
  );
}
