import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Gesture and interaction widgets bridging definitions

// Helper functions for callback handling
void Function()? _handleVoidCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return () => callback.call(visitor, []);
  }
  return callback as void Function()?;
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
          behavior:
              namedArgs['behavior'] as HitTestBehavior? ??
              HitTestBehavior.deferToChild,
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

// InkResponse bridging
BridgedClassDefinition getInkResponseBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: InkResponse,
    name: 'InkResponse',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return InkResponse(
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
          onDoubleTap: _handleVoidCallback(visitor, namedArgs['onDoubleTap']),
          onLongPress: _handleVoidCallback(visitor, namedArgs['onLongPress']),
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
          containedInkWell: namedArgs['containedInkWell'] as bool? ?? false,
          highlightShape:
              namedArgs['highlightShape'] as BoxShape? ?? BoxShape.circle,
          radius: namedArgs['radius'] as double?,
          borderRadius: namedArgs['borderRadius'] as BorderRadius?,
          customBorder: namedArgs['customBorder'] as ShapeBorder?,
          focusColor: namedArgs['focusColor'] as Color?,
          hoverColor: namedArgs['hoverColor'] as Color?,
          highlightColor: namedArgs['highlightColor'] as Color?,
          overlayColor:
              namedArgs['overlayColor'] as WidgetStateProperty<Color?>?,
          splashColor: namedArgs['splashColor'] as Color?,
          splashFactory:
              namedArgs['splashFactory'] as InteractiveInkFeatureFactory?,
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

// Draggable bridging
BridgedClassDefinition getDraggableBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Draggable,
    name: 'Draggable',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Draggable(
          key: namedArgs.get<Key?>('key'),
          feedback:
              visitor.toWidgets(namedArgs['feedback']) ??
              const SizedBox.shrink(),
          data: namedArgs['data'],
          axis: namedArgs['axis'] as Axis?,
          childWhenDragging: visitor.toWidgets(namedArgs['childWhenDragging']),
          feedbackOffset: namedArgs['feedbackOffset'] as Offset? ?? Offset.zero,
          dragAnchorStrategy:
              namedArgs['dragAnchorStrategy'] as DragAnchorStrategy? ??
              childDragAnchorStrategy,
          affinity: namedArgs['affinity'] as Axis?,
          maxSimultaneousDrags: namedArgs['maxSimultaneousDrags'] as int?,
          onDragStarted: _handleVoidCallback(
            visitor,
            namedArgs['onDragStarted'],
          ),
          onDragUpdate: _handleParameterCallback<DragUpdateDetails>(
            visitor,
            namedArgs['onDragUpdate'],
          ),
          onDraggableCanceled: (() {
            if (namedArgs['onDraggableCanceled'] == null) return null;
            if (namedArgs['onDraggableCanceled'] is InterpretedFunction) {
              final func =
                  namedArgs['onDraggableCanceled'] as InterpretedFunction;
              return (Velocity velocity, Offset offset) =>
                  func.call(visitor, [velocity, offset]);
            }
            return namedArgs['onDraggableCanceled']
                as void Function(Velocity, Offset)?;
          })(),
          onDragEnd: _handleParameterCallback<DraggableDetails>(
            visitor,
            namedArgs['onDragEnd'],
          ),
          onDragCompleted: _handleVoidCallback(
            visitor,
            namedArgs['onDragCompleted'],
          ),
          ignoringFeedbackSemantics:
              namedArgs['ignoringFeedbackSemantics'] as bool? ?? true,
          ignoringFeedbackPointer:
              namedArgs['ignoringFeedbackPointer'] as bool? ?? true,
          rootOverlay: namedArgs['rootOverlay'] as bool? ?? false,
          hitTestBehavior:
              namedArgs['hitTestBehavior'] as HitTestBehavior? ??
              HitTestBehavior.deferToChild,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// DragTarget bridging
BridgedClassDefinition getDragTargetBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: DragTarget,
    name: 'DragTarget',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return DragTarget(
          key: namedArgs.get<Key?>('key'),
          builder: (context, candidateData, rejectedData) {
            final builderFunction = namedArgs['builder'];
            if (builderFunction is InterpretedFunction) {
              final result = builderFunction.call(visitor, [
                context,
                candidateData,
                rejectedData,
              ]);
              return visitor.toWidgets(result) ?? const SizedBox.shrink();
            }
            return Container(); // Default fallback
          },
          // onWillAccept: (() {
          //   if (namedArgs['onWillAccept'] == null) return null;
          //   if (namedArgs['onWillAccept'] is InterpretedFunction) {
          //     final func = namedArgs['onWillAccept'] as InterpretedFunction;
          //     return (dynamic data) {
          //       final result = func.call(visitor, [data]);
          //       return result as bool?;
          //     };
          //   }
          //   return namedArgs['onWillAccept'] as bool Function(dynamic)?;
          // })(),
          // onAccept: (() {
          //   if (namedArgs['onAccept'] == null) return null;
          //   if (namedArgs['onAccept'] is InterpretedFunction) {
          //     final func = namedArgs['onAccept'] as InterpretedFunction;
          //     return (dynamic data) => func.call(visitor, [data]);
          //   }
          //   return namedArgs['onAccept'] as void Function(dynamic)?;
          // })(),
          onAcceptWithDetails: (() {
            if (namedArgs['onAcceptWithDetails'] == null) return null;
            if (namedArgs['onAcceptWithDetails'] is InterpretedFunction) {
              final func =
                  namedArgs['onAcceptWithDetails'] as InterpretedFunction;
              return (DragTargetDetails details) =>
                  func.call(visitor, [details]);
            }
            return namedArgs['onAcceptWithDetails']
                as void Function(DragTargetDetails)?;
          })(),
          onLeave: (() {
            if (namedArgs['onLeave'] == null) return null;
            if (namedArgs['onLeave'] is InterpretedFunction) {
              final func = namedArgs['onLeave'] as InterpretedFunction;
              return (dynamic data) => func.call(visitor, [data]);
            }
            return namedArgs['onLeave'] as void Function(dynamic)?;
          })(),
          onMove: _handleParameterCallback<DragTargetDetails>(
            visitor,
            namedArgs['onMove'],
          ),
          hitTestBehavior:
              namedArgs['hitTestBehavior'] as HitTestBehavior? ??
              HitTestBehavior.translucent,
        );
      },
    },
  );
}

// LongPressDraggable bridging
BridgedClassDefinition getLongPressDraggableBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: LongPressDraggable,
    name: 'LongPressDraggable',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return LongPressDraggable(
          key: namedArgs.get<Key?>('key'),
          feedback:
              visitor.toWidgets(namedArgs['feedback']) ??
              const SizedBox.shrink(),
          data: namedArgs['data'],
          axis: namedArgs['axis'] as Axis?,
          childWhenDragging: visitor.toWidgets(namedArgs['childWhenDragging']),
          feedbackOffset: namedArgs['feedbackOffset'] as Offset? ?? Offset.zero,
          dragAnchorStrategy:
              namedArgs['dragAnchorStrategy'] as DragAnchorStrategy? ??
              childDragAnchorStrategy,
          maxSimultaneousDrags: namedArgs['maxSimultaneousDrags'] as int?,
          onDragStarted: _handleVoidCallback(
            visitor,
            namedArgs['onDragStarted'],
          ),
          onDragUpdate: _handleParameterCallback<DragUpdateDetails>(
            visitor,
            namedArgs['onDragUpdate'],
          ),
          onDraggableCanceled: (() {
            if (namedArgs['onDraggableCanceled'] == null) return null;
            if (namedArgs['onDraggableCanceled'] is InterpretedFunction) {
              final func =
                  namedArgs['onDraggableCanceled'] as InterpretedFunction;
              return (Velocity velocity, Offset offset) =>
                  func.call(visitor, [velocity, offset]);
            }
            return namedArgs['onDraggableCanceled']
                as void Function(Velocity, Offset)?;
          })(),
          onDragEnd: _handleParameterCallback<DraggableDetails>(
            visitor,
            namedArgs['onDragEnd'],
          ),
          onDragCompleted: _handleVoidCallback(
            visitor,
            namedArgs['onDragCompleted'],
          ),
          hapticFeedbackOnStart:
              namedArgs['hapticFeedbackOnStart'] as bool? ?? true,
          ignoringFeedbackSemantics:
              namedArgs['ignoringFeedbackSemantics'] as bool? ?? true,
          ignoringFeedbackPointer:
              namedArgs['ignoringFeedbackPointer'] as bool? ?? true,
          delay: namedArgs['delay'] as Duration? ?? kLongPressTimeout,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}
