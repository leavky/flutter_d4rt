import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter CircleAvatar widget.
BridgedClass getCircleAvatarBridgingDefinition() {
  return BridgedClass(
    nativeType: CircleAvatar,
    name: 'CircleAvatar',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final backgroundImage = namedArgs.get<ImageProvider?>(
          'backgroundImage',
        );
        final foregroundImage = namedArgs.get<ImageProvider?>(
          'foregroundImage',
        );
        final onBackgroundImageError = namedArgs.get<ImageErrorListener?>(
          'onBackgroundImageError',
        );
        final onForegroundImageError = namedArgs.get<ImageErrorListener?>(
          'onForegroundImageError',
        );
        final foregroundColor = namedArgs.get<Color?>('foregroundColor');
        final radius = toDouble(namedArgs.get<dynamic>('radius'));
        final minRadius = toDouble(namedArgs.get<dynamic>('minRadius'));
        final maxRadius = toDouble(namedArgs.get<dynamic>('maxRadius'));

        return CircleAvatar(
          key: key,
          child: child,
          backgroundColor: backgroundColor,
          backgroundImage: backgroundImage,
          foregroundImage: foregroundImage,
          onBackgroundImageError: onBackgroundImageError,
          onForegroundImageError: onForegroundImageError,
          foregroundColor: foregroundColor,
          radius: radius,
          minRadius: minRadius,
          maxRadius: maxRadius,
        );
      },
    },
    getters: {
      'child': (visitor, target) => (target as CircleAvatar).child,
      'backgroundColor': (visitor, target) =>
          (target as CircleAvatar).backgroundColor,
      'backgroundImage': (visitor, target) =>
          (target as CircleAvatar).backgroundImage,
      'foregroundImage': (visitor, target) =>
          (target as CircleAvatar).foregroundImage,
      'onBackgroundImageError': (visitor, target) =>
          (target as CircleAvatar).onBackgroundImageError,
      'onForegroundImageError': (visitor, target) =>
          (target as CircleAvatar).onForegroundImageError,
      'foregroundColor': (visitor, target) =>
          (target as CircleAvatar).foregroundColor,
      'radius': (visitor, target) => (target as CircleAvatar).radius,
      'minRadius': (visitor, target) => (target as CircleAvatar).minRadius,
      'maxRadius': (visitor, target) => (target as CircleAvatar).maxRadius,
      'key': (visitor, target) => (target as CircleAvatar).key,
    },
  );
}
