import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/foundation/foundation.dart';

/// Provides foundation source code and bridge registrations for the Flutter D4rt interpreter.
///
/// This module handles the core Flutter foundation classes that are essential for
/// state management and app lifecycle, including:
/// - ChangeNotifier and ValueNotifier for state management
/// - ListenableBuilder and ValueListenableBuilder for reactive UI updates
/// - Core foundation utilities and base classes
///
/// The foundation layer provides the building blocks for Flutter's reactive
/// programming model and is required for most Flutter applications.
Map<String, String> getFoundationSource(D4rt interpreter) {
  registerFoundationBridges(interpreter);
  return {
    'package:flutter/foundation.dart': '''
     export 'package:flutter/foundation_.dart';
    ''',
  };
}
