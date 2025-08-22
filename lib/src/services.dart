import 'package:d4rt/d4rt.dart';
import 'package:flutter_d4rt/src/services/services.dart';

/// Provides services source code and bridge registrations for the Flutter D4rt interpreter.
///
/// This module handles Flutter services including:
/// - AssetBundle for loading assets and resources
/// - NetworkAssetBundle for loading assets from network
/// - CachingAssetBundle for caching asset loading
/// - Global access to rootBundle for default asset loading
/// - SystemChrome for system UI configuration
/// - SystemNavigator for system navigation
/// - Platform services and system integration
///
/// Services provide the interface between Flutter and the underlying platform,
/// enabling asset loading, system configuration, and platform-specific features.
Map<String, String> getServicesSource(D4rt interpreter) {
  registerServicesBridges(interpreter);
  return {
    'package:flutter/services.dart': '''
     export 'package:flutter/services_.dart';
    ''',
  };
}
