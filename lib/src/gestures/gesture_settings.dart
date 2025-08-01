import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/double.dart';

BridgedClassDefinition getDeviceGestureSettingsBridgingDefinition() {
  return BridgedClassDefinition(
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
