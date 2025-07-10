import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/gestures/gestures.dart';

Map<String, String> getGesturesSource(D4rt interpreter) {
  registerGesturesBridges(interpreter);
  return {
    'package:flutter/gestures.dart': '''
     export 'package:flutter/gestures_.dart';
    ''',
  };
}
