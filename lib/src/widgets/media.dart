import 'dart:io';
import 'dart:typed_data';
import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Image and media widgets bridging definitions

// Helper functions for callback handling
Widget Function(BuildContext, Widget, int?, bool)? _handleFrameBuilder(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (
      BuildContext context,
      Widget child,
      int? frame,
      bool wasSynchronouslyLoaded,
    ) {
      final result = callback.call(visitor, [
        context,
        child,
        frame,
        wasSynchronouslyLoaded,
      ]);
      return visitor.toWidgets(result)!;
    };
  }
  return callback as Widget Function(BuildContext, Widget, int?, bool)?;
}

Widget Function(BuildContext, Widget, ImageChunkEvent?)? _handleLoadingBuilder(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (
      BuildContext context,
      Widget child,
      ImageChunkEvent? loadingProgress,
    ) {
      final result = callback.call(visitor, [context, child, loadingProgress]);
      return visitor.toWidgets(result)!;
    };
  }
  return callback as Widget Function(BuildContext, Widget, ImageChunkEvent?)?;
}

Widget Function(BuildContext, Object, StackTrace?)? _handleErrorBuilder(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (BuildContext context, Object error, StackTrace? stackTrace) {
      final result = callback.call(visitor, [context, error, stackTrace]);
      return visitor.toWidgets(result)!;
    };
  }
  return callback as Widget Function(BuildContext, Object, StackTrace?)?;
}

// Image bridging
BridgedClass getImageBridgingDefinition() {
  return BridgedClass(
    nativeType: Image,
    name: 'Image',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Image(
          key: namedArgs.get<Key?>('key'),
          image: namedArgs['image'] as ImageProvider,
          frameBuilder: _handleFrameBuilder(visitor, namedArgs['frameBuilder']),
          loadingBuilder: _handleLoadingBuilder(
            visitor,
            namedArgs['loadingBuilder'],
          ),
          errorBuilder: _handleErrorBuilder(visitor, namedArgs['errorBuilder']),
          semanticLabel: namedArgs['semanticLabel'] as String?,
          excludeFromSemantics:
              namedArgs['excludeFromSemantics'] as bool? ?? false,
          width: toDouble(namedArgs['width']),
          height: toDouble(namedArgs['height']),
          color: namedArgs['color'] as Color?,
          opacity: namedArgs['opacity'] as Animation<double>?,
          colorBlendMode: namedArgs['colorBlendMode'] as BlendMode?,
          fit: namedArgs['fit'] as BoxFit?,
          alignment:
              namedArgs['alignment'] as AlignmentGeometry? ?? Alignment.center,
          repeat: namedArgs['repeat'] as ImageRepeat? ?? ImageRepeat.noRepeat,
          centerSlice: namedArgs['centerSlice'] as Rect?,
          matchTextDirection: namedArgs['matchTextDirection'] as bool? ?? false,
          gaplessPlayback: namedArgs['gaplessPlayback'] as bool? ?? false,
          isAntiAlias: namedArgs['isAntiAlias'] as bool? ?? false,
          filterQuality:
              namedArgs['filterQuality'] as FilterQuality? ?? FilterQuality.low,
        );
      },
      'asset': (visitor, positionalArgs, namedArgs) {
        final name = positionalArgs.isNotEmpty
            ? positionalArgs[0] as String
            : namedArgs['name'] as String;
        return Image.asset(
          name,
          key: namedArgs.get<Key?>('key'),
          bundle: namedArgs['bundle'] as AssetBundle?,
          frameBuilder: _handleFrameBuilder(visitor, namedArgs['frameBuilder']),
          errorBuilder: _handleErrorBuilder(visitor, namedArgs['errorBuilder']),
          semanticLabel: namedArgs['semanticLabel'] as String?,
          excludeFromSemantics:
              namedArgs['excludeFromSemantics'] as bool? ?? false,
          scale: toDouble(namedArgs['scale']),
          width: toDouble(namedArgs['width']),
          height: toDouble(namedArgs['height']),
          color: namedArgs['color'] as Color?,
          opacity: namedArgs['opacity'] as Animation<double>?,
          colorBlendMode: namedArgs['colorBlendMode'] as BlendMode?,
          fit: namedArgs['fit'] as BoxFit?,
          alignment:
              namedArgs['alignment'] as AlignmentGeometry? ?? Alignment.center,
          repeat: namedArgs['repeat'] as ImageRepeat? ?? ImageRepeat.noRepeat,
          centerSlice: namedArgs['centerSlice'] as Rect?,
          matchTextDirection: namedArgs['matchTextDirection'] as bool? ?? false,
          gaplessPlayback: namedArgs['gaplessPlayback'] as bool? ?? false,
          isAntiAlias: namedArgs['isAntiAlias'] as bool? ?? false,
          filterQuality:
              namedArgs['filterQuality'] as FilterQuality? ?? FilterQuality.low,
          cacheWidth: namedArgs['cacheWidth'] as int?,
          cacheHeight: namedArgs['cacheHeight'] as int?,
        );
      },
      'network': (visitor, positionalArgs, namedArgs) {
        final src = positionalArgs.isNotEmpty
            ? positionalArgs[0] as String
            : namedArgs['src'] as String;
        return Image.network(
          src,
          key: namedArgs.get<Key?>('key'),
          scale: toDouble(namedArgs['scale']) ?? 1.0,
          frameBuilder: _handleFrameBuilder(visitor, namedArgs['frameBuilder']),
          loadingBuilder: _handleLoadingBuilder(
            visitor,
            namedArgs['loadingBuilder'],
          ),
          errorBuilder: _handleErrorBuilder(visitor, namedArgs['errorBuilder']),
          semanticLabel: namedArgs['semanticLabel'] as String?,
          excludeFromSemantics:
              namedArgs['excludeFromSemantics'] as bool? ?? false,
          width: toDouble(namedArgs['width']),
          height: toDouble(namedArgs['height']),
          color: namedArgs['color'] as Color?,
          opacity: namedArgs['opacity'] as Animation<double>?,
          colorBlendMode: namedArgs['colorBlendMode'] as BlendMode?,
          fit: namedArgs['fit'] as BoxFit?,
          alignment:
              namedArgs['alignment'] as AlignmentGeometry? ?? Alignment.center,
          repeat: namedArgs['repeat'] as ImageRepeat? ?? ImageRepeat.noRepeat,
          centerSlice: namedArgs['centerSlice'] as Rect?,
          matchTextDirection: namedArgs['matchTextDirection'] as bool? ?? false,
          gaplessPlayback: namedArgs['gaplessPlayback'] as bool? ?? false,
          filterQuality:
              namedArgs['filterQuality'] as FilterQuality? ?? FilterQuality.low,
          isAntiAlias: namedArgs['isAntiAlias'] as bool? ?? false,
          headers: (namedArgs['headers'] as Map?)?.cast(),
          cacheWidth: namedArgs['cacheWidth'] as int?,
          cacheHeight: namedArgs['cacheHeight'] as int?,
        );
      },
      'file': (visitor, positionalArgs, namedArgs) {
        final file = positionalArgs.isNotEmpty
            ? positionalArgs[0] as File
            : namedArgs['file'] as File;
        return Image.file(
          file,
          key: namedArgs.get<Key?>('key'),
          scale: toDouble(namedArgs['scale']) ?? 1.0,
          frameBuilder: _handleFrameBuilder(visitor, namedArgs['frameBuilder']),
          errorBuilder: _handleErrorBuilder(visitor, namedArgs['errorBuilder']),
          semanticLabel: namedArgs['semanticLabel'] as String?,
          excludeFromSemantics:
              namedArgs['excludeFromSemantics'] as bool? ?? false,
          width: toDouble(namedArgs['width']),
          height: toDouble(namedArgs['height']),
          color: namedArgs['color'] as Color?,
          opacity: namedArgs['opacity'] as Animation<double>?,
          colorBlendMode: namedArgs['colorBlendMode'] as BlendMode?,
          fit: namedArgs['fit'] as BoxFit?,
          alignment:
              namedArgs['alignment'] as AlignmentGeometry? ?? Alignment.center,
          repeat: namedArgs['repeat'] as ImageRepeat? ?? ImageRepeat.noRepeat,
          centerSlice: namedArgs['centerSlice'] as Rect?,
          matchTextDirection: namedArgs['matchTextDirection'] as bool? ?? false,
          gaplessPlayback: namedArgs['gaplessPlayback'] as bool? ?? false,
          isAntiAlias: namedArgs['isAntiAlias'] as bool? ?? false,
          filterQuality:
              namedArgs['filterQuality'] as FilterQuality? ?? FilterQuality.low,
          cacheWidth: namedArgs['cacheWidth'] as int?,
          cacheHeight: namedArgs['cacheHeight'] as int?,
        );
      },
      'memory': (visitor, positionalArgs, namedArgs) {
        final bytes = positionalArgs.isNotEmpty
            ? positionalArgs[0] as Uint8List
            : namedArgs['bytes'] as Uint8List;
        return Image.memory(
          bytes,
          key: namedArgs.get<Key?>('key'),
          scale: toDouble(namedArgs['scale']) ?? 1.0,
          frameBuilder: _handleFrameBuilder(visitor, namedArgs['frameBuilder']),
          errorBuilder: _handleErrorBuilder(visitor, namedArgs['errorBuilder']),
          semanticLabel: namedArgs['semanticLabel'] as String?,
          excludeFromSemantics:
              namedArgs['excludeFromSemantics'] as bool? ?? false,
          width: toDouble(namedArgs['width']),
          height: toDouble(namedArgs['height']),
          color: namedArgs['color'] as Color?,
          opacity: namedArgs['opacity'] as Animation<double>?,
          colorBlendMode: namedArgs['colorBlendMode'] as BlendMode?,
          fit: namedArgs['fit'] as BoxFit?,
          alignment:
              namedArgs['alignment'] as AlignmentGeometry? ?? Alignment.center,
          repeat: namedArgs['repeat'] as ImageRepeat? ?? ImageRepeat.noRepeat,
          centerSlice: namedArgs['centerSlice'] as Rect?,
          matchTextDirection: namedArgs['matchTextDirection'] as bool? ?? false,
          gaplessPlayback: namedArgs['gaplessPlayback'] as bool? ?? false,
          isAntiAlias: namedArgs['isAntiAlias'] as bool? ?? false,
          filterQuality:
              namedArgs['filterQuality'] as FilterQuality? ?? FilterQuality.low,
          cacheWidth: namedArgs['cacheWidth'] as int?,
          cacheHeight: namedArgs['cacheHeight'] as int?,
        );
      },
    },
  );
}

// Icon bridging (enhanced)
BridgedClass getIconBridgingDefinition() {
  return BridgedClass(
    nativeType: Icon,
    name: 'Icon',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final iconData = positionalArgs.isNotEmpty
            ? positionalArgs[0] as IconData?
            : namedArgs['icon'] as IconData?;
        return Icon(
          iconData,
          key: namedArgs.get<Key?>('key'),
          size: toDouble(namedArgs['size']),
          fill: toDouble(namedArgs['fill']),
          weight: toDouble(namedArgs['weight']),
          grade: toDouble(namedArgs['grade']),
          opticalSize: toDouble(namedArgs['opticalSize']),
          color: namedArgs['color'] as Color?,
          shadows: (namedArgs['shadows'] as List?)?.cast(),
          semanticLabel: namedArgs['semanticLabel'] as String?,
          textDirection: namedArgs['textDirection'] as TextDirection?,
        );
      },
    },
  );
}

// Placeholder bridging
BridgedClass getPlaceholderBridgingDefinition() {
  return BridgedClass(
    nativeType: Placeholder,
    name: 'Placeholder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Placeholder(
          key: namedArgs.get<Key?>('key'),
          color: namedArgs['color'] as Color? ?? const Color(0xFF455A64),
          strokeWidth: toDouble(namedArgs['strokeWidth']) ?? 2.0,
          fallbackWidth: toDouble(namedArgs['fallbackWidth']) ?? 400.0,
          fallbackHeight: toDouble(namedArgs['fallbackHeight']) ?? 400.0,
        );
      },
    },
  );
}
