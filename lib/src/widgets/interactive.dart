import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Interactive widgets bridging definitions

// Helper functions for callback handling
void Function()? _handleVoidCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return () => callback.call(visitor, []);
  }
  return callback as void Function();
}

void Function(T)? _handleParameterCallback<T>(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (T details) => callback.call(visitor, [details]);
  }
  return callback as void Function(T)?;
}

Future<bool?> Function(T)? _handleAsyncCallback<T>(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (T details) async {
      final result = callback.call(visitor, [details]);
      return result is Future ? await result : result;
    };
  }
  return callback as Future<bool?> Function(T)?;
}

// GestureDetector bridging
BridgedClassDefinition getGestureDetectorBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: GestureDetector,
    name: 'GestureDetector',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return GestureDetector(
          key: namedArgs.get<Key?>('key'),
          onTap: _handleVoidCallback(visitor, namedArgs['onTap']),
          onTapDown: _handleParameterCallback<TapDownDetails>(
            visitor,
            namedArgs['onTapDown'],
          ),
          onTapUp: _handleParameterCallback<TapUpDetails>(
            visitor,
            namedArgs['onTapUp'],
          ),
          onTapCancel: _handleVoidCallback(visitor, namedArgs['onTapCancel']),
          onSecondaryTap: _handleVoidCallback(
            visitor,
            namedArgs['onSecondaryTap'],
          ),
          onSecondaryTapDown: _handleParameterCallback<TapDownDetails>(
            visitor,
            namedArgs['onSecondaryTapDown'],
          ),
          onSecondaryTapUp: _handleParameterCallback<TapUpDetails>(
            visitor,
            namedArgs['onSecondaryTapUp'],
          ),
          onSecondaryTapCancel: _handleVoidCallback(
            visitor,
            namedArgs['onSecondaryTapCancel'],
          ),
          onTertiaryTapDown: _handleParameterCallback<TapDownDetails>(
            visitor,
            namedArgs['onTertiaryTapDown'],
          ),
          onTertiaryTapUp: _handleParameterCallback<TapUpDetails>(
            visitor,
            namedArgs['onTertiaryTapUp'],
          ),
          onTertiaryTapCancel: _handleVoidCallback(
            visitor,
            namedArgs['onTertiaryTapCancel'],
          ),
          onDoubleTapDown: _handleParameterCallback<TapDownDetails>(
            visitor,
            namedArgs['onDoubleTapDown'],
          ),
          onDoubleTap: _handleVoidCallback(visitor, namedArgs['onDoubleTap']),
          onDoubleTapCancel: _handleVoidCallback(
            visitor,
            namedArgs['onDoubleTapCancel'],
          ),
          onLongPress: _handleVoidCallback(visitor, namedArgs['onLongPress']),
          onLongPressStart: _handleParameterCallback<LongPressStartDetails>(
            visitor,
            namedArgs['onLongPressStart'],
          ),
          onLongPressMoveUpdate:
              _handleParameterCallback<LongPressMoveUpdateDetails>(
                visitor,
                namedArgs['onLongPressMoveUpdate'],
              ),
          onLongPressUp: _handleVoidCallback(
            visitor,
            namedArgs['onLongPressUp'],
          ),
          onLongPressEnd: _handleParameterCallback<LongPressEndDetails>(
            visitor,
            namedArgs['onLongPressEnd'],
          ),
          onVerticalDragDown: _handleParameterCallback<DragDownDetails>(
            visitor,
            namedArgs['onVerticalDragDown'],
          ),
          onVerticalDragStart: _handleParameterCallback<DragStartDetails>(
            visitor,
            namedArgs['onVerticalDragStart'],
          ),
          onVerticalDragUpdate: _handleParameterCallback<DragUpdateDetails>(
            visitor,
            namedArgs['onVerticalDragUpdate'],
          ),
          onVerticalDragEnd: _handleParameterCallback<DragEndDetails>(
            visitor,
            namedArgs['onVerticalDragEnd'],
          ),
          onVerticalDragCancel: _handleVoidCallback(
            visitor,
            namedArgs['onVerticalDragCancel'],
          ),
          onHorizontalDragDown: _handleParameterCallback<DragDownDetails>(
            visitor,
            namedArgs['onHorizontalDragDown'],
          ),
          onHorizontalDragStart: _handleParameterCallback<DragStartDetails>(
            visitor,
            namedArgs['onHorizontalDragStart'],
          ),
          onHorizontalDragUpdate: _handleParameterCallback<DragUpdateDetails>(
            visitor,
            namedArgs['onHorizontalDragUpdate'],
          ),
          onHorizontalDragEnd: _handleParameterCallback<DragEndDetails>(
            visitor,
            namedArgs['onHorizontalDragEnd'],
          ),
          onHorizontalDragCancel: _handleVoidCallback(
            visitor,
            namedArgs['onHorizontalDragCancel'],
          ),
          onPanDown: _handleParameterCallback<DragDownDetails>(
            visitor,
            namedArgs['onPanDown'],
          ),
          onPanStart: _handleParameterCallback<DragStartDetails>(
            visitor,
            namedArgs['onPanStart'],
          ),
          onPanUpdate: _handleParameterCallback<DragUpdateDetails>(
            visitor,
            namedArgs['onPanUpdate'],
          ),
          onPanEnd: _handleParameterCallback<DragEndDetails>(
            visitor,
            namedArgs['onPanEnd'],
          ),
          onPanCancel: _handleVoidCallback(visitor, namedArgs['onPanCancel']),
          onScaleStart: _handleParameterCallback<ScaleStartDetails>(
            visitor,
            namedArgs['onScaleStart'],
          ),
          onScaleUpdate: _handleParameterCallback<ScaleUpdateDetails>(
            visitor,
            namedArgs['onScaleUpdate'],
          ),
          onScaleEnd: _handleParameterCallback<ScaleEndDetails>(
            visitor,
            namedArgs['onScaleEnd'],
          ),
          behavior: namedArgs['behavior'] as HitTestBehavior?,
          excludeFromSemantics:
              namedArgs['excludeFromSemantics'] as bool? ?? false,
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// InkWell bridging
BridgedClassDefinition getInkWellBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: InkWell,
    name: 'InkWell',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return InkWell(
          key: namedArgs.get<Key?>('key'),
          onTap: _handleVoidCallback(visitor, namedArgs['onTap']),
          onDoubleTap: _handleVoidCallback(visitor, namedArgs['onDoubleTap']),
          onLongPress: _handleVoidCallback(visitor, namedArgs['onLongPress']),
          onTapDown: _handleParameterCallback<TapDownDetails>(
            visitor,
            namedArgs['onTapDown'],
          ),
          onTapUp: _handleParameterCallback<TapUpDetails>(
            visitor,
            namedArgs['onTapUp'],
          ),
          onTapCancel: _handleVoidCallback(visitor, namedArgs['onTapCancel']),
          onHighlightChanged: _handleParameterCallback<bool>(
            visitor,
            namedArgs['onHighlightChanged'],
          ),
          onHover: _handleParameterCallback<bool>(
            visitor,
            namedArgs['onHover'],
          ),
          onFocusChange: _handleParameterCallback<bool>(
            visitor,
            namedArgs['onFocusChange'],
          ),
          mouseCursor: namedArgs['mouseCursor'] as MouseCursor?,
          focusColor: namedArgs['focusColor'] as Color?,
          hoverColor: namedArgs['hoverColor'] as Color?,
          highlightColor: namedArgs['highlightColor'] as Color?,
          overlayColor:
              namedArgs['overlayColor'] as WidgetStateProperty<Color?>?,
          splashColor: namedArgs['splashColor'] as Color?,
          splashFactory:
              namedArgs['splashFactory'] as InteractiveInkFeatureFactory?,
          radius: namedArgs['radius'] as double?,
          borderRadius: namedArgs['borderRadius'] as BorderRadius?,
          customBorder: namedArgs['customBorder'] as ShapeBorder?,
          enableFeedback: namedArgs['enableFeedback'] as bool? ?? true,
          excludeFromSemantics:
              namedArgs['excludeFromSemantics'] as bool? ?? false,
          focusNode: namedArgs['focusNode'] as FocusNode?,
          canRequestFocus: namedArgs['canRequestFocus'] as bool? ?? true,
          autofocus: namedArgs['autofocus'] as bool? ?? false,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// Dismissible bridging
BridgedClassDefinition getDismissibleBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Dismissible,
    name: 'Dismissible',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Dismissible(
          key: namedArgs.get<Key?>('key') as Key,
          background: visitor.toWidgets(namedArgs['background']),
          secondaryBackground: visitor.toWidgets(
            namedArgs['secondaryBackground'],
          ),
          onResize: _handleVoidCallback(visitor, namedArgs['onResize']),
          onUpdate: _handleParameterCallback<DismissUpdateDetails>(
            visitor,
            namedArgs['onUpdate'],
          ),
          onDismissed: _handleParameterCallback<DismissDirection>(
            visitor,
            namedArgs['onDismissed'],
          ),
          confirmDismiss: _handleAsyncCallback<DismissDirection>(
            visitor,
            namedArgs['confirmDismiss'],
          ),
          direction:
              namedArgs['direction'] as DismissDirection? ??
              DismissDirection.horizontal,
          resizeDuration:
              namedArgs['resizeDuration'] as Duration? ??
              const Duration(milliseconds: 300),
          dismissThresholds:
              namedArgs['dismissThresholds']
                  as Map<DismissDirection, double>? ??
              const <DismissDirection, double>{},
          movementDuration:
              namedArgs['movementDuration'] as Duration? ??
              const Duration(milliseconds: 200),
          crossAxisEndOffset: namedArgs['crossAxisEndOffset'] as double? ?? 0.0,
          dragStartBehavior:
              namedArgs['dragStartBehavior'] as DragStartBehavior? ??
              DragStartBehavior.start,
          behavior:
              namedArgs['behavior'] as HitTestBehavior? ??
              HitTestBehavior.opaque,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}
