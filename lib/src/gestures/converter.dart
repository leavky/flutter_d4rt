import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getPointerEventConverterBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: PointerEventConverter,
    name: 'PointerEventConverter',
    constructors: {},
    getters: {},
  );
}
