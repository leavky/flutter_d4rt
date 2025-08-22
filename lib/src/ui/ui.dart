import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/ui/geometry.dart';
import 'package:flutter_d4rt/src/ui/painting.dart';
import 'package:flutter_d4rt/src/ui/text.dart';
import 'package:flutter_d4rt/src/ui/window.dart';

void registerUiBridges(D4rt interpreter) {
  interpreter.registerBridgedClass(
    getRadiusBridgingDefinition(),
    'package:dart:ui_',
  );
  interpreter.registerBridgedClass(
    getColorBridgingDefinition(),
    'package:dart:ui_',
  );
  interpreter.registerBridgedEnum(
    getClipBridgingDefinition(),
    'package:dart:ui_',
  );
  interpreter.registerBridgedEnum(
    getColorSpaceBridgingDefinition(),
    'package:dart:ui_',
  );
  interpreter.registerBridgedClass(
    getFontWeightBridgingDefinition(),
    'package:dart:ui_',
  );
  interpreter.registerBridgedEnum(
    getTextAlignBridgingDefinition(),
    'package:dart:ui_',
  );
  interpreter.registerBridgedEnum(
    getFontStyleBridgingDefinition(),
    'package:dart:ui_',
  );
  interpreter.registerBridgedEnum(
    getTextTextBaselineBridgingDefinition(),
    'package:dart:ui_',
  );
  interpreter.registerBridgedEnum(
    getTextDirectionBridgingDefinition(),
    'package:dart:ui_',
  );
  interpreter.registerBridgedEnum(
    getBrightnessBridgingDefinition(),
    'package:dart:ui_',
  );
}
