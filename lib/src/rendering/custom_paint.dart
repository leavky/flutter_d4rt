import 'package:d4rt/d4rt.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_d4rt/utils/extensions/list.dart';

/// Bridge class for CustomPainter that connects to d4rt interpreted instances
class CustomPainterBridge extends CustomPainter {
  final InterpreterVisitor visitor;
  final InterpretedInstance instance;
  final Listenable? repaint;

  CustomPainterBridge({
    required this.visitor,
    required this.instance,
    this.repaint,
  }) : super(repaint: repaint) {
    instance.bridgedSuperObject = this;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final fn = instance.klass.findInstanceMethod('paint');
    if (fn == null) {
      throw RuntimeError('paint method not found in CustomPainter instance');
    }
    fn.bind(instance).call(visitor, [canvas, size], {});
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    final fn = instance.klass.findInstanceMethod('shouldRepaint');
    if (fn == null) {
      return true; // Default to always repaint if method not found
    }

    // Create oldDelegate wrapper for the interpreted code
    final oldDelegateWrapper = oldDelegate is CustomPainterBridge
        ? oldDelegate.instance
        : oldDelegate;

    final result = fn.bind(instance).call(visitor, [oldDelegateWrapper], {});
    return result as bool? ?? true;
  }

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) {
    final fn = instance.klass.findInstanceMethod('shouldRebuildSemantics');
    if (fn != null) {
      final oldDelegateWrapper = oldDelegate is CustomPainterBridge
          ? oldDelegate.instance
          : oldDelegate;
      final result = fn.bind(instance).call(visitor, [oldDelegateWrapper], {});
      return result as bool? ?? shouldRepaint(oldDelegate);
    }
    return shouldRepaint(oldDelegate);
  }

  @override
  bool? hitTest(Offset position) {
    final fn = instance.klass.findInstanceMethod('hitTest');
    if (fn != null) {
      final result = fn.bind(instance).call(visitor, [position], {});
      return result as bool?;
    }
    return super.hitTest(position);
  }

  @override
  SemanticsBuilderCallback? get semanticsBuilder {
    final fn = instance.klass.findInstanceMethod('semanticsBuilder');
    if (fn != null) {
      return (Size size) {
        final result = fn.bind(instance).call(visitor, [size], {});
        if (result is List) {
          return result.cast<CustomPainterSemantics>();
        }
        return <CustomPainterSemantics>[];
      };
    }
    return super.semanticsBuilder;
  }
}

/// Returns the BridgedClass for the Flutter CustomPainter class.
BridgedClass getCustomPainterBridgingDefinition() {
  return BridgedClass(
    nativeType: CustomPainterBridge,
    name: 'CustomPainter',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final repaint = namedArgs.get<Listenable?>('repaint');
        return CustomPainterBridge(
          visitor: visitor,
          instance: positionalArgs.get<InterpretedInstance>(0)!,
          repaint: repaint,
        );
      },
    },
    getters: {
      'semanticsBuilder': (visitor, target) {
        final bridge = target as CustomPainterBridge;
        return bridge.semanticsBuilder;
      },
    },
    methods: {
      'paint': (visitor, target, positionalArgs, namedArgs) {
        final Canvas canvas = positionalArgs.get<Canvas>(0)!;
        final Size size = positionalArgs.get<Size>(1)!;
        (target as CustomPainterBridge).paint(canvas, size);
        return null;
      },
      'shouldRepaint': (visitor, target, positionalArgs, namedArgs) {
        final CustomPainter oldDelegate = positionalArgs.get<CustomPainter>(0)!;
        return (target as CustomPainterBridge).shouldRepaint(oldDelegate);
      },
      'shouldRebuildSemantics': (visitor, target, positionalArgs, namedArgs) {
        final CustomPainter oldDelegate = positionalArgs.get<CustomPainter>(0)!;
        return (target as CustomPainterBridge).shouldRebuildSemantics(
          oldDelegate,
        );
      },
      'hitTest': (visitor, target, positionalArgs, namedArgs) {
        final Offset position = positionalArgs.get<Offset>(0)!;
        return (target as CustomPainterBridge).hitTest(position);
      },
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final InterpretedFunction listener = positionalArgs
            .get<InterpretedFunction>(0)!;
        (target as CustomPainterBridge).addListener(
          () => listener.call(visitor, [], {}),
        );
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final InterpretedFunction listener = positionalArgs
            .get<InterpretedFunction>(0)!;
        (target as CustomPainterBridge).removeListener(
          () => listener.call(visitor, [], {}),
        );
        return null;
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as CustomPainterBridge).toString();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter CustomPainterSemantics class.
BridgedClass getCustomPainterSemanticsBridgingDefinition() {
  return BridgedClass(
    nativeType: CustomPainterSemantics,
    name: 'CustomPainterSemantics',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final Key? key = namedArgs.get<Key?>('key');
        final Rect rect = namedArgs.get<Rect>('rect')!;
        final SemanticsProperties properties = namedArgs
            .get<SemanticsProperties>('properties')!;
        final Matrix4? transform = namedArgs.get<Matrix4?>('transform');
        final Set<SemanticsTag>? tags = namedArgs.get<Set<SemanticsTag>?>(
          'tags',
        );

        return CustomPainterSemantics(
          key: key,
          rect: rect,
          properties: properties,
          transform: transform,
          tags: tags,
        );
      },
    },
    getters: {
      'key': (visitor, target) => (target as CustomPainterSemantics).key,
      'rect': (visitor, target) => (target as CustomPainterSemantics).rect,
      'properties': (visitor, target) =>
          (target as CustomPainterSemantics).properties,
      'transform': (visitor, target) =>
          (target as CustomPainterSemantics).transform,
      'tags': (visitor, target) => (target as CustomPainterSemantics).tags,
    },
  );
}

/// Returns the BridgedClass for the Flutter RenderCustomPaint class.
BridgedClass getRenderCustomPaintBridgingDefinition() {
  return BridgedClass(
    nativeType: RenderCustomPaint,
    name: 'RenderCustomPaint',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final CustomPainter? painter = namedArgs.get<CustomPainter?>('painter');
        final CustomPainter? foregroundPainter = namedArgs.get<CustomPainter?>(
          'foregroundPainter',
        );
        final Size preferredSize =
            namedArgs.get<Size>('preferredSize') ?? Size.zero;
        final bool isComplex = namedArgs.get<bool>('isComplex') ?? false;
        final bool willChange = namedArgs.get<bool>('willChange') ?? false;
        final RenderBox? child = namedArgs.get<RenderBox?>('child');

        return RenderCustomPaint(
          painter: painter,
          foregroundPainter: foregroundPainter,
          preferredSize: preferredSize,
          isComplex: isComplex,
          willChange: willChange,
          child: child,
        );
      },
    },
    getters: {
      'painter': (visitor, target) => (target as RenderCustomPaint).painter,
      'foregroundPainter': (visitor, target) =>
          (target as RenderCustomPaint).foregroundPainter,
      'preferredSize': (visitor, target) =>
          (target as RenderCustomPaint).preferredSize,
      'isComplex': (visitor, target) => (target as RenderCustomPaint).isComplex,
      'willChange': (visitor, target) =>
          (target as RenderCustomPaint).willChange,
      'child': (visitor, target) => (target as RenderCustomPaint).child,
      'size': (visitor, target) => (target as RenderCustomPaint).size,
    },
    setters: {
      'painter': (visitor, target, value) {
        (target as RenderCustomPaint).painter = value as CustomPainter?;
        return;
      },
      'foregroundPainter': (visitor, target, value) {
        (target as RenderCustomPaint).foregroundPainter =
            value as CustomPainter?;
        return;
      },
      'preferredSize': (visitor, target, value) {
        (target as RenderCustomPaint).preferredSize = value as Size;
        return;
      },
      'isComplex': (visitor, target, value) {
        (target as RenderCustomPaint).isComplex = value as bool;
        return;
      },
      'willChange': (visitor, target, value) {
        (target as RenderCustomPaint).willChange = value as bool;
        return;
      },
      'child': (visitor, target, value) {
        (target as RenderCustomPaint).child = value as RenderBox?;
        return;
      },
    },
    methods: {
      'markNeedsPaint': (visitor, target, positionalArgs, namedArgs) {
        (target as RenderCustomPaint).markNeedsPaint();
        return null;
      },
      'markNeedsLayout': (visitor, target, positionalArgs, namedArgs) {
        (target as RenderCustomPaint).markNeedsLayout();
        return null;
      },
      'markNeedsSemanticsUpdate': (visitor, target, positionalArgs, namedArgs) {
        (target as RenderCustomPaint).markNeedsSemanticsUpdate();
        return null;
      },
      'paint': (visitor, target, positionalArgs, namedArgs) {
        final PaintingContext context = positionalArgs.get<PaintingContext>(0)!;
        final Offset offset = positionalArgs.get<Offset>(1)!;
        (target as RenderCustomPaint).paint(context, offset);
        return null;
      },
      'hitTest': (visitor, target, positionalArgs, namedArgs) {
        final BoxHitTestResult result = positionalArgs.get<BoxHitTestResult>(
          0,
        )!;
        final Offset position = namedArgs.get<Offset>('position')!;
        return (target as RenderCustomPaint).hitTest(
          result,
          position: position,
        );
      },
      'hitTestSelf': (visitor, target, positionalArgs, namedArgs) {
        final Offset position = positionalArgs.get<Offset>(0)!;
        return (target as RenderCustomPaint).hitTestSelf(position);
      },
      'hitTestChildren': (visitor, target, positionalArgs, namedArgs) {
        final BoxHitTestResult result = positionalArgs.get<BoxHitTestResult>(
          0,
        )!;
        final Offset position = namedArgs.get<Offset>('position')!;
        return (target as RenderCustomPaint).hitTestChildren(
          result,
          position: position,
        );
      },
      'computeMinIntrinsicWidth': (visitor, target, positionalArgs, namedArgs) {
        final double height = positionalArgs.getToDouble(0)!;
        return (target as RenderCustomPaint).computeMinIntrinsicWidth(height);
      },
      'computeMaxIntrinsicWidth': (visitor, target, positionalArgs, namedArgs) {
        final double height = positionalArgs.getToDouble(0)!;
        return (target as RenderCustomPaint).computeMaxIntrinsicWidth(height);
      },
      'computeMinIntrinsicHeight':
          (visitor, target, positionalArgs, namedArgs) {
            final double width = positionalArgs.getToDouble(0)!;
            return (target as RenderCustomPaint).computeMinIntrinsicHeight(
              width,
            );
          },
      'computeMaxIntrinsicHeight':
          (visitor, target, positionalArgs, namedArgs) {
            final double width = positionalArgs.getToDouble(0)!;
            return (target as RenderCustomPaint).computeMaxIntrinsicHeight(
              width,
            );
          },
      'performLayout': (visitor, target, positionalArgs, namedArgs) {
        (target as RenderCustomPaint).performLayout();
        return null;
      },
      'attach': (visitor, target, positionalArgs, namedArgs) {
        final PipelineOwner owner = positionalArgs.get<PipelineOwner>(0)!;
        (target as RenderCustomPaint).attach(owner);
        return null;
      },
      'detach': (visitor, target, positionalArgs, namedArgs) {
        (target as RenderCustomPaint).detach();
        return null;
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as RenderCustomPaint).toString();
      },
    },
  );
}
