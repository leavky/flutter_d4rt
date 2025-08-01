import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Transform and clipping widgets bridging definitions

// Transform bridging
BridgedClassDefinition getTransformBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Transform,
    name: 'Transform',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Transform(
          key: namedArgs.get<Key?>('key'),
          transform: namedArgs['transform'] as Matrix4,
          origin: namedArgs['origin'] as Offset?,
          alignment: namedArgs['alignment'] as AlignmentGeometry?,
          transformHitTests: namedArgs['transformHitTests'] as bool? ?? true,
          filterQuality: namedArgs['filterQuality'] as FilterQuality?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
      'rotate': (visitor, positionalArgs, namedArgs) {
        return Transform.rotate(
          key: namedArgs.get<Key?>('key'),
          angle: toDouble(namedArgs['angle']),
          origin: namedArgs['origin'] as Offset?,
          alignment:
              namedArgs['alignment'] as AlignmentGeometry? ?? Alignment.center,
          transformHitTests: namedArgs['transformHitTests'] as bool? ?? true,
          filterQuality: namedArgs['filterQuality'] as FilterQuality?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
      'translate': (visitor, positionalArgs, namedArgs) {
        return Transform.translate(
          key: namedArgs.get<Key?>('key'),
          offset: namedArgs['offset'] as Offset,
          transformHitTests: namedArgs['transformHitTests'] as bool? ?? true,
          filterQuality: namedArgs['filterQuality'] as FilterQuality?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
      'scale': (visitor, positionalArgs, namedArgs) {
        return Transform.scale(
          key: namedArgs.get<Key?>('key'),
          scale: toDouble(namedArgs['scale']),
          scaleX: toDouble(namedArgs['scaleX']),
          scaleY: toDouble(namedArgs['scaleY']),
          origin: namedArgs['origin'] as Offset?,
          alignment:
              namedArgs['alignment'] as AlignmentGeometry? ?? Alignment.center,
          transformHitTests: namedArgs['transformHitTests'] as bool? ?? true,
          filterQuality: namedArgs['filterQuality'] as FilterQuality?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// Opacity bridging
BridgedClassDefinition getOpacityBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Opacity,
    name: 'Opacity',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Opacity(
          key: namedArgs.get<Key?>('key'),
          opacity: toDouble(namedArgs['opacity']),
          alwaysIncludeSemantics:
              namedArgs['alwaysIncludeSemantics'] as bool? ?? false,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// ClipRRect bridging
BridgedClassDefinition getClipRRectBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ClipRRect,
    name: 'ClipRRect',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ClipRRect(
          key: namedArgs.get<Key?>('key'),
          borderRadius:
              namedArgs['borderRadius'] as BorderRadius? ?? BorderRadius.zero,
          clipper: namedArgs['clipper'] as CustomClipper<RRect>?,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.antiAlias,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// ClipRect bridging
BridgedClassDefinition getClipRectBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ClipRect,
    name: 'ClipRect',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ClipRect(
          key: namedArgs.get<Key?>('key'),
          clipper: namedArgs['clipper'] as CustomClipper<Rect>?,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.hardEdge,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// ClipOval bridging
BridgedClassDefinition getClipOvalBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ClipOval,
    name: 'ClipOval',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ClipOval(
          key: namedArgs.get<Key?>('key'),
          clipper: namedArgs['clipper'] as CustomClipper<Rect>?,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.antiAlias,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// ClipPath bridging
BridgedClassDefinition getClipPathBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ClipPath,
    name: 'ClipPath',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ClipPath(
          key: namedArgs.get<Key?>('key'),
          clipper: namedArgs['clipper'] as CustomClipper<Path>?,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.antiAlias,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}
