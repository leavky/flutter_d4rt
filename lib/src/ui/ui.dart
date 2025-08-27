import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/ui/geometry.dart';
import 'package:flutter_d4rt/src/ui/painting.dart';
import 'package:flutter_d4rt/src/ui/text.dart';
import 'package:flutter_d4rt/src/ui/window.dart';

void registerUiBridges(D4rt interpreter) {
  // Register all geometry bridges
  getGeometryBridgingDefinitions().forEach((name, bridgedClass) {
    interpreter.registerBridgedClass(bridgedClass, 'package:dart:ui_');
  });

  // Register all painting bridges
  getPaintingBridgingDefinitions().forEach((name, definition) {
    if (definition is BridgedClass) {
      interpreter.registerBridgedClass(definition, 'package:dart:ui_');
    } else if (definition is BridgedEnumDefinition) {
      interpreter.registerBridgedEnum(definition, 'package:dart:ui_');
    }
  });

  // Register text bridges
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
