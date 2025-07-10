import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/widgets/widgets.dart';

/// Provides widget source code and bridge registrations for the Flutter D4rt interpreter.
///
/// This module handles Flutter's core widget system, which forms the backbone
/// of all Flutter applications. It provides access to:
/// - Basic widgets (Text, Container, Column, Row, etc.)
/// - Stateful and Stateless widget base classes
/// - Navigation and routing widgets
/// - Layout and positioning widgets
/// - Animation and transition widgets
/// - Input and gesture handling widgets
///
/// The widgets layer builds upon the foundation, painting, and rendering layers
/// to provide the high-level building blocks for creating user interfaces.
///
/// Parameters:
/// - [interpreter]: The D4rt interpreter instance to configure
///
/// Returns:
/// - A map containing the widget source code exports and dependencies
Map<String, String> getWidgetsSource(D4rt interpreter) {
  registerWidgetsBridges(interpreter);
  return {
    'package:flutter/widgets.dart': '''
     export 'package:flutter/widgets_.dart';
     export 'package:flutter/painting.dart';
     export 'package:flutter/rendering.dart';
     export 'package:flutter/foundation.dart';
    ''',
  };
}
