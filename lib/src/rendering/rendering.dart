import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/rendering/flex.dart';
import 'package:flutter_d4rt/src/rendering/painting.dart';
import 'package:flutter_d4rt/src/rendering/proxy_box.dart';
import 'package:flutter_d4rt/src/rendering/stack.dart';
import 'package:flutter_d4rt/src/rendering/wrap.dart';

void registerRenderingBridges(D4rt interpreter) {
  interpreter.registerBridgedEnum(
    getMainAxisAlignmentBridgingDefinition(),
    'package:flutter/rendering_.dart',
  );
  interpreter.registerBridgedEnum(
    getCrossAxisAlignmentBridgingDefinition(),
    'package:flutter/rendering_.dart',
  );
  interpreter.registerBridgedEnum(
    getMainAxisSizeBridgingDefinition(),
    'package:flutter/rendering_.dart',
  );
  interpreter.registerBridgedEnum(
    getFlexFitBridgingDefinition(),
    'package:flutter/rendering_.dart',
  );
  interpreter.registerBridgedEnum(
    getBlendModeBridgingDefinition(),
    'package:flutter/rendering_.dart',
  );
  interpreter.registerBridgedEnum(
    getDecorationPositionBridgingDefinition(),
    'package:flutter/rendering_.dart',
  );
  interpreter.registerBridgedEnum(
    getStackFitBridgingDefinition(),
    'package:flutter/rendering_.dart',
  );
  interpreter.registerBridgedEnum(
    getWrapAlignmentBridgingDefinition(),
    'package:flutter/rendering_.dart',
  );
  interpreter.registerBridgedEnum(
    getWrapCrossAlignmentBridgingDefinition(),
    'package:flutter/rendering_.dart',
  );
}
