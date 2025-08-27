import 'dart:ui';
import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/utils/double.dart';

/// Returns the BridgedClass for the Flutter OffsetBase class.
BridgedClass getOffsetBaseBridgingDefinition() {
  return BridgedClass(
    nativeType: OffsetBase,
    name: 'OffsetBase',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final dx = toDouble(positionalArgs.get<dynamic>(0))!;
        final dy = toDouble(positionalArgs.get<dynamic>(1))!;
        return Offset(
          dx,
          dy,
        ); // Return concrete Offset instead of abstract OffsetBase
      },
    },
    getters: {
      'isInfinite': (visitor, target) => (target as OffsetBase).isInfinite,
      'isFinite': (visitor, target) => (target as OffsetBase).isFinite,
    },
    methods: {
      '<': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<OffsetBase>(0);
        return other != null ? (target as OffsetBase) < other : false;
      },
      '<=': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<OffsetBase>(0);
        return other != null ? (target as OffsetBase) <= other : false;
      },
      '>': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<OffsetBase>(0);
        return other != null ? (target as OffsetBase) > other : false;
      },
      '>=': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<OffsetBase>(0);
        return other != null ? (target as OffsetBase) >= other : false;
      },
      '==': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Object>(0);
        return (target as OffsetBase) == other;
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter Offset class.
BridgedClass getOffsetBridgingDefinition() {
  return BridgedClass(
    nativeType: Offset,
    name: 'Offset',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final dx = toDouble(positionalArgs.get<dynamic>(0))!;
        final dy = toDouble(positionalArgs.get<dynamic>(1))!;
        return Offset(dx, dy);
      },
      'fromDirection': (visitor, positionalArgs, namedArgs) {
        final direction = toDouble(positionalArgs.get<dynamic>(0))!;
        final distance = toDouble(positionalArgs.get<dynamic>(1)) ?? 1.0;
        return Offset.fromDirection(direction, distance);
      },
      'zero': (visitor, positionalArgs, namedArgs) => Offset.zero,
      'infinite': (visitor, positionalArgs, namedArgs) => Offset.infinite,
    },
    getters: {
      'dx': (visitor, target) => (target as Offset).dx,
      'dy': (visitor, target) => (target as Offset).dy,
      'distance': (visitor, target) => (target as Offset).distance,
      'distanceSquared': (visitor, target) =>
          (target as Offset).distanceSquared,
      'direction': (visitor, target) => (target as Offset).direction,
      'isInfinite': (visitor, target) => (target as Offset).isInfinite,
      'isFinite': (visitor, target) => (target as Offset).isFinite,
    },
    methods: {
      'scale': (visitor, target, positionalArgs, namedArgs) {
        final scaleX = toDouble(positionalArgs.get<dynamic>(0))!;
        final scaleY = toDouble(positionalArgs.get<dynamic>(1))!;
        return (target as Offset).scale(scaleX, scaleY);
      },
      'translate': (visitor, target, positionalArgs, namedArgs) {
        final translateX = toDouble(positionalArgs.get<dynamic>(0))!;
        final translateY = toDouble(positionalArgs.get<dynamic>(1))!;
        return (target as Offset).translate(translateX, translateY);
      },
      'unary-': (visitor, target, positionalArgs, namedArgs) {
        return -(target as Offset);
      },
      '-': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Offset>(0);
        return other != null ? (target as Offset) - other : target;
      },
      '+': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Offset>(0);
        return other != null ? (target as Offset) + other : target;
      },
      '*': (visitor, target, positionalArgs, namedArgs) {
        final operand = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Offset) * operand;
      },
      '/': (visitor, target, positionalArgs, namedArgs) {
        final operand = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Offset) / operand;
      },
      '~/': (visitor, target, positionalArgs, namedArgs) {
        final operand = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Offset) ~/ operand;
      },
      '%': (visitor, target, positionalArgs, namedArgs) {
        final operand = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Offset) % operand;
      },
      '&': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Size>(0);
        return other != null ? (target as Offset) & other : Rect.zero;
      },
    },
    staticMethods: {
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<Offset?>(0);
        final b = positionalArgs.get<Offset?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2))!;
        return Offset.lerp(a, b, t);
      },
    },
    staticGetters: {
      'zero': (visitor) => Offset.zero,
      'infinite': (visitor) => Offset.infinite,
    },
  );
}

/// Returns the BridgedClass for the Flutter Size class.
BridgedClass getSizeBridgingDefinition() {
  return BridgedClass(
    nativeType: Size,
    name: 'Size',
    nativeNames: ['_DebugSize'],
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final width = toDouble(positionalArgs.get<dynamic>(0))!;
        final height = toDouble(positionalArgs.get<dynamic>(1))!;
        return Size(width, height);
      },
      'copy': (visitor, positionalArgs, namedArgs) {
        final source = positionalArgs.get<Size>(0)!;
        return Size.copy(source);
      },
      'square': (visitor, positionalArgs, namedArgs) {
        final dimension = toDouble(positionalArgs.get<dynamic>(0))!;
        return Size.square(dimension);
      },
      'fromWidth': (visitor, positionalArgs, namedArgs) {
        final width = toDouble(positionalArgs.get<dynamic>(0))!;
        return Size.fromWidth(width);
      },
      'fromHeight': (visitor, positionalArgs, namedArgs) {
        final height = toDouble(positionalArgs.get<dynamic>(0))!;
        return Size.fromHeight(height);
      },
      'fromRadius': (visitor, positionalArgs, namedArgs) {
        final radius = toDouble(positionalArgs.get<dynamic>(0))!;
        return Size.fromRadius(radius);
      },
      'zero': (visitor, positionalArgs, namedArgs) => Size.zero,
      'infinite': (visitor, positionalArgs, namedArgs) => Size.infinite,
    },
    getters: {
      'width': (visitor, target) => (target as Size).width,
      'height': (visitor, target) => (target as Size).height,
      'aspectRatio': (visitor, target) => (target as Size).aspectRatio,
      'isEmpty': (visitor, target) => (target as Size).isEmpty,
      'shortestSide': (visitor, target) => (target as Size).shortestSide,
      'longestSide': (visitor, target) => (target as Size).longestSide,
      'flipped': (visitor, target) => (target as Size).flipped,
      'isInfinite': (visitor, target) => (target as Size).isInfinite,
      'isFinite': (visitor, target) => (target as Size).isFinite,
    },
    methods: {
      '-': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<OffsetBase>(0);
        return other != null ? (target as Size) - other : target;
      },
      '+': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Offset>(0);
        return other != null ? (target as Size) + other : target;
      },
      '*': (visitor, target, positionalArgs, namedArgs) {
        final operand = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Size) * operand;
      },
      '/': (visitor, target, positionalArgs, namedArgs) {
        final operand = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Size) / operand;
      },
      '~/': (visitor, target, positionalArgs, namedArgs) {
        final operand = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Size) ~/ operand;
      },
      '%': (visitor, target, positionalArgs, namedArgs) {
        final operand = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Size) % operand;
      },
      'topLeft': (visitor, target, positionalArgs, namedArgs) {
        final origin = positionalArgs.get<Offset>(0)!;
        return (target as Size).topLeft(origin);
      },
      'topCenter': (visitor, target, positionalArgs, namedArgs) {
        final origin = positionalArgs.get<Offset>(0)!;
        return (target as Size).topCenter(origin);
      },
      'topRight': (visitor, target, positionalArgs, namedArgs) {
        final origin = positionalArgs.get<Offset>(0)!;
        return (target as Size).topRight(origin);
      },
      'centerLeft': (visitor, target, positionalArgs, namedArgs) {
        final origin = positionalArgs.get<Offset>(0)!;
        return (target as Size).centerLeft(origin);
      },
      'center': (visitor, target, positionalArgs, namedArgs) {
        final origin = positionalArgs.get<Offset>(0)!;
        return (target as Size).center(origin);
      },
      'centerRight': (visitor, target, positionalArgs, namedArgs) {
        final origin = positionalArgs.get<Offset>(0)!;
        return (target as Size).centerRight(origin);
      },
      'bottomLeft': (visitor, target, positionalArgs, namedArgs) {
        final origin = positionalArgs.get<Offset>(0)!;
        return (target as Size).bottomLeft(origin);
      },
      'bottomCenter': (visitor, target, positionalArgs, namedArgs) {
        final origin = positionalArgs.get<Offset>(0)!;
        return (target as Size).bottomCenter(origin);
      },
      'bottomRight': (visitor, target, positionalArgs, namedArgs) {
        final origin = positionalArgs.get<Offset>(0)!;
        return (target as Size).bottomRight(origin);
      },
      'contains': (visitor, target, positionalArgs, namedArgs) {
        final offset = positionalArgs.get<Offset>(0)!;
        return (target as Size).contains(offset);
      },
    },
    staticMethods: {
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<Size?>(0);
        final b = positionalArgs.get<Size?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2))!;
        return Size.lerp(a, b, t);
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter Rect class.
BridgedClass getRectBridgingDefinition() {
  return BridgedClass(
    nativeType: Rect,
    name: 'Rect',
    constructors: {
      'fromLTRB': (visitor, positionalArgs, namedArgs) {
        final left = toDouble(positionalArgs.get<dynamic>(0))!;
        final top = toDouble(positionalArgs.get<dynamic>(1))!;
        final right = toDouble(positionalArgs.get<dynamic>(2))!;
        final bottom = toDouble(positionalArgs.get<dynamic>(3))!;
        return Rect.fromLTRB(left, top, right, bottom);
      },
      'fromLTWH': (visitor, positionalArgs, namedArgs) {
        final left = toDouble(positionalArgs.get<dynamic>(0))!;
        final top = toDouble(positionalArgs.get<dynamic>(1))!;
        final width = toDouble(positionalArgs.get<dynamic>(2))!;
        final height = toDouble(positionalArgs.get<dynamic>(3))!;
        return Rect.fromLTWH(left, top, width, height);
      },
      'fromCircle': (visitor, positionalArgs, namedArgs) {
        final center = namedArgs.get<Offset>('center')!;
        final radius = toDouble(namedArgs.get<dynamic>('radius'))!;
        return Rect.fromCircle(center: center, radius: radius);
      },
      'fromCenter': (visitor, positionalArgs, namedArgs) {
        final center = namedArgs.get<Offset>('center')!;
        final width = toDouble(namedArgs.get<dynamic>('width'))!;
        final height = toDouble(namedArgs.get<dynamic>('height'))!;
        return Rect.fromCenter(center: center, width: width, height: height);
      },
      'fromPoints': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<Offset>(0)!;
        final b = positionalArgs.get<Offset>(1)!;
        return Rect.fromPoints(a, b);
      },
      'zero': (visitor, positionalArgs, namedArgs) => Rect.zero,
      'largest': (visitor, positionalArgs, namedArgs) => Rect.largest,
    },
    getters: {
      'left': (visitor, target) => (target as Rect).left,
      'top': (visitor, target) => (target as Rect).top,
      'right': (visitor, target) => (target as Rect).right,
      'bottom': (visitor, target) => (target as Rect).bottom,
      'width': (visitor, target) => (target as Rect).width,
      'height': (visitor, target) => (target as Rect).height,
      'size': (visitor, target) => (target as Rect).size,
      'hasNaN': (visitor, target) => (target as Rect).hasNaN,
      'isInfinite': (visitor, target) => (target as Rect).isInfinite,
      'isFinite': (visitor, target) => (target as Rect).isFinite,
      'isEmpty': (visitor, target) => (target as Rect).isEmpty,
      'shortestSide': (visitor, target) => (target as Rect).shortestSide,
      'longestSide': (visitor, target) => (target as Rect).longestSide,
      'topLeft': (visitor, target) => (target as Rect).topLeft,
      'topCenter': (visitor, target) => (target as Rect).topCenter,
      'topRight': (visitor, target) => (target as Rect).topRight,
      'centerLeft': (visitor, target) => (target as Rect).centerLeft,
      'center': (visitor, target) => (target as Rect).center,
      'centerRight': (visitor, target) => (target as Rect).centerRight,
      'bottomLeft': (visitor, target) => (target as Rect).bottomLeft,
      'bottomCenter': (visitor, target) => (target as Rect).bottomCenter,
      'bottomRight': (visitor, target) => (target as Rect).bottomRight,
    },
    methods: {
      'shift': (visitor, target, positionalArgs, namedArgs) {
        final offset = positionalArgs.get<Offset>(0)!;
        return (target as Rect).shift(offset);
      },
      'translate': (visitor, target, positionalArgs, namedArgs) {
        final translateX = toDouble(positionalArgs.get<dynamic>(0))!;
        final translateY = toDouble(positionalArgs.get<dynamic>(1))!;
        return (target as Rect).translate(translateX, translateY);
      },
      'inflate': (visitor, target, positionalArgs, namedArgs) {
        final delta = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Rect).inflate(delta);
      },
      'deflate': (visitor, target, positionalArgs, namedArgs) {
        final delta = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Rect).deflate(delta);
      },
      'intersect': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Rect>(0)!;
        return (target as Rect).intersect(other);
      },
      'expandToInclude': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Rect>(0)!;
        return (target as Rect).expandToInclude(other);
      },
      'overlaps': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Rect>(0)!;
        return (target as Rect).overlaps(other);
      },
      'contains': (visitor, target, positionalArgs, namedArgs) {
        final offset = positionalArgs.get<Offset>(0)!;
        return (target as Rect).contains(offset);
      },
    },
    staticMethods: {
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<Rect?>(0);
        final b = positionalArgs.get<Rect?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2))!;
        return Rect.lerp(a, b, t);
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter Radius class.
BridgedClass getRadiusBridgingDefinition() {
  return BridgedClass(
    nativeType: Radius,
    name: 'Radius',
    constructors: {
      'circular': (visitor, positionalArgs, namedArgs) {
        final radius = toDouble(positionalArgs.get<dynamic>(0))!;
        return Radius.circular(radius);
      },
      'elliptical': (visitor, positionalArgs, namedArgs) {
        final x = toDouble(positionalArgs.get<dynamic>(0))!;
        final y = toDouble(positionalArgs.get<dynamic>(1))!;
        return Radius.elliptical(x, y);
      },
      'zero': (visitor, positionalArgs, namedArgs) => Radius.zero,
    },
    getters: {
      'x': (visitor, target) => (target as Radius).x,
      'y': (visitor, target) => (target as Radius).y,
    },
    methods: {
      'clamp': (visitor, target, positionalArgs, namedArgs) {
        final minimum = namedArgs.get<Radius?>('minimum');
        final maximum = namedArgs.get<Radius?>('maximum');
        return (target as Radius).clamp(minimum: minimum, maximum: maximum);
      },
      'clampValues': (visitor, target, positionalArgs, namedArgs) {
        final minimumX = toDouble(namedArgs.get<dynamic>('minimumX'));
        final minimumY = toDouble(namedArgs.get<dynamic>('minimumY'));
        final maximumX = toDouble(namedArgs.get<dynamic>('maximumX'));
        final maximumY = toDouble(namedArgs.get<dynamic>('maximumY'));
        return (target as Radius).clampValues(
          minimumX: minimumX,
          minimumY: minimumY,
          maximumX: maximumX,
          maximumY: maximumY,
        );
      },
      'unary-': (visitor, target, positionalArgs, namedArgs) {
        return -(target as Radius);
      },
      '-': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Radius>(0)!;
        return (target as Radius) - other;
      },
      '+': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Radius>(0)!;
        return (target as Radius) + other;
      },
      '*': (visitor, target, positionalArgs, namedArgs) {
        final operand = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Radius) * operand;
      },
      '/': (visitor, target, positionalArgs, namedArgs) {
        final operand = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Radius) / operand;
      },
      '~/': (visitor, target, positionalArgs, namedArgs) {
        final operand = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Radius) ~/ operand;
      },
      '%': (visitor, target, positionalArgs, namedArgs) {
        final operand = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Radius) % operand;
      },
    },
    staticMethods: {
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<Radius?>(0);
        final b = positionalArgs.get<Radius?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2))!;
        return Radius.lerp(a, b, t);
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter RRect class.
BridgedClass getRRectBridgingDefinition() {
  return BridgedClass(
    nativeType: RRect,
    name: 'RRect',
    constructors: {
      'fromLTRBXY': (visitor, positionalArgs, namedArgs) {
        final left = toDouble(positionalArgs.get<dynamic>(0))!;
        final top = toDouble(positionalArgs.get<dynamic>(1))!;
        final right = toDouble(positionalArgs.get<dynamic>(2))!;
        final bottom = toDouble(positionalArgs.get<dynamic>(3))!;
        final radiusX = toDouble(positionalArgs.get<dynamic>(4))!;
        final radiusY = toDouble(positionalArgs.get<dynamic>(5))!;
        return RRect.fromLTRBXY(left, top, right, bottom, radiusX, radiusY);
      },
      'fromLTRBR': (visitor, positionalArgs, namedArgs) {
        final left = toDouble(positionalArgs.get<dynamic>(0))!;
        final top = toDouble(positionalArgs.get<dynamic>(1))!;
        final right = toDouble(positionalArgs.get<dynamic>(2))!;
        final bottom = toDouble(positionalArgs.get<dynamic>(3))!;
        final radius = positionalArgs.get<Radius>(4)!;
        return RRect.fromLTRBR(left, top, right, bottom, radius);
      },
      'fromRectXY': (visitor, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        final radiusX = toDouble(positionalArgs.get<dynamic>(1))!;
        final radiusY = toDouble(positionalArgs.get<dynamic>(2))!;
        return RRect.fromRectXY(rect, radiusX, radiusY);
      },
      'fromRectAndRadius': (visitor, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        final radius = positionalArgs.get<Radius>(1)!;
        return RRect.fromRectAndRadius(rect, radius);
      },
      'fromLTRBAndCorners': (visitor, positionalArgs, namedArgs) {
        final left = toDouble(positionalArgs.get<dynamic>(0))!;
        final top = toDouble(positionalArgs.get<dynamic>(1))!;
        final right = toDouble(positionalArgs.get<dynamic>(2))!;
        final bottom = toDouble(positionalArgs.get<dynamic>(3))!;
        final topLeft = namedArgs.get<Radius>('topLeft') ?? Radius.zero;
        final topRight = namedArgs.get<Radius>('topRight') ?? Radius.zero;
        final bottomRight = namedArgs.get<Radius>('bottomRight') ?? Radius.zero;
        final bottomLeft = namedArgs.get<Radius>('bottomLeft') ?? Radius.zero;
        return RRect.fromLTRBAndCorners(
          left,
          top,
          right,
          bottom,
          topLeft: topLeft,
          topRight: topRight,
          bottomRight: bottomRight,
          bottomLeft: bottomLeft,
        );
      },
      'fromRectAndCorners': (visitor, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0)!;
        final topLeft = namedArgs.get<Radius>('topLeft') ?? Radius.zero;
        final topRight = namedArgs.get<Radius>('topRight') ?? Radius.zero;
        final bottomRight = namedArgs.get<Radius>('bottomRight') ?? Radius.zero;
        final bottomLeft = namedArgs.get<Radius>('bottomLeft') ?? Radius.zero;
        return RRect.fromRectAndCorners(
          rect,
          topLeft: topLeft,
          topRight: topRight,
          bottomRight: bottomRight,
          bottomLeft: bottomLeft,
        );
      },
      'zero': (visitor, positionalArgs, namedArgs) => RRect.zero,
    },
    getters: {
      'left': (visitor, target) => (target as RRect).left,
      'top': (visitor, target) => (target as RRect).top,
      'right': (visitor, target) => (target as RRect).right,
      'bottom': (visitor, target) => (target as RRect).bottom,
      'width': (visitor, target) => (target as RRect).width,
      'height': (visitor, target) => (target as RRect).height,
      'tlRadius': (visitor, target) => (target as RRect).tlRadius,
      'trRadius': (visitor, target) => (target as RRect).trRadius,
      'brRadius': (visitor, target) => (target as RRect).brRadius,
      'blRadius': (visitor, target) => (target as RRect).blRadius,
      'outerRect': (visitor, target) => (target as RRect).outerRect,
      'safeInnerRect': (visitor, target) => (target as RRect).safeInnerRect,
      'middleRect': (visitor, target) => (target as RRect).middleRect,
      'wideMiddleRect': (visitor, target) => (target as RRect).wideMiddleRect,
      'tallMiddleRect': (visitor, target) => (target as RRect).tallMiddleRect,
      'isEmpty': (visitor, target) => (target as RRect).isEmpty,
      'isFinite': (visitor, target) => (target as RRect).isFinite,
      'isRect': (visitor, target) => (target as RRect).isRect,
      'isStadium': (visitor, target) => (target as RRect).isStadium,
      'isEllipse': (visitor, target) => (target as RRect).isEllipse,
      'isCircle': (visitor, target) => (target as RRect).isCircle,
      'shortestSide': (visitor, target) => (target as RRect).shortestSide,
      'longestSide': (visitor, target) => (target as RRect).longestSide,
      'hasNaN': (visitor, target) => (target as RRect).hasNaN,
      'center': (visitor, target) => (target as RRect).center,
    },
    methods: {
      'shift': (visitor, target, positionalArgs, namedArgs) {
        final offset = positionalArgs.get<Offset>(0)!;
        return (target as RRect).shift(offset);
      },
      'inflate': (visitor, target, positionalArgs, namedArgs) {
        final delta = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as RRect).inflate(delta);
      },
      'deflate': (visitor, target, positionalArgs, namedArgs) {
        final delta = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as RRect).deflate(delta);
      },
      'scaleRadii': (visitor, target, positionalArgs, namedArgs) {
        return (target as RRect).scaleRadii();
      },
      'contains': (visitor, target, positionalArgs, namedArgs) {
        final point = positionalArgs.get<Offset>(0)!;
        return (target as RRect).contains(point);
      },
    },
    staticMethods: {
      'lerp': (visitor, positionalArgs, namedArgs) {
        final a = positionalArgs.get<RRect?>(0);
        final b = positionalArgs.get<RRect?>(1);
        final t = toDouble(positionalArgs.get<dynamic>(2))!;
        return RRect.lerp(a, b, t);
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter RSTransform class.
BridgedClass getRSTransformBridgingDefinition() {
  return BridgedClass(
    nativeType: RSTransform,
    name: 'RSTransform',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final scos = toDouble(positionalArgs.get<dynamic>(0))!;
        final ssin = toDouble(positionalArgs.get<dynamic>(1))!;
        final tx = toDouble(positionalArgs.get<dynamic>(2))!;
        final ty = toDouble(positionalArgs.get<dynamic>(3))!;
        return RSTransform(scos, ssin, tx, ty);
      },
      'fromComponents': (visitor, positionalArgs, namedArgs) {
        final rotation = toDouble(namedArgs.get<dynamic>('rotation'))!;
        final scale = toDouble(namedArgs.get<dynamic>('scale'))!;
        final anchorX = toDouble(namedArgs.get<dynamic>('anchorX'))!;
        final anchorY = toDouble(namedArgs.get<dynamic>('anchorY'))!;
        final translateX = toDouble(namedArgs.get<dynamic>('translateX'))!;
        final translateY = toDouble(namedArgs.get<dynamic>('translateY'))!;
        return RSTransform.fromComponents(
          rotation: rotation,
          scale: scale,
          anchorX: anchorX,
          anchorY: anchorY,
          translateX: translateX,
          translateY: translateY,
        );
      },
    },
    getters: {
      'scos': (visitor, target) => (target as RSTransform).scos,
      'ssin': (visitor, target) => (target as RSTransform).ssin,
      'tx': (visitor, target) => (target as RSTransform).tx,
      'ty': (visitor, target) => (target as RSTransform).ty,
    },
  );
}

/// Returns geometry bridges for d4rt.
Map<String, BridgedClass> getGeometryBridgingDefinitions() {
  return {
    'OffsetBase': getOffsetBaseBridgingDefinition(),
    'Offset': getOffsetBridgingDefinition(),
    'Size': getSizeBridgingDefinition(),
    'Rect': getRectBridgingDefinition(),
    'Radius': getRadiusBridgingDefinition(),
    'RRect': getRRectBridgingDefinition(),
    'RSTransform': getRSTransformBridgingDefinition(),
  };
}
