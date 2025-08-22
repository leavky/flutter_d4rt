import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

/// Returns the BridgedClass for the Flutter Image widget.
BridgedClass getImageBridgingDefinition() {
  return BridgedClass(
    nativeType: Image,
    name: 'Image',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final image = namedArgs.get<ImageProvider>('image');
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final fit = namedArgs.get<BoxFit?>('fit');
        final alignment =
            namedArgs.get<Alignment?>('alignment') ?? Alignment.center;
        final repeat =
            namedArgs.get<ImageRepeat?>('repeat') ?? ImageRepeat.noRepeat;
        final color = namedArgs.get<Color?>('color');
        final colorBlendMode = namedArgs.get<BlendMode?>('colorBlendMode');
        final semanticLabel = namedArgs.get<String?>('semanticLabel');
        final excludeFromSemantics =
            namedArgs.get<bool?>('excludeFromSemantics') ?? false;

        if (image == null) {
          return const SizedBox.shrink();
        }

        return Image(
          key: key,
          image: image,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          repeat: repeat,
          color: color,
          colorBlendMode: colorBlendMode,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
        );
      },
      'asset': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final name = positionalArgs.isNotEmpty
            ? positionalArgs[0] as String
            : namedArgs.get<String?>('name') ?? '';
        final bundle = namedArgs.get<AssetBundle?>('bundle');
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final fit = namedArgs.get<BoxFit?>('fit');
        final alignment =
            namedArgs.get<Alignment?>('alignment') ?? Alignment.center;
        final repeat =
            namedArgs.get<ImageRepeat?>('repeat') ?? ImageRepeat.noRepeat;
        final color = namedArgs.get<Color?>('color');
        final colorBlendMode = namedArgs.get<BlendMode?>('colorBlendMode');
        final semanticLabel = namedArgs.get<String?>('semanticLabel');
        final excludeFromSemantics =
            namedArgs.get<bool?>('excludeFromSemantics') ?? false;
        final scale = namedArgs.getToDouble('scale');
        final package = namedArgs.get<String?>('package');

        return Image.asset(
          name,
          key: key,
          bundle: bundle,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          repeat: repeat,
          color: color,
          colorBlendMode: colorBlendMode,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          scale: scale,
          package: package,
        );
      },
      'network': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final src = positionalArgs.isNotEmpty
            ? positionalArgs[0] as String
            : namedArgs.get<String?>('src') ?? '';
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final fit = namedArgs.get<BoxFit?>('fit');
        final alignment =
            namedArgs.get<Alignment?>('alignment') ?? Alignment.center;
        final repeat =
            namedArgs.get<ImageRepeat?>('repeat') ?? ImageRepeat.noRepeat;
        final color = namedArgs.get<Color?>('color');
        final colorBlendMode = namedArgs.get<BlendMode?>('colorBlendMode');
        final semanticLabel = namedArgs.get<String?>('semanticLabel');
        final excludeFromSemantics =
            namedArgs.get<bool?>('excludeFromSemantics') ?? false;
        final scale = namedArgs.getToDouble('scale') ?? 1.0;
        final headers = namedArgs.get<Map<String, String>?>('headers');

        return Image.network(
          src,
          key: key,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          repeat: repeat,
          color: color,
          colorBlendMode: colorBlendMode,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          scale: scale,
          headers: headers,
        );
      },
      'file': (visitor, positionalArgs, namedArgs) {
        // Note: L'implémentation complète d'Image.file nécessite des types spécifiques
        // Pour le moment, nous retournons un placeholder
        return const SizedBox.shrink();
      },
    },
    getters: {
      'image': (visitor, target) => (target as Image).image,
      'width': (visitor, target) => (target as Image).width,
      'height': (visitor, target) => (target as Image).height,
      'fit': (visitor, target) => (target as Image).fit,
      'alignment': (visitor, target) => (target as Image).alignment,
      'repeat': (visitor, target) => (target as Image).repeat,
      'color': (visitor, target) => (target as Image).color,
      'colorBlendMode': (visitor, target) => (target as Image).colorBlendMode,
      'key': (visitor, target) => (target as Image).key,
    },
  );
}
