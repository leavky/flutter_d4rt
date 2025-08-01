import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/double.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClassDefinition for the Flutter OutlineInputBorder widget.
BridgedClassDefinition getOutlineInputBorderBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: OutlineInputBorder,
    name: 'OutlineInputBorder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final borderSide =
            namedArgs.get<BorderSide?>('borderSide') ?? BorderSide.none;
        final borderRadius =
            namedArgs.get<BorderRadius?>('borderRadius') ??
            const BorderRadius.all(Radius.circular(4.0));
        final gapPadding = (namedArgs.get<num?>('gapPadding') ?? 4.0)
            .toDouble();

        return OutlineInputBorder(
          borderSide: borderSide,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        );
      },
    },
    getters: {
      'borderSide': (visitor, target) =>
          (target as OutlineInputBorder).borderSide,
      'borderRadius': (visitor, target) =>
          (target as OutlineInputBorder).borderRadius,
      'gapPadding': (visitor, target) =>
          (target as OutlineInputBorder).gapPadding,
    },
    methods: {
      'copyWith': (visitor, target, positionalArgs, namedArgs) {
        final borderSide = namedArgs.get<BorderSide?>('borderSide');
        final borderRadius = namedArgs.get<BorderRadius?>('borderRadius');
        final gapPadding = toDouble(namedArgs.get('gapPadding'));

        return (target as OutlineInputBorder).copyWith(
          borderSide: borderSide,
          borderRadius: borderRadius,
          gapPadding: gapPadding,
        );
      },
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter UnderlineInputBorder widget.
BridgedClassDefinition getUnderlineInputBorderBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: UnderlineInputBorder,
    name: 'UnderlineInputBorder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final borderSide =
            namedArgs.get<BorderSide?>('borderSide') ?? const BorderSide();
        final borderRadius =
            namedArgs.get<BorderRadius?>('borderRadius') ??
            const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            );

        return UnderlineInputBorder(
          borderSide: borderSide,
          borderRadius: borderRadius,
        );
      },
    },
    getters: {
      'borderSide': (visitor, target) =>
          (target as UnderlineInputBorder).borderSide,
      'borderRadius': (visitor, target) =>
          (target as UnderlineInputBorder).borderRadius,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter InputDecoration widget.
BridgedClassDefinition getInputDecorationBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: InputDecoration,
    name: 'InputDecoration',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final icon = namedArgs['icon'] != null
            ? visitor.toWidgets(namedArgs['icon'])
            : null;
        final iconColor = namedArgs.get<Color?>('iconColor');
        final label = namedArgs['label'] != null
            ? visitor.toWidgets(namedArgs['label'])
            : null;
        final labelText = namedArgs.get<String?>('labelText');
        final labelStyle = namedArgs.get<TextStyle?>('labelStyle');
        final floatingLabelStyle = namedArgs.get<TextStyle?>(
          'floatingLabelStyle',
        );
        final helperText = namedArgs.get<String?>('helperText');
        final helperStyle = namedArgs.get<TextStyle?>('helperStyle');
        final helperMaxLines = namedArgs.get<int?>('helperMaxLines');
        final hintText = namedArgs.get<String?>('hintText');
        final hintStyle = namedArgs.get<TextStyle?>('hintStyle');
        final hintMaxLines = namedArgs.get<int?>('hintMaxLines');
        final errorText = namedArgs.get<String?>('errorText');
        final errorStyle = namedArgs.get<TextStyle?>('errorStyle');
        final errorMaxLines = namedArgs.get<int?>('errorMaxLines');
        final floatingLabelBehavior = namedArgs.get<FloatingLabelBehavior?>(
          'floatingLabelBehavior',
        );
        final floatingLabelAlignment = namedArgs.get<FloatingLabelAlignment?>(
          'floatingLabelAlignment',
        );
        final isCollapsed = namedArgs.get<bool?>('isCollapsed') ?? false;
        final isDense = namedArgs.get<bool?>('isDense');
        final contentPadding = namedArgs.get<EdgeInsetsGeometry?>(
          'contentPadding',
        );
        final prefixIcon = namedArgs['prefixIcon'] != null
            ? visitor.toWidgets(namedArgs['prefixIcon'])
            : null;
        final prefix = namedArgs['prefix'] != null
            ? visitor.toWidgets(namedArgs['prefix'])
            : null;
        final prefixText = namedArgs.get<String?>('prefixText');
        final prefixStyle = namedArgs.get<TextStyle?>('prefixStyle');
        final prefixIconColor = namedArgs.get<Color?>('prefixIconColor');
        final suffixIcon = namedArgs['suffixIcon'] != null
            ? visitor.toWidgets(namedArgs['suffixIcon'])
            : null;
        final suffix = namedArgs['suffix'] != null
            ? visitor.toWidgets(namedArgs['suffix'])
            : null;
        final suffixText = namedArgs.get<String?>('suffixText');
        final suffixStyle = namedArgs.get<TextStyle?>('suffixStyle');
        final suffixIconColor = namedArgs.get<Color?>('suffixIconColor');
        final counter = namedArgs['counter'] != null
            ? visitor.toWidgets(namedArgs['counter'])
            : null;
        final counterText = namedArgs.get<String?>('counterText');
        final counterStyle = namedArgs.get<TextStyle?>('counterStyle');
        final filled = namedArgs.get<bool?>('filled');
        final fillColor = namedArgs.get<Color?>('fillColor');
        final focusColor = namedArgs.get<Color?>('focusColor');
        final hoverColor = namedArgs.get<Color?>('hoverColor');
        final errorBorder = namedArgs.get<InputBorder?>('errorBorder');
        final focusedBorder = namedArgs.get<InputBorder?>('focusedBorder');
        final focusedErrorBorder = namedArgs.get<InputBorder?>(
          'focusedErrorBorder',
        );
        final disabledBorder = namedArgs.get<InputBorder?>('disabledBorder');
        final enabledBorder = namedArgs.get<InputBorder?>('enabledBorder');
        final border = namedArgs.get<InputBorder?>('border');
        final enabled = namedArgs.get<bool?>('enabled') ?? true;
        final semanticCounterText = namedArgs.get<String?>(
          'semanticCounterText',
        );
        final alignLabelWithHint = namedArgs.get<bool?>('alignLabelWithHint');
        final constraints = namedArgs.get<BoxConstraints?>('constraints');

        return InputDecoration(
          icon: icon,
          iconColor: iconColor,
          label: label,
          labelText: labelText,
          labelStyle: labelStyle,
          floatingLabelStyle: floatingLabelStyle,
          helperText: helperText,
          helperStyle: helperStyle,
          helperMaxLines: helperMaxLines,
          hintText: hintText,
          hintStyle: hintStyle,
          hintMaxLines: hintMaxLines,
          errorText: errorText,
          errorStyle: errorStyle,
          errorMaxLines: errorMaxLines,
          floatingLabelBehavior: floatingLabelBehavior,
          floatingLabelAlignment: floatingLabelAlignment,
          isCollapsed: isCollapsed,
          isDense: isDense,
          contentPadding: contentPadding,
          prefixIcon: prefixIcon,
          prefix: prefix,
          prefixText: prefixText,
          prefixStyle: prefixStyle,
          prefixIconColor: prefixIconColor,
          suffixIcon: suffixIcon,
          suffix: suffix,
          suffixText: suffixText,
          suffixStyle: suffixStyle,
          suffixIconColor: suffixIconColor,
          counter: counter,
          counterText: counterText,
          counterStyle: counterStyle,
          filled: filled,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          focusedErrorBorder: focusedErrorBorder,
          disabledBorder: disabledBorder,
          enabledBorder: enabledBorder,
          border: border,
          enabled: enabled,
          semanticCounterText: semanticCounterText,
          alignLabelWithHint: alignLabelWithHint,
          constraints: constraints,
        );
      },
    },
    getters: {
      'labelText': (visitor, target) => (target as InputDecoration).labelText,
      'hintText': (visitor, target) => (target as InputDecoration).hintText,
      'errorText': (visitor, target) => (target as InputDecoration).errorText,
      'border': (visitor, target) => (target as InputDecoration).border,
      'filled': (visitor, target) => (target as InputDecoration).filled,
      'fillColor': (visitor, target) => (target as InputDecoration).fillColor,
    },
  );
}

/// Returns the BridgedEnumDefinition for the Flutter FloatingLabelBehavior enum.
BridgedEnumDefinition getFloatingLabelBehaviorBridgingDefinition() {
  return BridgedEnumDefinition<FloatingLabelBehavior>(
    name: 'FloatingLabelBehavior',
    values: FloatingLabelBehavior.values,
    getters: {
      'name': (visitor, target) => (target as FloatingLabelBehavior).name,
      'index': (visitor, target) => (target as FloatingLabelBehavior).index,
    },
  );
}
