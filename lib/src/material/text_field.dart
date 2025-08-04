import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

// Helper functions for callback handling
ValueChanged<String>? _handleStringCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return (String value) => callback.call(visitor, [value]);
  }
  return callback as ValueChanged<String>?;
}

/// Returns the BridgedClass for the Flutter TextField widget.
BridgedClass getTextFieldBridgingDefinition() {
  return BridgedClass(
    nativeType: TextField,
    name: 'TextField',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final controller = namedArgs.get<TextEditingController?>('controller');
        final decoration = namedArgs.get<InputDecoration?>('decoration');
        final style = namedArgs.get<TextStyle?>('style');
        final textAlign =
            namedArgs.get<TextAlign?>('textAlign') ?? TextAlign.start;
        final textDirection = namedArgs.get<TextDirection?>('textDirection');
        final readOnly = namedArgs.get<bool?>('readOnly') ?? false;
        final showCursor = namedArgs.get<bool?>('showCursor');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final obscureText = namedArgs.get<bool?>('obscureText') ?? false;
        final autocorrect = namedArgs.get<bool?>('autocorrect') ?? true;
        final maxLines = namedArgs.get<int?>('maxLines') ?? 1;
        final minLines = namedArgs.get<int?>('minLines');
        final maxLength = namedArgs.get<int?>('maxLength');
        final keyboardType = namedArgs.get<TextInputType?>('keyboardType');
        final textInputAction = namedArgs.get<TextInputAction?>(
          'textInputAction',
        );
        final textCapitalization =
            namedArgs.get<TextCapitalization?>('textCapitalization') ??
            TextCapitalization.none;
        final enabled = namedArgs.get<bool?>('enabled');
        final onChanged = _handleStringCallback(
          visitor,
          namedArgs['onChanged'],
        );
        final onSubmitted = _handleStringCallback(
          visitor,
          namedArgs['onSubmitted'],
        );
        final inputFormatters =
            visitor.toElements(namedArgs['inputFormatters']) as List?;

        return TextField(
          key: key,
          controller: controller,
          decoration: decoration,
          style: style,
          textAlign: textAlign,
          textDirection: textDirection,
          readOnly: readOnly,
          showCursor: showCursor,
          autofocus: autofocus,
          obscureText: obscureText,
          autocorrect: autocorrect,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          enabled: enabled,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          inputFormatters: inputFormatters?.cast(),
        );
      },
    },
    getters: {
      'controller': (visitor, target) => (target as TextField).controller,
      'decoration': (visitor, target) => (target as TextField).decoration,
      'style': (visitor, target) => (target as TextField).style,
      'textAlign': (visitor, target) => (target as TextField).textAlign,
      'textDirection': (visitor, target) => (target as TextField).textDirection,
      'readOnly': (visitor, target) => (target as TextField).readOnly,
      'showCursor': (visitor, target) => (target as TextField).showCursor,
      'autofocus': (visitor, target) => (target as TextField).autofocus,
      'obscureText': (visitor, target) => (target as TextField).obscureText,
      'autocorrect': (visitor, target) => (target as TextField).autocorrect,
      'maxLines': (visitor, target) => (target as TextField).maxLines,
      'minLines': (visitor, target) => (target as TextField).minLines,
      'maxLength': (visitor, target) => (target as TextField).maxLength,
      'keyboardType': (visitor, target) => (target as TextField).keyboardType,
      'textInputAction': (visitor, target) =>
          (target as TextField).textInputAction,
      'textCapitalization': (visitor, target) =>
          (target as TextField).textCapitalization,
      'enabled': (visitor, target) => (target as TextField).enabled,
      'onChanged': (visitor, target) => (target as TextField).onChanged,
      'onSubmitted': (visitor, target) => (target as TextField).onSubmitted,
      'inputFormatters': (visitor, target) =>
          (target as TextField).inputFormatters,
      'key': (visitor, target) => (target as TextField).key,
    },
  );
}
