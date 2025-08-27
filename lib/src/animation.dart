import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/animation/register_animation.dart';

Map<String, String> getAnimationSource(D4rt interpreter) {
  registerAnimationBridges(interpreter);
  return {
    'package:flutter/animation.dart': '''
     export 'package:flutter/animation_.dart';
     export 'package:flutter/physics.dart';
    ''',
  };
}
