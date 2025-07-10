import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/painting/painting.dart';

Map<String, String> getPaintingSource(D4rt interpreter) {
  registerPaintingBridges(interpreter);
  return {
    'package:flutter/painting.dart': '''
     export 'package:flutter/painting_.dart';
    ''',
  };
}
