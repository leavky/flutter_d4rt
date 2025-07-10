import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Utility and layout helper widgets bridging definitions

// SafeArea bridging
BridgedClassDefinition getSafeAreaBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: SafeArea,
    name: 'SafeArea',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return SafeArea(
          key: namedArgs.get<Key?>('key'),
          left: namedArgs['left'] as bool? ?? true,
          top: namedArgs['top'] as bool? ?? true,
          right: namedArgs['right'] as bool? ?? true,
          bottom: namedArgs['bottom'] as bool? ?? true,
          minimum: namedArgs['minimum'] as EdgeInsets? ?? EdgeInsets.zero,
          maintainBottomViewPadding:
              namedArgs['maintainBottomViewPadding'] as bool? ?? false,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// AspectRatio bridging
BridgedClassDefinition getAspectRatioBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: AspectRatio,
    name: 'AspectRatio',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return AspectRatio(
          key: namedArgs.get<Key?>('key'),
          aspectRatio: namedArgs['aspectRatio'] as double,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// FittedBox bridging
BridgedClassDefinition getFittedBoxBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: FittedBox,
    name: 'FittedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return FittedBox(
          key: namedArgs.get<Key?>('key'),
          fit: namedArgs['fit'] as BoxFit? ?? BoxFit.contain,
          alignment:
              namedArgs['alignment'] as AlignmentGeometry? ?? Alignment.center,
          clipBehavior: namedArgs['clipBehavior'] as Clip? ?? Clip.none,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// SizedBox bridging
BridgedClassDefinition getSizedBoxBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: SizedBox,
    name: 'SizedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return SizedBox(
          key: namedArgs.get<Key?>('key'),
          width: namedArgs['width'] as double?,
          height: namedArgs['height'] as double?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
      'expand': (visitor, positionalArgs, namedArgs) {
        return SizedBox.expand(
          key: namedArgs.get<Key?>('key'),
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
      'shrink': (visitor, positionalArgs, namedArgs) {
        return SizedBox.shrink(
          key: namedArgs.get<Key?>('key'),
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
      'square': (visitor, positionalArgs, namedArgs) {
        return SizedBox.square(
          key: namedArgs.get<Key?>('key'),
          dimension: namedArgs['dimension'] as double?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
      'fromSize': (visitor, positionalArgs, namedArgs) {
        return SizedBox.fromSize(
          key: namedArgs.get<Key?>('key'),
          size: namedArgs['size'] as Size?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// ConstrainedBox bridging
BridgedClassDefinition getConstrainedBoxBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ConstrainedBox,
    name: 'ConstrainedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ConstrainedBox(
          key: namedArgs.get<Key?>('key'),
          constraints: namedArgs['constraints'] as BoxConstraints,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// LimitedBox bridging
BridgedClassDefinition getLimitedBoxBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: LimitedBox,
    name: 'LimitedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return LimitedBox(
          key: namedArgs.get<Key?>('key'),
          maxWidth: namedArgs['maxWidth'] as double? ?? double.infinity,
          maxHeight: namedArgs['maxHeight'] as double? ?? double.infinity,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// OverflowBox bridging
BridgedClassDefinition getOverflowBoxBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: OverflowBox,
    name: 'OverflowBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return OverflowBox(
          key: namedArgs.get<Key?>('key'),
          alignment:
              namedArgs['alignment'] as AlignmentGeometry? ?? Alignment.center,
          minWidth: namedArgs['minWidth'] as double?,
          maxWidth: namedArgs['maxWidth'] as double?,
          minHeight: namedArgs['minHeight'] as double?,
          maxHeight: namedArgs['maxHeight'] as double?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// IntrinsicHeight bridging
BridgedClassDefinition getIntrinsicHeightBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: IntrinsicHeight,
    name: 'IntrinsicHeight',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return IntrinsicHeight(
          key: namedArgs.get<Key?>('key'),
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// IntrinsicWidth bridging
BridgedClassDefinition getIntrinsicWidthBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: IntrinsicWidth,
    name: 'IntrinsicWidth',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return IntrinsicWidth(
          key: namedArgs.get<Key?>('key'),
          stepWidth: namedArgs['stepWidth'] as double?,
          stepHeight: namedArgs['stepHeight'] as double?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// Baseline bridging
BridgedClassDefinition getBaselineBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Baseline,
    name: 'Baseline',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Baseline(
          key: namedArgs.get<Key?>('key'),
          baseline: namedArgs['baseline'] as double,
          baselineType: namedArgs['baselineType'] as TextBaseline,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}
