import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/ui/ui.dart';

Map<String, String> getUiSource(D4rt interpreter) {
  registerUiBridges(interpreter);
  return {
    'dart:ui': '''
     export 'package:dart:ui_';
    ''',
  };
}
