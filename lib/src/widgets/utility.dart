import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Utility and layout helper widgets bridging definitions

// SafeArea bridging
BridgedClass getSafeAreaBridgingDefinition() {
  return BridgedClass(
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
BridgedClass getAspectRatioBridgingDefinition() {
  return BridgedClass(
    nativeType: AspectRatio,
    name: 'AspectRatio',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return AspectRatio(
          key: namedArgs.get<Key?>('key'),
          aspectRatio: toDouble(namedArgs['aspectRatio']),
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// FittedBox bridging
BridgedClass getFittedBoxBridgingDefinition() {
  return BridgedClass(
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
BridgedClass getSizedBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: SizedBox,
    name: 'SizedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return SizedBox(
          key: namedArgs.get<Key?>('key'),
          width: toDouble(namedArgs['width']),
          height: toDouble(namedArgs['height']),
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
          dimension: toDouble(namedArgs['dimension']),
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
BridgedClass getConstrainedBoxBridgingDefinition() {
  return BridgedClass(
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
BridgedClass getLimitedBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: LimitedBox,
    name: 'LimitedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return LimitedBox(
          key: namedArgs.get<Key?>('key'),
          maxWidth: toDouble(namedArgs['maxWidth']) ?? double.infinity,
          maxHeight: toDouble(namedArgs['maxHeight']) ?? double.infinity,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// OverflowBox bridging
BridgedClass getOverflowBoxBridgingDefinition() {
  return BridgedClass(
    nativeType: OverflowBox,
    name: 'OverflowBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return OverflowBox(
          key: namedArgs.get<Key?>('key'),
          alignment:
              namedArgs['alignment'] as AlignmentGeometry? ?? Alignment.center,
          minWidth: toDouble(namedArgs['minWidth']),
          maxWidth: toDouble(namedArgs['maxWidth']),
          minHeight: toDouble(namedArgs['minHeight']),
          maxHeight: toDouble(namedArgs['maxHeight']),
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// IntrinsicHeight bridging
BridgedClass getIntrinsicHeightBridgingDefinition() {
  return BridgedClass(
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
BridgedClass getIntrinsicWidthBridgingDefinition() {
  return BridgedClass(
    nativeType: IntrinsicWidth,
    name: 'IntrinsicWidth',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return IntrinsicWidth(
          key: namedArgs.get<Key?>('key'),
          stepWidth: toDouble(namedArgs['stepWidth']),
          stepHeight: toDouble(namedArgs['stepHeight']),
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// Baseline bridging
BridgedClass getBaselineBridgingDefinition() {
  return BridgedClass(
    nativeType: Baseline,
    name: 'Baseline',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Baseline(
          key: namedArgs.get<Key?>('key'),
          baseline: toDouble(namedArgs['baseline']),
          baselineType: namedArgs['baselineType'] as TextBaseline,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}
