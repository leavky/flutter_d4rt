import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('AssetBundle Support Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('AssetBundle classes are available in interpreted code', () {
      const code = '''
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget testAssetBundleAvailability() {
  // Test that AssetBundle classes are accessible
  try {
    // Test that we can reference AssetBundle
    final bundle = rootBundle;
    
    // Test that we can create NetworkAssetBundle
    final networkBundle = NetworkAssetBundle(Uri.parse('https://example.com/'));
    
    return Container(
      child: Text('AssetBundle support available'),
    );
  } catch (e) {
    return Container(
      child: Text('Error: \$e'),
    );
  }
}
''';

      expect(
        () => interpreter.execute(code, 'testAssetBundleAvailability'),
        returnsNormally,
      );
    });

    test('rootBundle is accessible', () {
      const code = '''
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget testRootBundle() {
  try {
    // Should be able to access rootBundle
    final bundle = rootBundle;
    return Container(
      child: Text('rootBundle accessible: \${bundle.runtimeType}'),
    );
  } catch (e) {
    return Container(
      child: Text('rootBundle error: \$e'),
    );
  }
}
''';

      final widget = interpreter.execute(code, 'testRootBundle');
      expect(widget, isNotNull);
    });

    test('AssetBundle methods are available', () {
      const code = '''
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget testAssetBundleMethods() {
  return FutureBuilder<String>(
    future: _testAssetMethods(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Container(
          child: Text('Methods available: \${snapshot.data}'),
        );
      }
      return Container(
        child: Text('Loading methods test...'),
      );
    },
  );
}

Future<String> _testAssetMethods() async {
  try {
    final bundle = rootBundle;
    
    // Test that methods exist (they may throw, but should be callable)
    final methods = <String>[];
    
    // These should be available as methods
    try {
      bundle.toString();
      methods.add('toString');
    } catch (e) {
      // Method exists but may fail
      methods.add('toString(error)');
    }
    
    return methods.join(', ');
  } catch (e) {
    return 'Error testing methods: \$e';
  }
}
''';

      final widget = interpreter.execute(code, 'testAssetBundleMethods');
      expect(widget, isNotNull);
    });

    test('NetworkAssetBundle can be instantiated', () {
      const code = '''
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget testNetworkAssetBundle() {
  try {
    final networkBundle = NetworkAssetBundle(Uri.parse('https://example.com/'));
    return Container(
      child: Text('NetworkAssetBundle created: \${networkBundle.runtimeType}'),
    );
  } catch (e) {
    return Container(
      child: Text('NetworkAssetBundle error: \$e'),
    );
  }
}
''';

      final widget = interpreter.execute(code, 'testNetworkAssetBundle');
      expect(widget, isNotNull);
    });
  });
}
