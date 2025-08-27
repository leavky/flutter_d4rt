import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/physics/physics.dart';

Map<String, String> getPhysicsSource(D4rt interpreter) {
  registerPhysicsBridges(interpreter);
  return {
    'package:flutter/physics.dart': '''
     export 'package:flutter/physics_.dart';
    ''',
  };
}
