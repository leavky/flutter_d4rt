import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';

/// Returns the BridgedClassDefinition for the Flutter Spacer widget.
BridgedClassDefinition getSpacerBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Spacer,
    name: 'Spacer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final flex = namedArgs.get<int?>('flex') ?? 1;

        return Spacer(key: key, flex: flex);
      },
    },
    getters: {
      'flex': (visitor, target) => (target as Spacer).flex,
      'key': (visitor, target) => (target as Spacer).key,
    },
  );
}
