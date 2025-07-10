import 'package:d4rt/d4rt.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClassDefinition for the Flutter BoxDecoration class.
BridgedClassDefinition getBoxDecorationBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: BoxDecoration,
    name: 'BoxDecoration',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final color = namedArgs.get<Color?>('color');
        final image = namedArgs.get<DecorationImage?>('image');
        final border = namedArgs.get<BoxBorder?>('border');
        final borderRadius = namedArgs.get<BorderRadiusGeometry?>(
          'borderRadius',
        );
        final boxShadow = visitor.toElements(namedArgs['boxShadow']) as List?;
        final gradient = namedArgs.get<Gradient?>('gradient');
        final backgroundBlendMode = namedArgs.get<BlendMode?>(
          'backgroundBlendMode',
        );
        final shape = namedArgs.get<BoxShape?>('shape') ?? BoxShape.rectangle;

        return BoxDecoration(
          color: color,
          image: image,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow?.cast(),
          gradient: gradient,
          backgroundBlendMode: backgroundBlendMode,
          shape: shape,
        );
      },
    },
    getters: {
      'color': (visitor, target) => (target as BoxDecoration).color,
      'image': (visitor, target) => (target as BoxDecoration).image,
      'border': (visitor, target) => (target as BoxDecoration).border,
      'borderRadius': (visitor, target) =>
          (target as BoxDecoration).borderRadius,
      'boxShadow': (visitor, target) => (target as BoxDecoration).boxShadow,
      'gradient': (visitor, target) => (target as BoxDecoration).gradient,
      'backgroundBlendMode': (visitor, target) =>
          (target as BoxDecoration).backgroundBlendMode,
      'shape': (visitor, target) => (target as BoxDecoration).shape,
    },
  );
}
