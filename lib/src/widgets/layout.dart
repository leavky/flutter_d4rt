import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClassDefinition for the Flutter Wrap widget.
BridgedClassDefinition getWrapBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Wrap,
    name: 'Wrap',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final direction = namedArgs.get<Axis?>('direction') ?? Axis.horizontal;
        final alignment =
            namedArgs.get<WrapAlignment?>('alignment') ?? WrapAlignment.start;
        final spacing = namedArgs.getToDouble('spacing') ?? 0.0;
        final runAlignment =
            namedArgs.get<WrapAlignment?>('runAlignment') ??
            WrapAlignment.start;
        final runSpacing = namedArgs.getToDouble('runSpacing') ?? 0.0;
        final crossAxisAlignment =
            namedArgs.get<WrapCrossAlignment?>('crossAxisAlignment') ??
            WrapCrossAlignment.start;
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final verticalDirection =
            namedArgs.get<VerticalDirection?>('verticalDirection') ??
            VerticalDirection.down;
        final clipBehavior = namedArgs.get<Clip?>('clipBehavior') ?? Clip.none;
        final children = visitor.toWidgets(namedArgs['children']);

        return Wrap(
          key: key,
          direction: direction,
          alignment: alignment,
          spacing: spacing,
          runAlignment: runAlignment,
          runSpacing: runSpacing,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          clipBehavior: clipBehavior,
          children: children,
        );
      },
    },
    getters: {
      'direction': (visitor, target) => (target as Wrap).direction,
      'alignment': (visitor, target) => (target as Wrap).alignment,
      'spacing': (visitor, target) => (target as Wrap).spacing,
      'runAlignment': (visitor, target) => (target as Wrap).runAlignment,
      'runSpacing': (visitor, target) => (target as Wrap).runSpacing,
      'crossAxisAlignment': (visitor, target) =>
          (target as Wrap).crossAxisAlignment,
      'children': (visitor, target) => (target as Wrap).children,
      'key': (visitor, target) => (target as Wrap).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter GridView widget.
BridgedClassDefinition getGridViewBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: GridView,
    name: 'GridView',
    constructors: {
      'count': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final crossAxisCount = namedArgs.get<int>('crossAxisCount') ?? 2;
        final mainAxisSpacing = namedArgs.getToDouble('mainAxisSpacing') ?? 0.0;
        final crossAxisSpacing =
            namedArgs.getToDouble('crossAxisSpacing') ?? 0.0;
        final childAspectRatio =
            namedArgs.getToDouble('childAspectRatio') ?? 1.0;
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final scrollDirection =
            namedArgs.get<Axis?>('scrollDirection') ?? Axis.vertical;
        final reverse = namedArgs.get<bool?>('reverse') ?? false;
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final shrinkWrap = namedArgs.get<bool?>('shrinkWrap') ?? false;
        final primary = namedArgs.get<bool?>('primary');

        final children = visitor.toWidgets(namedArgs['children']);

        return GridView.count(
          key: key,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
          padding: padding,
          scrollDirection: scrollDirection,
          reverse: reverse,
          physics: physics,
          shrinkWrap: shrinkWrap,
          primary: primary,
          children: children,
        );
      },
      'extent': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final maxCrossAxisExtent =
            namedArgs.get<double>('maxCrossAxisExtent') ?? 200.0;
        final mainAxisSpacing = namedArgs.getToDouble('mainAxisSpacing') ?? 0.0;
        final crossAxisSpacing =
            namedArgs.getToDouble('crossAxisSpacing') ?? 0.0;
        final childAspectRatio =
            namedArgs.getToDouble('childAspectRatio') ?? 1.0;
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final scrollDirection =
            namedArgs.get<Axis?>('scrollDirection') ?? Axis.vertical;
        final reverse = namedArgs.get<bool?>('reverse') ?? false;
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final shrinkWrap = namedArgs.get<bool?>('shrinkWrap') ?? false;
        final primary = namedArgs.get<bool?>('primary');
        final children = visitor.toWidgets(namedArgs['children']);

        return GridView.extent(
          key: key,
          maxCrossAxisExtent: maxCrossAxisExtent,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
          padding: padding,
          scrollDirection: scrollDirection,
          reverse: reverse,
          physics: physics,
          shrinkWrap: shrinkWrap,
          primary: primary,
          children: children,
        );
      },
    },
    getters: {
      'scrollDirection': (visitor, target) =>
          (target as GridView).scrollDirection,
      'reverse': (visitor, target) => (target as GridView).reverse,
      'physics': (visitor, target) => (target as GridView).physics,
      'shrinkWrap': (visitor, target) => (target as GridView).shrinkWrap,
      'padding': (visitor, target) => (target as GridView).padding,
      'key': (visitor, target) => (target as GridView).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter ListView widget.
BridgedClassDefinition getListViewBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ListView,
    name: 'ListView',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final scrollDirection =
            namedArgs.get<Axis?>('scrollDirection') ?? Axis.vertical;
        final reverse = namedArgs.get<bool?>('reverse') ?? false;
        final physics = namedArgs.get<ScrollPhysics?>('physics');
        final shrinkWrap = namedArgs.get<bool?>('shrinkWrap') ?? false;
        final padding = namedArgs.get<EdgeInsetsGeometry?>('padding');
        final itemExtent = namedArgs.getToDouble('itemExtent');
        final prototypeItem = visitor.toWidgets(namedArgs['prototypeItem']);
        final addAutomaticKeepAlives =
            namedArgs.get<bool?>('addAutomaticKeepAlives') ?? true;
        final addRepaintBoundaries =
            namedArgs.get<bool?>('addRepaintBoundaries') ?? true;
        final addSemanticIndexes =
            namedArgs.get<bool?>('addSemanticIndexes') ?? true;
        final cacheExtent = namedArgs.getToDouble('cacheExtent');
        final semanticChildCount = namedArgs.get<int?>('semanticChildCount');
        final dragStartBehavior =
            namedArgs.get<DragStartBehavior?>('dragStartBehavior') ??
            DragStartBehavior.start;
        final keyboardDismissBehavior =
            namedArgs.get<ScrollViewKeyboardDismissBehavior?>(
              'keyboardDismissBehavior',
            ) ??
            ScrollViewKeyboardDismissBehavior.manual;
        final restorationId = namedArgs.get<String?>('restorationId');
        final clipBehavior =
            namedArgs.get<Clip?>('clipBehavior') ?? Clip.hardEdge;
        final children = visitor.toWidgets(namedArgs['children']);

        return ListView(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
          children: children,
        );
      },
    },
    getters: {
      'scrollDirection': (visitor, target) =>
          (target as ListView).scrollDirection,
      'reverse': (visitor, target) => (target as ListView).reverse,
      'physics': (visitor, target) => (target as ListView).physics,
      'shrinkWrap': (visitor, target) => (target as ListView).shrinkWrap,
      'padding': (visitor, target) => (target as ListView).padding,
      'itemExtent': (visitor, target) => (target as ListView).itemExtent,
      'key': (visitor, target) => (target as ListView).key,
    },
  );
}
