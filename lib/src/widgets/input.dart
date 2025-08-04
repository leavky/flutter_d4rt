import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Input and focus management widgets bridging definitions

// Helper functions for callback handling
void Function(bool)? _handleBoolCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (bool value) => callback.call(visitor, [value]);
  }
  return callback as void Function(bool)?;
}

KeyEventResult Function(FocusNode, KeyEvent)? _handleKeyEventCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (FocusNode node, KeyEvent event) {
      final result = callback.call(visitor, [node, event]);
      return result as KeyEventResult;
    };
  }
  return callback as KeyEventResult Function(FocusNode, KeyEvent)?;
}

void Function(PointerDownEvent)? _handlePointerDownCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (PointerDownEvent event) => callback.call(visitor, [event]);
  }
  return callback as void Function(PointerDownEvent)?;
}

void Function(PointerMoveEvent)? _handlePointerMoveCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (PointerMoveEvent event) => callback.call(visitor, [event]);
  }
  return callback as void Function(PointerMoveEvent)?;
}

void Function(PointerUpEvent)? _handlePointerUpCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (PointerUpEvent event) => callback.call(visitor, [event]);
  }
  return callback as void Function(PointerUpEvent)?;
}

void Function(PointerHoverEvent)? _handlePointerHoverCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (PointerHoverEvent event) => callback.call(visitor, [event]);
  }
  return callback as void Function(PointerHoverEvent)?;
}

void Function(PointerCancelEvent)? _handlePointerCancelCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (PointerCancelEvent event) => callback.call(visitor, [event]);
  }
  return callback as void Function(PointerCancelEvent)?;
}

void Function(PointerPanZoomStartEvent)? _handlePointerPanZoomStartCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (PointerPanZoomStartEvent event) => callback.call(visitor, [event]);
  }
  return callback as void Function(PointerPanZoomStartEvent)?;
}

void Function(PointerPanZoomUpdateEvent)? _handlePointerPanZoomUpdateCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (PointerPanZoomUpdateEvent event) => callback.call(visitor, [event]);
  }
  return callback as void Function(PointerPanZoomUpdateEvent)?;
}

void Function(PointerPanZoomEndEvent)? _handlePointerPanZoomEndCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (PointerPanZoomEndEvent event) => callback.call(visitor, [event]);
  }
  return callback as void Function(PointerPanZoomEndEvent)?;
}

void Function(PointerSignalEvent)? _handlePointerSignalCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (PointerSignalEvent event) => callback.call(visitor, [event]);
  }
  return callback as void Function(PointerSignalEvent)?;
}

void Function(PointerEnterEvent)? _handlePointerEnterCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (PointerEnterEvent event) => callback.call(visitor, [event]);
  }
  return callback as void Function(PointerEnterEvent)?;
}

void Function(PointerExitEvent)? _handlePointerExitCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (PointerExitEvent event) => callback.call(visitor, [event]);
  }
  return callback as void Function(PointerExitEvent)?;
}

// Focus bridging
BridgedClass getFocusBridgingDefinition() {
  return BridgedClass(
    nativeType: Focus,
    name: 'Focus',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Focus(
          key: namedArgs.get<Key?>('key'),
          focusNode: namedArgs['focusNode'] as FocusNode?,
          autofocus: namedArgs['autofocus'] as bool? ?? false,
          onFocusChange: _handleBoolCallback(
            visitor,
            namedArgs['onFocusChange'],
          ),
          onKeyEvent: _handleKeyEventCallback(visitor, namedArgs['onKeyEvent']),
          canRequestFocus: namedArgs['canRequestFocus'] as bool? ?? true,
          skipTraversal: namedArgs['skipTraversal'] as bool? ?? false,
          includeSemantics: namedArgs['includeSemantics'] as bool? ?? true,
          debugLabel: namedArgs['debugLabel'] as String?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        return Focus.of(context);
      },
      'maybeOf': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        return Focus.maybeOf(context);
      },
    },
  );
}

// FocusScope bridging
BridgedClass getFocusScopeBridgingDefinition() {
  return BridgedClass(
    nativeType: FocusScope,
    name: 'FocusScope',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return FocusScope(
          key: namedArgs.get<Key?>('key'),
          node: namedArgs['node'] as FocusScopeNode?,
          autofocus: namedArgs['autofocus'] as bool? ?? false,
          onFocusChange: _handleBoolCallback(
            visitor,
            namedArgs['onFocusChange'],
          ),
          canRequestFocus: namedArgs['canRequestFocus'] as bool? ?? true,
          skipTraversal: namedArgs['skipTraversal'] as bool? ?? false,
          includeSemantics: namedArgs['includeSemantics'] as bool? ?? true,
          debugLabel: namedArgs['debugLabel'] as String?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
    staticMethods: {
      'of': (visitor, positionalArgs, namedArgs) {
        final context = positionalArgs[0] as BuildContext;
        return FocusScope.of(context);
      },
    },
  );
}

// Listener bridging
BridgedClass getListenerBridgingDefinition() {
  return BridgedClass(
    nativeType: Listener,
    name: 'Listener',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return Listener(
          key: namedArgs.get<Key?>('key'),
          onPointerDown: _handlePointerDownCallback(
            visitor,
            namedArgs['onPointerDown'],
          ),
          onPointerMove: _handlePointerMoveCallback(
            visitor,
            namedArgs['onPointerMove'],
          ),
          onPointerUp: _handlePointerUpCallback(
            visitor,
            namedArgs['onPointerUp'],
          ),
          onPointerHover: _handlePointerHoverCallback(
            visitor,
            namedArgs['onPointerHover'],
          ),
          onPointerCancel: _handlePointerCancelCallback(
            visitor,
            namedArgs['onPointerCancel'],
          ),
          onPointerPanZoomStart: _handlePointerPanZoomStartCallback(
            visitor,
            namedArgs['onPointerPanZoomStart'],
          ),
          onPointerPanZoomUpdate: _handlePointerPanZoomUpdateCallback(
            visitor,
            namedArgs['onPointerPanZoomUpdate'],
          ),
          onPointerPanZoomEnd: _handlePointerPanZoomEndCallback(
            visitor,
            namedArgs['onPointerPanZoomEnd'],
          ),
          onPointerSignal: _handlePointerSignalCallback(
            visitor,
            namedArgs['onPointerSignal'],
          ),
          behavior:
              namedArgs['behavior'] as HitTestBehavior? ??
              HitTestBehavior.deferToChild,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// MouseRegion bridging
BridgedClass getMouseRegionBridgingDefinition() {
  return BridgedClass(
    nativeType: MouseRegion,
    name: 'MouseRegion',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return MouseRegion(
          key: namedArgs.get<Key?>('key'),
          onEnter: _handlePointerEnterCallback(visitor, namedArgs['onEnter']),
          onExit: _handlePointerExitCallback(visitor, namedArgs['onExit']),
          onHover: _handlePointerHoverCallback(visitor, namedArgs['onHover']),
          cursor: namedArgs['cursor'] as MouseCursor? ?? MouseCursor.defer,
          opaque: namedArgs['opaque'] as bool? ?? true,
          hitTestBehavior: namedArgs['hitTestBehavior'] as HitTestBehavior?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// AbsorbPointer bridging
BridgedClass getAbsorbPointerBridgingDefinition() {
  return BridgedClass(
    nativeType: AbsorbPointer,
    name: 'AbsorbPointer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return AbsorbPointer(
          key: namedArgs.get<Key?>('key'),
          absorbing: namedArgs['absorbing'] as bool? ?? true,
          ignoringSemantics: namedArgs['ignoringSemantics'] as bool?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}

// IgnorePointer bridging
BridgedClass getIgnorePointerBridgingDefinition() {
  return BridgedClass(
    nativeType: IgnorePointer,
    name: 'IgnorePointer',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return IgnorePointer(
          key: namedArgs.get<Key?>('key'),
          ignoring: namedArgs['ignoring'] as bool? ?? true,
          ignoringSemantics: namedArgs['ignoringSemantics'] as bool?,
          child: visitor.toWidgets(namedArgs['child']),
        );
      },
    },
  );
}
