import 'package:d4rt/d4rt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClassDefinition for the Flutter Scaffold widget.
BridgedClassDefinition getScaffoldBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: Scaffold,
    name: 'Scaffold',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final appBar = namedArgs.get<PreferredSizeWidget?>('appBar');
        final body = visitor.toWidgets(namedArgs['body']);
        final floatingActionButton = namedArgs.get<Widget?>(
          'floatingActionButton',
        );
        final floatingActionButtonLocation = namedArgs
            .get<FloatingActionButtonLocation?>('floatingActionButtonLocation');
        final drawer = visitor.toWidgets(namedArgs['drawer']);
        final endDrawer = visitor.toWidgets(namedArgs['endDrawer']);
        final bottomNavigationBar = namedArgs.get<Widget?>(
          'bottomNavigationBar',
        );
        final backgroundColor = namedArgs.get<Color?>('backgroundColor');
        final resizeToAvoidBottomInset = namedArgs.get<bool?>(
          'resizeToAvoidBottomInset',
        );

        return Scaffold(
          key: key,
          appBar: appBar,
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          drawer: drawer,
          endDrawer: endDrawer,
          bottomNavigationBar: bottomNavigationBar,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        );
      },
    },
    getters: {
      'appBar': (visitor, target) => (target as Scaffold).appBar,
      'body': (visitor, target) => (target as Scaffold).body,
      'floatingActionButton': (visitor, target) =>
          (target as Scaffold).floatingActionButton,
      'floatingActionButtonLocation': (visitor, target) =>
          (target as Scaffold).floatingActionButtonLocation,
      'drawer': (visitor, target) => (target as Scaffold).drawer,
      'endDrawer': (visitor, target) => (target as Scaffold).endDrawer,
      'bottomNavigationBar': (visitor, target) =>
          (target as Scaffold).bottomNavigationBar,
      'backgroundColor': (visitor, target) =>
          (target as Scaffold).backgroundColor,
      'resizeToAvoidBottomInset': (visitor, target) =>
          (target as Scaffold).resizeToAvoidBottomInset,
      'key': (visitor, target) => (target as Scaffold).key,
    },
  );
}
