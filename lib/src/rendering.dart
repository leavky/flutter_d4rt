import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/rendering/rendering.dart';

Map<String, String> getRenderingSource(D4rt interpreter) {
  registerRenderingBridges(interpreter);
  return {
    'package:flutter/rendering.dart': '''
     export 'package:flutter/rendering_.dart';
    ''',
  };
}
