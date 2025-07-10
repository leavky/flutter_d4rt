import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/material/material.dart';

/// Provides Material Design source code and bridge registrations for the Flutter D4rt interpreter.
///
/// This module implements Google's Material Design system for Flutter applications,
/// providing access to a comprehensive set of Material Design components:
/// - App structure (MaterialApp, Scaffold, AppBar, Drawer, etc.)
/// - Navigation (BottomNavigationBar, TabBar, NavigationRail, etc.)
/// - Input controls (TextField, Checkbox, Radio, Switch, Slider, etc.)
/// - Action components (FloatingActionButton, IconButton, etc.)
/// - Selection controls (DropdownButton, PopupMenuButton, etc.)
/// - Layout components (Card, ListTile, Divider, etc.)
/// - Feedback components (SnackBar, AlertDialog, ProgressIndicator, etc.)
///
/// The Material layer builds upon the widgets, foundation, and UI layers to provide
/// a complete design system that follows Material Design principles and guidelines.
///
/// Parameters:
/// - [interpreter]: The D4rt interpreter instance to configure
///
/// Returns:
/// - A map containing the Material Design source code exports and dependencies
Map<String, String> getMaterialSource(D4rt interpreter) {
  registerMaterialBridges(interpreter);
  return {
    'package:flutter/material.dart': '''
     export 'package:flutter/material_.dart';
     export 'package:flutter/widgets.dart';
     export 'package:flutter/foundation.dart';
     export 'dart:ui';
    ''',
  };
}
