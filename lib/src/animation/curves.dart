import 'package:d4rt/d4rt.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_d4rt/utils/double.dart';

/// Returns all curves bridge definitions
Map<String, dynamic> getCurvesBridgingDefinitions() {
  return {
    'Curve': getCurveBridgingDefinition(),
    'Cubic': getCubicBridgingDefinition(),
    'ThreePointCubic': getThreePointCubicBridgingDefinition(),
    'SawTooth': getSawToothBridgingDefinition(),
    'Interval': getIntervalBridgingDefinition(),
    'Split': getSplitBridgingDefinition(),
    'Threshold': getThresholdBridgingDefinition(),
    'FlippedCurve': getFlippedCurveBridgingDefinition(),
    'ElasticInCurve': getElasticInCurveBridgingDefinition(),
    'ElasticOutCurve': getElasticOutCurveBridgingDefinition(),
    'ElasticInOutCurve': getElasticInOutCurveBridgingDefinition(),
    'CatmullRomCurve': getCatmullRomCurveBridgingDefinition(),
    'CatmullRomSpline': getCatmullRomSplineBridgingDefinition(),
    'Curve2D': getCurve2DBridgingDefinition(),
    'Curve2DSample': getCurve2DSampleBridgingDefinition(),
    'ParametricCurve': getParametricCurveBridgingDefinition(),
    'Curves': getCurvesBridgingDefinition(),
  };
}

/// Returns the BridgedClass for Curve abstract class
BridgedClass getCurveBridgingDefinition() {
  return BridgedClass(
    nativeType: Curve,
    name: 'Curve',
    constructors: {},
    getters: {'flipped': (visitor, target) => (target as Curve).flipped},
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Curve).transform(t);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as Curve).toString();
      },
    },
  );
}

/// Returns the BridgedClass for Cubic
BridgedClass getCubicBridgingDefinition() {
  return BridgedClass(
    nativeType: Cubic,
    name: 'Cubic',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final a = toDouble(positionalArgs.get<dynamic>(0))!;
        final b = toDouble(positionalArgs.get<dynamic>(1))!;
        final c = toDouble(positionalArgs.get<dynamic>(2))!;
        final d = toDouble(positionalArgs.get<dynamic>(3))!;
        return Cubic(a, b, c, d);
      },
    },
    getters: {
      'a': (visitor, target) => (target as Cubic).a,
      'b': (visitor, target) => (target as Cubic).b,
      'c': (visitor, target) => (target as Cubic).c,
      'd': (visitor, target) => (target as Cubic).d,
      'flipped': (visitor, target) => (target as Cubic).flipped,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Cubic).transform(t);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as Cubic).toString();
      },
    },
  );
}

/// Returns the BridgedClass for ThreePointCubic
BridgedClass getThreePointCubicBridgingDefinition() {
  return BridgedClass(
    nativeType: ThreePointCubic,
    name: 'ThreePointCubic',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final a1 = positionalArgs.get<Offset>(0)!;
        final b1 = positionalArgs.get<Offset>(1)!;
        final midpoint = positionalArgs.get<Offset>(2)!;
        final a2 = positionalArgs.get<Offset>(3)!;
        final b2 = positionalArgs.get<Offset>(4)!;
        return ThreePointCubic(a1, b1, midpoint, a2, b2);
      },
    },
    getters: {
      'a1': (visitor, target) => (target as ThreePointCubic).a1,
      'b1': (visitor, target) => (target as ThreePointCubic).b1,
      'midpoint': (visitor, target) => (target as ThreePointCubic).midpoint,
      'a2': (visitor, target) => (target as ThreePointCubic).a2,
      'b2': (visitor, target) => (target as ThreePointCubic).b2,
      'flipped': (visitor, target) => (target as ThreePointCubic).flipped,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as ThreePointCubic).transform(t);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as ThreePointCubic).toString();
      },
    },
  );
}

/// Returns the BridgedClass for SawTooth
BridgedClass getSawToothBridgingDefinition() {
  return BridgedClass(
    nativeType: SawTooth,
    name: 'SawTooth',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final count = positionalArgs.get<int>(0)!;
        return SawTooth(count);
      },
    },
    getters: {
      'count': (visitor, target) => (target as SawTooth).count,
      'flipped': (visitor, target) => (target as SawTooth).flipped,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as SawTooth).transform(t);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as SawTooth).toString();
      },
    },
  );
}

/// Returns the BridgedClass for Interval
BridgedClass getIntervalBridgingDefinition() {
  return BridgedClass(
    nativeType: Interval,
    name: 'Interval',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final begin = toDouble(positionalArgs.get<dynamic>(0))!;
        final end = toDouble(positionalArgs.get<dynamic>(1))!;
        final curve = namedArgs.get<Curve?>('curve') ?? Curves.linear;
        return Interval(begin, end, curve: curve);
      },
    },
    getters: {
      'begin': (visitor, target) => (target as Interval).begin,
      'end': (visitor, target) => (target as Interval).end,
      'curve': (visitor, target) => (target as Interval).curve,
      'flipped': (visitor, target) => (target as Interval).flipped,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Interval).transform(t);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as Interval).toString();
      },
    },
  );
}

/// Returns the BridgedClass for Split
BridgedClass getSplitBridgingDefinition() {
  return BridgedClass(
    nativeType: Split,
    name: 'Split',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final split = toDouble(positionalArgs.get<dynamic>(0))!;
        final beginCurve = namedArgs.get<Curve?>('beginCurve') ?? Curves.linear;
        final endCurve =
            namedArgs.get<Curve?>('endCurve') ?? Curves.easeOutCubic;
        return Split(split, beginCurve: beginCurve, endCurve: endCurve);
      },
    },
    getters: {
      'split': (visitor, target) => (target as Split).split,
      'beginCurve': (visitor, target) => (target as Split).beginCurve,
      'endCurve': (visitor, target) => (target as Split).endCurve,
      'flipped': (visitor, target) => (target as Split).flipped,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Split).transform(t);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as Split).toString();
      },
    },
  );
}

/// Returns the BridgedClass for Threshold
BridgedClass getThresholdBridgingDefinition() {
  return BridgedClass(
    nativeType: Threshold,
    name: 'Threshold',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final threshold = toDouble(positionalArgs.get<dynamic>(0))!;
        return Threshold(threshold);
      },
    },
    getters: {
      'threshold': (visitor, target) => (target as Threshold).threshold,
      'flipped': (visitor, target) => (target as Threshold).flipped,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Threshold).transform(t);
      },
    },
  );
}

/// Returns the BridgedClass for FlippedCurve
BridgedClass getFlippedCurveBridgingDefinition() {
  return BridgedClass(
    nativeType: FlippedCurve,
    name: 'FlippedCurve',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final curve = positionalArgs.get<Curve>(0)!;
        return FlippedCurve(curve);
      },
    },
    getters: {
      'curve': (visitor, target) => (target as FlippedCurve).curve,
      'flipped': (visitor, target) => (target as FlippedCurve).flipped,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as FlippedCurve).transform(t);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as FlippedCurve).toString();
      },
    },
  );
}

/// Returns the BridgedClass for ElasticInCurve
BridgedClass getElasticInCurveBridgingDefinition() {
  return BridgedClass(
    nativeType: ElasticInCurve,
    name: 'ElasticInCurve',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final period = toDouble(positionalArgs.get<dynamic>(0)) ?? 0.4;
        return ElasticInCurve(period);
      },
    },
    getters: {
      'period': (visitor, target) => (target as ElasticInCurve).period,
      'flipped': (visitor, target) => (target as ElasticInCurve).flipped,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as ElasticInCurve).transform(t);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as ElasticInCurve).toString();
      },
    },
  );
}

/// Returns the BridgedClass for ElasticOutCurve
BridgedClass getElasticOutCurveBridgingDefinition() {
  return BridgedClass(
    nativeType: ElasticOutCurve,
    name: 'ElasticOutCurve',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final period = toDouble(positionalArgs.get<dynamic>(0)) ?? 0.4;
        return ElasticOutCurve(period);
      },
    },
    getters: {
      'period': (visitor, target) => (target as ElasticOutCurve).period,
      'flipped': (visitor, target) => (target as ElasticOutCurve).flipped,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as ElasticOutCurve).transform(t);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as ElasticOutCurve).toString();
      },
    },
  );
}

/// Returns the BridgedClass for ElasticInOutCurve
BridgedClass getElasticInOutCurveBridgingDefinition() {
  return BridgedClass(
    nativeType: ElasticInOutCurve,
    name: 'ElasticInOutCurve',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final period = toDouble(positionalArgs.get<dynamic>(0)) ?? 0.4;
        return ElasticInOutCurve(period);
      },
    },
    getters: {
      'period': (visitor, target) => (target as ElasticInOutCurve).period,
      'flipped': (visitor, target) => (target as ElasticInOutCurve).flipped,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as ElasticInOutCurve).transform(t);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as ElasticInOutCurve).toString();
      },
    },
  );
}

/// Returns the BridgedClass for CatmullRomCurve
BridgedClass getCatmullRomCurveBridgingDefinition() {
  return BridgedClass(
    nativeType: CatmullRomCurve,
    name: 'CatmullRomCurve',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final controlPoints = positionalArgs.get<List<Offset>>(0)!;
        final tension = toDouble(namedArgs.get<dynamic>('tension')) ?? 0.0;
        return CatmullRomCurve(controlPoints, tension: tension);
      },
      'precompute': (visitor, positionalArgs, namedArgs) {
        final controlPoints = positionalArgs.get<List<Offset>>(0)!;
        final tension = toDouble(namedArgs.get<dynamic>('tension')) ?? 0.0;
        return CatmullRomCurve.precompute(controlPoints, tension: tension);
      },
    },
    getters: {
      'controlPoints': (visitor, target) =>
          (target as CatmullRomCurve).controlPoints,
      'tension': (visitor, target) => (target as CatmullRomCurve).tension,
      'flipped': (visitor, target) => (target as CatmullRomCurve).flipped,
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as CatmullRomCurve).transform(t);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as CatmullRomCurve).toString();
      },
    },
    staticMethods: {
      'validateControlPoints': (visitor, positionalArgs, namedArgs) {
        final controlPoints = positionalArgs.get<List<Offset>?>(0);
        final tension = toDouble(namedArgs.get<dynamic>('tension')) ?? 0.0;
        final reasons = namedArgs.get<List<String>?>('reasons');
        return CatmullRomCurve.validateControlPoints(
          controlPoints,
          tension: tension,
          reasons: reasons,
        );
      },
    },
  );
}

/// Returns the BridgedClass for CatmullRomSpline
BridgedClass getCatmullRomSplineBridgingDefinition() {
  return BridgedClass(
    nativeType: CatmullRomSpline,
    name: 'CatmullRomSpline',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final controlPoints = positionalArgs.get<List<Offset>>(0)!;
        final tension = toDouble(namedArgs.get<dynamic>('tension')) ?? 0.0;
        final startHandle = namedArgs.get<Offset?>('startHandle');
        final endHandle = namedArgs.get<Offset?>('endHandle');
        return CatmullRomSpline(
          controlPoints,
          tension: tension,
          startHandle: startHandle,
          endHandle: endHandle,
        );
      },
      'precompute': (visitor, positionalArgs, namedArgs) {
        final controlPoints = positionalArgs.get<List<Offset>>(0)!;
        final tension = toDouble(namedArgs.get<dynamic>('tension')) ?? 0.0;
        final startHandle = namedArgs.get<Offset?>('startHandle');
        final endHandle = namedArgs.get<Offset?>('endHandle');
        return CatmullRomSpline.precompute(
          controlPoints,
          tension: tension,
          startHandle: startHandle,
          endHandle: endHandle,
        );
      },
    },
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as CatmullRomSpline).transform(t);
      },
      'generateSamples': (visitor, target, positionalArgs, namedArgs) {
        final start = toDouble(namedArgs.get<dynamic>('start')) ?? 0.0;
        final end = toDouble(namedArgs.get<dynamic>('end')) ?? 1.0;
        final tolerance =
            toDouble(namedArgs.get<dynamic>('tolerance')) ?? 1e-10;
        return (target as CatmullRomSpline).generateSamples(
          start: start,
          end: end,
          tolerance: tolerance,
        );
      },
      'findInverse': (visitor, target, positionalArgs, namedArgs) {
        final x = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as CatmullRomSpline).findInverse(x);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as CatmullRomSpline).toString();
      },
    },
  );
}

/// Returns the BridgedClass for Curve2D abstract class
BridgedClass getCurve2DBridgingDefinition() {
  return BridgedClass(
    nativeType: Curve2D,
    name: 'Curve2D',
    constructors: {},
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Curve2D).transform(t);
      },
      'generateSamples': (visitor, target, positionalArgs, namedArgs) {
        final start = toDouble(namedArgs.get<dynamic>('start')) ?? 0.0;
        final end = toDouble(namedArgs.get<dynamic>('end')) ?? 1.0;
        final tolerance =
            toDouble(namedArgs.get<dynamic>('tolerance')) ?? 1e-10;
        return (target as Curve2D).generateSamples(
          start: start,
          end: end,
          tolerance: tolerance,
        );
      },
      'findInverse': (visitor, target, positionalArgs, namedArgs) {
        final x = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as Curve2D).findInverse(x);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as Curve2D).toString();
      },
    },
  );
}

/// Returns the BridgedClass for Curve2DSample
BridgedClass getCurve2DSampleBridgingDefinition() {
  return BridgedClass(
    nativeType: Curve2DSample,
    name: 'Curve2DSample',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        final value = positionalArgs.get<Offset>(1)!;
        return Curve2DSample(t, value);
      },
    },
    getters: {
      't': (visitor, target) => (target as Curve2DSample).t,
      'value': (visitor, target) => (target as Curve2DSample).value,
    },
    methods: {
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as Curve2DSample).toString();
      },
    },
  );
}

/// Returns the BridgedClass for ParametricCurve abstract class
BridgedClass getParametricCurveBridgingDefinition() {
  return BridgedClass(
    nativeType: ParametricCurve,
    name: 'ParametricCurve',
    methods: {
      'transform': (visitor, target, positionalArgs, namedArgs) {
        final t = toDouble(positionalArgs.get<dynamic>(0))!;
        return (target as ParametricCurve).transform(t);
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as ParametricCurve).toString();
      },
    },
  );
}

/// Returns the BridgedClass for Curves static class
BridgedClass getCurvesBridgingDefinition() {
  return BridgedClass(
    nativeType: Curves, // Curves is an abstract final class
    name: 'Curves',
    staticGetters: {
      'linear': (visitor) => Curves.linear,
      'decelerate': (visitor) => Curves.decelerate,
      'fastLinearToSlowEaseIn': (visitor) => Curves.fastLinearToSlowEaseIn,
      'fastEaseInToSlowEaseOut': (visitor) => Curves.fastEaseInToSlowEaseOut,
      'ease': (visitor) => Curves.ease,
      'easeIn': (visitor) => Curves.easeIn,
      'easeInToLinear': (visitor) => Curves.easeInToLinear,
      'easeInSine': (visitor) => Curves.easeInSine,
      'easeInQuad': (visitor) => Curves.easeInQuad,
      'easeInCubic': (visitor) => Curves.easeInCubic,
      'easeInQuart': (visitor) => Curves.easeInQuart,
      'easeInQuint': (visitor) => Curves.easeInQuint,
      'easeInExpo': (visitor) => Curves.easeInExpo,
      'easeInCirc': (visitor) => Curves.easeInCirc,
      'easeInBack': (visitor) => Curves.easeInBack,
      'easeOut': (visitor) => Curves.easeOut,
      'linearToEaseOut': (visitor) => Curves.linearToEaseOut,
      'easeOutSine': (visitor) => Curves.easeOutSine,
      'easeOutQuad': (visitor) => Curves.easeOutQuad,
      'easeOutCubic': (visitor) => Curves.easeOutCubic,
      'easeOutQuart': (visitor) => Curves.easeOutQuart,
      'easeOutQuint': (visitor) => Curves.easeOutQuint,
      'easeOutExpo': (visitor) => Curves.easeOutExpo,
      'easeOutCirc': (visitor) => Curves.easeOutCirc,
      'easeOutBack': (visitor) => Curves.easeOutBack,
      'easeInOut': (visitor) => Curves.easeInOut,
      'easeInOutSine': (visitor) => Curves.easeInOutSine,
      'easeInOutQuad': (visitor) => Curves.easeInOutQuad,
      'easeInOutCubic': (visitor) => Curves.easeInOutCubic,
      'easeInOutCubicEmphasized': (visitor) => Curves.easeInOutCubicEmphasized,
      'easeInOutQuart': (visitor) => Curves.easeInOutQuart,
      'easeInOutQuint': (visitor) => Curves.easeInOutQuint,
      'easeInOutExpo': (visitor) => Curves.easeInOutExpo,
      'easeInOutCirc': (visitor) => Curves.easeInOutCirc,
      'easeInOutBack': (visitor) => Curves.easeInOutBack,
      'fastOutSlowIn': (visitor) => Curves.fastOutSlowIn,
      'slowMiddle': (visitor) => Curves.slowMiddle,
      'bounceIn': (visitor) => Curves.bounceIn,
      'bounceOut': (visitor) => Curves.bounceOut,
      'bounceInOut': (visitor) => Curves.bounceInOut,
      'elasticIn': (visitor) => Curves.elasticIn,
      'elasticOut': (visitor) => Curves.elasticOut,
      'elasticInOut': (visitor) => Curves.elasticInOut,
    },
  );
}
