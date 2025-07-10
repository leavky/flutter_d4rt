import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getLeastSquaresSolverBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: LeastSquaresSolver,
    name: 'LeastSquaresSolver',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final x = positionalArgs[0] as List<double>;
        final y = positionalArgs[1] as List<double>;
        final w = positionalArgs[2] as List<double>;
        return LeastSquaresSolver(x, y, w);
      },
    },
    methods: {
      'solve': (visitor, target, positionalArgs, namedArgs) {
        final degree = positionalArgs[0] as int;
        return (target as LeastSquaresSolver).solve(degree);
      },
    },
    getters: {
      'x': (visitor, target) => (target as LeastSquaresSolver).x,
      'y': (visitor, target) => (target as LeastSquaresSolver).y,
      'w': (visitor, target) => (target as LeastSquaresSolver).w,
    },
  );
}

BridgedClassDefinition getPolynomialFitBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: PolynomialFit,
    name: 'PolynomialFit',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final degree = positionalArgs[0] as int;
        return PolynomialFit(degree);
      },
    },
    getters: {
      'coefficients': (visitor, target) =>
          (target as PolynomialFit).coefficients,
      'confidence': (visitor, target) => (target as PolynomialFit).confidence,
    },
  );
}
