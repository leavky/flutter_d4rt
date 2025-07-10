import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';

// Helper function for ValueChanged<bool?> callback handling
ValueChanged<bool?>? _handleNullableBoolValueCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (bool? value) => callback.call(visitor, [value]);
  }
  return callback as ValueChanged<bool?>?;
}

/// Returns the BridgedClassDefinition for the Flutter Checkbox widget.
BridgedClassDefinition getCheckboxBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Checkbox,
    name: 'Checkbox',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final value = namedArgs.get<bool?>('value');
        final tristate = namedArgs.get<bool?>('tristate') ?? false;
        final onChanged = _handleNullableBoolValueCallback(
          visitor,
          namedArgs['onChanged'],
        );
        final activeColor = namedArgs.get<Color?>('activeColor');
        final checkColor = namedArgs.get<Color?>('checkColor');
        final focusColor = namedArgs.get<Color?>('focusColor');
        final hoverColor = namedArgs.get<Color?>('hoverColor');
        final overlayColor = namedArgs.get<WidgetStateProperty<Color?>?>(
          'overlayColor',
        );
        final splashRadius = namedArgs.getToDouble('splashRadius');
        final materialTapTargetSize = namedArgs.get<MaterialTapTargetSize?>(
          'materialTapTargetSize',
        );
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final shape = namedArgs.get<OutlinedBorder?>('shape');
        final side = namedArgs.get<BorderSide?>('side');

        return Checkbox(
          key: key,
          value: value,
          tristate: tristate,
          onChanged: onChanged,
          activeColor: activeColor,
          checkColor: checkColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          materialTapTargetSize: materialTapTargetSize,
          visualDensity: visualDensity,
          focusNode: focusNode,
          autofocus: autofocus,
          shape: shape,
          side: side,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as Checkbox).value,
      'tristate': (visitor, target) => (target as Checkbox).tristate,
      'activeColor': (visitor, target) => (target as Checkbox).activeColor,
      'checkColor': (visitor, target) => (target as Checkbox).checkColor,
      'focusColor': (visitor, target) => (target as Checkbox).focusColor,
      'hoverColor': (visitor, target) => (target as Checkbox).hoverColor,
      'autofocus': (visitor, target) => (target as Checkbox).autofocus,
      'key': (visitor, target) => (target as Checkbox).key,
    },
  );
}
