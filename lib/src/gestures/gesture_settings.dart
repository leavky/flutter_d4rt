import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getDeviceGestureSettingsBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DeviceGestureSettings,
    name: 'DeviceGestureSettings',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return DeviceGestureSettings(
          touchSlop: namedArgs['touchSlop'] as double?,
        );
      },
    },
    getters: {
      'touchSlop': (visitor, target) =>
          (target as DeviceGestureSettings).touchSlop,
    },
  );
}
