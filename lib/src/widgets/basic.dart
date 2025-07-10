import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/list.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

BridgedClassDefinition getColumnBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Column,
    name: 'Column',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final List<Widget> children = [];
        final interpretedChildren = visitor.toWidgets(namedArgs['children']);
        if (interpretedChildren is List) {
          children.addAll(interpretedChildren.cast());
        }
        final key = namedArgs.get<Key?>('key');
        final mainAxisAlignment =
            namedArgs.get<MainAxisAlignment?>('mainAxisAlignment') ??
            MainAxisAlignment.start;
        final crossAxisAlignment =
            namedArgs.get<CrossAxisAlignment?>('crossAxisAlignment') ??
            CrossAxisAlignment.center;
        final textDirection =
            namedArgs.get<TextDirection?>('textDirection') ?? TextDirection.ltr;
        final verticalDirection =
            namedArgs.get<VerticalDirection?>('verticalDirection') ??
            VerticalDirection.down;
        final mainAxisSize =
            namedArgs.get<MainAxisSize?>('mainAxisSize') ?? MainAxisSize.max;
        final textBaseline =
            namedArgs.get<TextBaseline?>('textBaseline') ??
            TextBaseline.alphabetic;
        final spacing = namedArgs.getToDouble('spacing') ?? 0.0;

        return Column(
          key: key,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          mainAxisSize: mainAxisSize,
          textBaseline: textBaseline,
          spacing: spacing,
          children: children,
        );
      },
    },
    getters: {
      'mainAxisAlignment': (visitor, target) =>
          (target as Column).mainAxisAlignment,
      'crossAxisAlignment': (visitor, target) =>
          (target as Column).crossAxisAlignment,
      'textDirection': (visitor, target) => (target as Column).textDirection,
      'verticalDirection': (visitor, target) =>
          (target as Column).verticalDirection,
      'mainAxisSize': (visitor, target) => (target as Column).mainAxisSize,
      'textBaseline': (visitor, target) => (target as Column).textBaseline,
      'spacing': (visitor, target) => (target as Column).spacing,
      'children': (visitor, target) => (target as Column).children,
      'key': (visitor, target) => (target as Column).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter Row widget.
BridgedClassDefinition getRowBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Row,
    name: 'Row',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final List<Widget> children = [];
        final interpretedChildren = visitor.toWidgets(namedArgs['children']);
        if (interpretedChildren is List) {
          children.addAll(interpretedChildren.cast());
        }
        final key = namedArgs.get<Key?>('key');
        final mainAxisAlignment =
            namedArgs.get<MainAxisAlignment?>('mainAxisAlignment') ??
            MainAxisAlignment.start;
        final crossAxisAlignment =
            namedArgs.get<CrossAxisAlignment?>('crossAxisAlignment') ??
            CrossAxisAlignment.center;
        final textDirection =
            namedArgs.get<TextDirection?>('textDirection') ?? TextDirection.ltr;
        final verticalDirection =
            namedArgs.get<VerticalDirection?>('verticalDirection') ??
            VerticalDirection.down;
        final mainAxisSize =
            namedArgs.get<MainAxisSize?>('mainAxisSize') ?? MainAxisSize.max;
        final textBaseline =
            namedArgs.get<TextBaseline?>('textBaseline') ??
            TextBaseline.alphabetic;
        final spacing = namedArgs.getToDouble('spacing') ?? 0.0;

        return Row(
          key: key,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          mainAxisSize: mainAxisSize,
          textBaseline: textBaseline,
          spacing: spacing,
          children: children,
        );
      },
    },
    getters: {
      'mainAxisAlignment': (visitor, target) =>
          (target as Row).mainAxisAlignment,
      'crossAxisAlignment': (visitor, target) =>
          (target as Row).crossAxisAlignment,
      'textDirection': (visitor, target) => (target as Row).textDirection,
      'verticalDirection': (visitor, target) =>
          (target as Row).verticalDirection,
      'mainAxisSize': (visitor, target) => (target as Row).mainAxisSize,
      'textBaseline': (visitor, target) => (target as Row).textBaseline,
      'spacing': (visitor, target) => (target as Row).spacing,
      'children': (visitor, target) => (target as Row).children,
      'key': (visitor, target) => (target as Row).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter Padding widget.
BridgedClassDefinition getPaddingBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Padding,
    name: 'Padding',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final child = visitor.toWidgets(namedArgs['child']);

        return Padding(key: key, padding: padding!, child: child);
      },
    },

    getters: {
      'padding': (visitor, target) => (target as Padding).padding,
      'child': (visitor, target) => (target as Padding).child,
      'key': (visitor, target) => (target as Padding).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter Stack widget.
BridgedClassDefinition getStackBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Stack,
    name: 'Stack',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ??
            AlignmentDirectional.topStart;
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final fit = namedArgs.get<StackFit?>('fit') ?? StackFit.loose;
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;

        final children = visitor.toWidgets(namedArgs['children']);

        return Stack(
          key: key,
          alignment: alignment,
          textDirection: textDirection,
          fit: fit,
          clipBehavior: clipBehavior,
          children: children,
        );
      },
    },
    getters: {
      'alignment': (visitor, target) => (target as Stack).alignment,
      'textDirection': (visitor, target) => (target as Stack).textDirection,
      'fit': (visitor, target) => (target as Stack).fit,
      'clipBehavior': (visitor, target) => (target as Stack).clipBehavior,
      'children': (visitor, target) => (target as Stack).children,
      'key': (visitor, target) => (target as Stack).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter Positioned widget.
BridgedClassDefinition getPositionedBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Positioned,
    name: 'Positioned',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final left = namedArgs.getToDouble('left');
        final top = namedArgs.getToDouble('top');
        final right = namedArgs.getToDouble('right');
        final bottom = namedArgs.getToDouble('bottom');
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final child = visitor.toWidgets(namedArgs['child']);
        return Positioned(
          key: key,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          width: width,
          height: height,
          child: child,
        );
      },
      'fill': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final left = namedArgs.getToDouble('left') ?? 0.0;
        final top = namedArgs.getToDouble('top') ?? 0.0;
        final right = namedArgs.getToDouble('right') ?? 0.0;
        final bottom = namedArgs.getToDouble('bottom') ?? 0.0;
        final child = visitor.toWidgets(namedArgs['child']);

        return Positioned.fill(
          key: key,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          child: child,
        );
      },
      'fromRect': (visitor, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect?>(0);
        final child = visitor.toWidgets(namedArgs['child']);
        return Positioned.fromRect(rect: rect!, child: child);
      },
    },
    getters: {
      'left': (visitor, target) => (target as Positioned).left,
      'top': (visitor, target) => (target as Positioned).top,
      'right': (visitor, target) => (target as Positioned).right,
      'bottom': (visitor, target) => (target as Positioned).bottom,
      'width': (visitor, target) => (target as Positioned).width,
      'height': (visitor, target) => (target as Positioned).height,
      'child': (visitor, target) => (target as Positioned).child,
      'key': (visitor, target) => (target as Positioned).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter Flexible widget.
BridgedClassDefinition getFlexibleBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Flexible,
    name: 'Flexible',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final flex = namedArgs.get<int?>('flex') ?? 1;
        final fit = namedArgs.get<FlexFit?>('fit') ?? FlexFit.loose;
        final child = visitor.toWidgets(namedArgs['child']);
        return Flexible(key: key, flex: flex, fit: fit, child: child);
      },
    },
    getters: {
      'flex': (visitor, target) => (target as Flexible).flex,
      'fit': (visitor, target) => (target as Flexible).fit,
      'child': (visitor, target) => (target as Flexible).child,
      'key': (visitor, target) => (target as Flexible).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter Expanded widget.
BridgedClassDefinition getExpandedBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Expanded,
    name: 'Expanded',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final flex = namedArgs.get<int?>('flex') ?? 1;
        final child = visitor.toWidgets(namedArgs['child']);
        return Expanded(key: key, flex: flex, child: child);
      },
    },
    getters: {
      'flex': (visitor, target) => (target as Expanded).flex,
      'child': (visitor, target) => (target as Expanded).child,
      'key': (visitor, target) => (target as Expanded).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter Align widget.
BridgedClassDefinition getAlignBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Align,
    name: 'Align',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final alignment =
            namedArgs.get<AlignmentGeometry?>('alignment') ?? Alignment.center;
        final widthFactor = namedArgs.getToDouble('widthFactor');
        final heightFactor = namedArgs.getToDouble('heightFactor');
        final child = visitor.toWidgets(namedArgs['child']);

        return Align(
          key: key,
          alignment: alignment,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: child,
        );
      },
    },
    getters: {
      'alignment': (visitor, target) => (target as Align).alignment,
      'widthFactor': (visitor, target) => (target as Align).widthFactor,
      'heightFactor': (visitor, target) => (target as Align).heightFactor,
      'child': (visitor, target) => (target as Align).child,
      'key': (visitor, target) => (target as Align).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter Center widget.
BridgedClassDefinition getCenterBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Center,
    name: 'Center',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final widthFactor = namedArgs.getToDouble('widthFactor');
        final heightFactor = namedArgs.getToDouble('heightFactor');
        final child = visitor.toWidgets(namedArgs['child']);

        return Center(
          key: key,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: child,
        );
      },
    },
    getters: {
      'widthFactor': (visitor, target) => (target as Center).widthFactor,
      'heightFactor': (visitor, target) => (target as Center).heightFactor,
      'child': (visitor, target) => (target as Center).child,
      'key': (visitor, target) => (target as Center).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter SizedBox widget.
BridgedClassDefinition getSizedBoxBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: SizedBox,
    name: 'SizedBox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final width = namedArgs.getToDouble('width');
        final height = namedArgs.getToDouble('height');
        final child = visitor.toWidgets(namedArgs['child']);

        return SizedBox(key: key, width: width, height: height, child: child);
      },
      'expand': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        return SizedBox.expand(key: key, child: child);
      },
      'shrink': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        return SizedBox.shrink(key: key, child: child);
      },
      'square': (visitor, positionalArgs, namedArgs) {
        final dimension = positionalArgs.getToDouble(0);
        final key = namedArgs.get<Key?>('key');
        final child = visitor.toWidgets(namedArgs['child']);

        return SizedBox.square(key: key, dimension: dimension, child: child);
      },
    },
    getters: {
      'width': (visitor, target) => (target as SizedBox).width,
      'height': (visitor, target) => (target as SizedBox).height,
      'child': (visitor, target) => (target as SizedBox).child,
      'key': (visitor, target) => (target as SizedBox).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter Alignment class.
BridgedClassDefinition getAlignmentBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Alignment,
    name: 'Alignment',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final x = namedArgs.get<double>('x') ?? 0.0;
        final y = namedArgs.get<double>('y') ?? 0.0;
        return Alignment(x, y);
      },
    },
    getters: {
      'x': (visitor, target) => (target as Alignment).x,
      'y': (visitor, target) => (target as Alignment).y,
    },
    staticGetters: {
      'topLeft': (visitor) => Alignment.topLeft,
      'topCenter': (visitor) => Alignment.topCenter,
      'topRight': (visitor) => Alignment.topRight,
      'centerLeft': (visitor) => Alignment.centerLeft,
      'center': (visitor) => Alignment.center,
      'centerRight': (visitor) => Alignment.centerRight,
      'bottomLeft': (visitor) => Alignment.bottomLeft,
      'bottomCenter': (visitor) => Alignment.bottomCenter,
      'bottomRight': (visitor) => Alignment.bottomRight,
    },
    methods: {
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final textDirection = positionalArgs.get<TextDirection?>(0);
        return (target as Alignment).resolve(textDirection);
      },
      'add': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<AlignmentGeometry>(0);
        if (other != null) {
          return (target as Alignment).add(other);
        }
        return target;
      },
      'alongOffset': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Offset>(0);
        if (other != null) {
          return (target as Alignment).alongOffset(other);
        }
        return Offset.zero;
      },
      'alongSize': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Size>(0);
        if (other != null) {
          return (target as Alignment).alongSize(other);
        }
        return Offset.zero;
      },
      'withinRect': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0);
        if (rect != null) {
          return (target as Alignment).withinRect(rect);
        }
        return Offset.zero;
      },
      'inscribe': (visitor, target, positionalArgs, namedArgs) {
        final size = positionalArgs.get<Size>(0);
        final rect = positionalArgs.get<Rect>(1);
        if (size != null && rect != null) {
          return (target as Alignment).inscribe(size, rect);
        }
        return Rect.zero;
      },
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter AlignmentDirectional class.
BridgedClassDefinition getAlignmentDirectionalBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: AlignmentDirectional,
    name: 'AlignmentDirectional',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final start = namedArgs.get<double>('start') ?? 0.0;
        final y = namedArgs.get<double>('y') ?? 0.0;
        return AlignmentDirectional(start, y);
      },
    },
    getters: {
      'start': (visitor, target) => (target as AlignmentDirectional).start,
      'y': (visitor, target) => (target as AlignmentDirectional).y,
    },
    staticGetters: {
      'topStart': (visitor) => AlignmentDirectional.topStart,
      'topCenter': (visitor) => AlignmentDirectional.topCenter,
      'topEnd': (visitor) => AlignmentDirectional.topEnd,
      'centerStart': (visitor) => AlignmentDirectional.centerStart,
      'center': (visitor) => AlignmentDirectional.center,
      'centerEnd': (visitor) => AlignmentDirectional.centerEnd,
      'bottomStart': (visitor) => AlignmentDirectional.bottomStart,
      'bottomCenter': (visitor) => AlignmentDirectional.bottomCenter,
      'bottomEnd': (visitor) => AlignmentDirectional.bottomEnd,
    },
    methods: {
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final textDirection = positionalArgs.get<TextDirection?>(0);
        return (target as AlignmentDirectional).resolve(textDirection);
      },
      'add': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<AlignmentGeometry>(0);
        if (other != null) {
          return (target as AlignmentDirectional).add(other);
        }
        return target;
      },
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter FractionalOffset class.
BridgedClassDefinition getFractionalOffsetBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: FractionalOffset,
    name: 'FractionalOffset',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final dx = namedArgs.get<double>('dx') ?? 0.0;
        final dy = namedArgs.get<double>('dy') ?? 0.0;
        return FractionalOffset(dx, dy);
      },
      'fromOffsetAndSize': (visitor, positionalArgs, namedArgs) {
        final offset = positionalArgs.get<Offset>(0) ?? Offset.zero;
        final size = positionalArgs.get<Size>(1) ?? Size.zero;
        return FractionalOffset.fromOffsetAndSize(offset, size);
      },
      'fromOffsetAndRect': (visitor, positionalArgs, namedArgs) {
        final offset = positionalArgs.get<Offset>(0) ?? Offset.zero;
        final rect = positionalArgs.get<Rect>(1) ?? Rect.zero;
        return FractionalOffset.fromOffsetAndRect(offset, rect);
      },
      // FractionalOffsets prédéfinis
      'topLeft': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.topLeft,
      'topCenter': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.topCenter,
      'topRight': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.topRight,
      'centerLeft': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.centerLeft,
      'center': (visitor, positionalArgs, namedArgs) => FractionalOffset.center,
      'centerRight': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.centerRight,
      'bottomLeft': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.bottomLeft,
      'bottomCenter': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.bottomCenter,
      'bottomRight': (visitor, positionalArgs, namedArgs) =>
          FractionalOffset.bottomRight,
    },
    getters: {
      'dx': (visitor, target) => (target as FractionalOffset).dx,
      'dy': (visitor, target) => (target as FractionalOffset).dy,
    },
    methods: {
      'resolve': (visitor, target, positionalArgs, namedArgs) {
        final textDirection = positionalArgs.get<TextDirection?>(0);
        return (target as FractionalOffset).resolve(textDirection);
      },
      'add': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<AlignmentGeometry>(0);
        if (other != null) {
          return (target as FractionalOffset).add(other);
        }
        return target;
      },
      'alongOffset': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Offset>(0);
        if (other != null) {
          return (target as FractionalOffset).alongOffset(other);
        }
        return Offset.zero;
      },
      'alongSize': (visitor, target, positionalArgs, namedArgs) {
        final other = positionalArgs.get<Size>(0);
        if (other != null) {
          return (target as FractionalOffset).alongSize(other);
        }
        return Offset.zero;
      },
      'withinRect': (visitor, target, positionalArgs, namedArgs) {
        final rect = positionalArgs.get<Rect>(0);
        if (rect != null) {
          return (target as FractionalOffset).withinRect(rect);
        }
        return Offset.zero;
      },
      'inscribe': (visitor, target, positionalArgs, namedArgs) {
        final size = positionalArgs.get<Size>(0);
        final rect = positionalArgs.get<Rect>(1);
        if (size != null && rect != null) {
          return (target as FractionalOffset).inscribe(size, rect);
        }
        return Rect.zero;
      },
    },
  );
}
