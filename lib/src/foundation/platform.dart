import 'package:d4rt/d4rt.dart';
import 'package:flutter/foundation.dart';

/// Returns the BridgedEnumDefinition for the Flutter TargetPlatform enum.
BridgedEnumDefinition<TargetPlatform> getTargetPlatformBridgingDefinition() {
  return BridgedEnumDefinition(
    name: 'TargetPlatform',
    values: TargetPlatform.values,
    methods: {
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as TargetPlatform).toString();
      },
      'runtimeType': (visitor, target, positionalArgs, namedArgs) {
        return (target as TargetPlatform).runtimeType;
      },
      'hashCode': (visitor, target, positionalArgs, namedArgs) {
        return (target as TargetPlatform).hashCode;
      },
    },
  );
}
