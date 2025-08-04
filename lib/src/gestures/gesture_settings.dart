import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/double.dart';

BridgedClass getDeviceGestureSettingsBridgingDefinition() {
  return BridgedClass(
    nativeType: DeviceGestureSettings,
    name: 'DeviceGestureSettings',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return DeviceGestureSettings(
          touchSlop: toDouble(namedArgs['touchSlop']),
        );
      },
    },
    getters: {
      'touchSlop': (visitor, target) =>
          (target as DeviceGestureSettings).touchSlop,
    },
  );
}
