import 'package:d4rt/d4rt.dart';
import 'package:flutter/gestures.dart';

BridgedClassDefinition getLeastSquaresSolverBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: LeastSquaresSolver,
    name: 'LeastSquaresSolver',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final x = positionalArgs[0] as List;
        final y = positionalArgs[1] as List;
        final w = positionalArgs[2] as List;
        return LeastSquaresSolver(x.cast(), y.cast(), w.cast());
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
