import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/map.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

// Helper functions for callback handling
GestureTapCallback? _handleGestureTapCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return () => callback.call(visitor, []);
  }
  return callback as GestureTapCallback?;
}

GestureLongPressCallback? _handleGestureLongPressCallback(
  InterpreterVisitor visitor,
  dynamic callback,
) {
  if (callback == null) return null;
  if (callback is InterpretedFunction) {
    return () => callback.call(visitor, []);
  }
  return callback as GestureLongPressCallback?;
}

/// Returns the BridgedClassDefinition for the Flutter ListTile widget.
BridgedClassDefinition getListTileBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ListTile,
    name: 'ListTile',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final leading = visitor.toWidgets(namedArgs['leading']);
        final trailing = visitor.toWidgets(namedArgs['trailing']);
        final isThreeLine = namedArgs.get<bool?>('isThreeLine') ?? false;
        final dense = namedArgs.get<bool?>('dense');
        final visualDensity = namedArgs.get<VisualDensity?>('visualDensity');
        final shape = namedArgs.get<ShapeBorder?>('shape');
        final contentPadding = namedArgs.get<EdgeInsetsGeometry?>(
          'contentPadding',
        );
        final enabled = namedArgs.get<bool?>('enabled') ?? true;
        final onTap = _handleGestureTapCallback(visitor, namedArgs['onTap']);
        final onLongPress = _handleGestureLongPressCallback(
          visitor,
          namedArgs['onLongPress'],
        );
        final mouseCursor = namedArgs.get<MouseCursor?>('mouseCursor');
        final selected = namedArgs.get<bool?>('selected') ?? false;
        final focusColor = namedArgs.get<Color?>('focusColor');
        final hoverColor = namedArgs.get<Color?>('hoverColor');
        final splashColor = namedArgs.get<Color?>('splashColor');
        final tileColor = namedArgs.get<Color?>('tileColor');
        final selectedTileColor = namedArgs.get<Color?>('selectedTileColor');
        final enableFeedback = namedArgs.get<bool?>('enableFeedback');
        final horizontalTitleGap = namedArgs.getToDouble('horizontalTitleGap');
        final minVerticalPadding = namedArgs.getToDouble('minVerticalPadding');
        final minLeadingWidth = namedArgs.getToDouble('minLeadingWidth');
        final focusNode = namedArgs.get<FocusNode?>('focusNode');
        final autofocus = namedArgs.get<bool?>('autofocus') ?? false;
        final title = visitor.toWidgets(namedArgs['title']);
        final subtitle = visitor.toWidgets(namedArgs['subtitle']);

        return ListTile(
          key: key,
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          isThreeLine: isThreeLine,
          dense: dense,
          visualDensity: visualDensity,
          shape: shape,
          contentPadding: contentPadding,
          enabled: enabled,
          onTap: onTap,
          onLongPress: onLongPress,
          mouseCursor: mouseCursor,
          selected: selected,
          focusColor: focusColor,
          hoverColor: hoverColor,
          splashColor: splashColor,
          tileColor: tileColor,
          selectedTileColor: selectedTileColor,
          enableFeedback: enableFeedback,
          horizontalTitleGap: horizontalTitleGap,
          minVerticalPadding: minVerticalPadding,
          minLeadingWidth: minLeadingWidth,
          focusNode: focusNode,
          autofocus: autofocus,
        );
      },
    },
    getters: {
      'leading': (visitor, target) => (target as ListTile).leading,
      'title': (visitor, target) => (target as ListTile).title,
      'subtitle': (visitor, target) => (target as ListTile).subtitle,
      'trailing': (visitor, target) => (target as ListTile).trailing,
      'isThreeLine': (visitor, target) => (target as ListTile).isThreeLine,
      'dense': (visitor, target) => (target as ListTile).dense,
      'contentPadding': (visitor, target) =>
          (target as ListTile).contentPadding,
      'enabled': (visitor, target) => (target as ListTile).enabled,
      'selected': (visitor, target) => (target as ListTile).selected,
      'autofocus': (visitor, target) => (target as ListTile).autofocus,
      'key': (visitor, target) => (target as ListTile).key,
    },
  );
}

BridgedEnumDefinition getListTileStyleBridgingDefinition() {
  return BridgedEnumDefinition<ListTileStyle>(
    name: 'ListTileStyle',
    values: ListTileStyle.values,
    getters: {
      'name': (visitor, target) => (target as ListTileStyle).name,
      'index': (visitor, target) => (target as ListTileStyle).index,
    },
  );
}

BridgedEnumDefinition getListTileTitleAlignmentBridgingDefinition() {
  return BridgedEnumDefinition<ListTileTitleAlignment>(
    name: 'ListTileTitleAlignment',
    values: ListTileTitleAlignment.values,
    getters: {
      'name': (visitor, target) => (target as ListTileTitleAlignment).name,
      'index': (visitor, target) => (target as ListTileTitleAlignment).index,
    },
  );
}
