import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClass getGestureArenaTeamBridgingDefinition() {
  return BridgedClass(
    nativeType: GestureArenaTeam,
    name: 'GestureArenaTeam',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return GestureArenaTeam();
      },
    },
    methods: {
      'add': (visitor, target, positionalArgs, namedArgs) {
        final pointer = positionalArgs[0] as int;
        final member = positionalArgs[1] as GestureArenaMember;
        return (target as GestureArenaTeam).add(pointer, member);
      },
    },
    getters: {
      'captain': (visitor, target) => (target as GestureArenaTeam).captain,
    },
  );
}
