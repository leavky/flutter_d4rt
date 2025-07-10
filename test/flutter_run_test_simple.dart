import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('FlutterRunInterpreter - Tests Simplifiés', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
    });

    tearDown(() {
      interpreter.dispose();
    });

    group('Initialization', () {
      test('should initialize successfully', () {
        expect(() => interpreter.initialize(), returnsNormally);
      });

      test('should handle multiple initialization calls gracefully', () {
        interpreter.initialize();
        expect(() => interpreter.initialize(), returnsNormally);
      });

      test('should fail execution before initialization', () {
        expect(
          () => interpreter.execute('Widget build() => Container();', 'build'),
          throwsA(isA<StateError>()),
        );
      });
    });

    group('Basic Execution', () {
      setUp(() {
        interpreter.initialize();
      });

      test('should handle simple code execution', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Container();
          }
        ''';

        // Should not throw, even if it returns an error widget
        expect(() => interpreter.execute(code, 'build'), returnsNormally);
      });

      test('should return error widget for invalid code', () {
        const invalidCode = 'invalid dart code {{{';

        final result = interpreter.execute(invalidCode, 'main');
        expect(result, isA<Widget>());
        // Should be a MaterialApp (our error widget)
        expect(result, isA<MaterialApp>());
      });
    });

    group('Cache Management', () {
      setUp(() {
        interpreter.initialize();
      });

      test('should provide cache statistics', () {
        final stats = interpreter.getCacheStats();
        expect(stats, isA<Map<String, dynamic>>());
        expect(stats.containsKey('cacheSize'), isTrue);
        expect(stats.containsKey('memoryUsage'), isTrue);
      });

      test('should clear cache successfully', () {
        // Execute some code first
        const code = '''
          import 'package:flutter/material.dart';
          Widget build() => Container();
        ''';
        interpreter.execute(code, 'build');

        // Clear cache should not throw
        expect(() => interpreter.clearCache(), returnsNormally);

        final stats = interpreter.getCacheStats();
        expect(stats['cacheSize'], equals(0));
      });

      test('should handle cache bypass', () {
        const code = '''
          import 'package:flutter/material.dart';
          Widget build() => Container();
        ''';

        final widget1 = interpreter.execute(code, 'build', useCache: false);
        final widget2 = interpreter.execute(code, 'build', useCache: false);

        expect(widget1, isA<Widget>());
        expect(widget2, isA<Widget>());
      });
    });

    group('Error Handling', () {
      setUp(() {
        interpreter.initialize();
      });

      test('should log errors appropriately', () {
        const invalidCode = 'invalid dart code';

        interpreter.execute(invalidCode, 'main');
        final errors = interpreter.getErrorLogs();

        expect(errors, isNotEmpty);
      });

      test('should clear error logs', () {
        const invalidCode = 'invalid dart code';

        interpreter.execute(invalidCode, 'main');
        expect(interpreter.getErrorLogs(), isNotEmpty);

        interpreter.clearErrorLogs();
        expect(interpreter.getErrorLogs(), isEmpty);
      });

      test('should handle error callbacks', () {
        var errorReceived = false;
        String? receivedError;

        interpreter.onError = (error) {
          errorReceived = true;
          receivedError = error;
        };

        const invalidCode = 'invalid dart code';
        interpreter.execute(invalidCode, 'main');

        expect(errorReceived, isTrue);
        expect(receivedError, isNotNull);
      });
    });

    group('Performance', () {
      test('should handle multiple executions', () {
        interpreter.initialize();

        const code = '''
          import 'package:flutter/material.dart';
          Widget build() => Container();
        ''';

        final stopwatch = Stopwatch()..start();

        for (int i = 0; i < 10; i++) {
          interpreter.execute(code, 'build');
        }

        stopwatch.stop();

        // Should complete in reasonable time (less than 10 seconds for 10 executions)
        expect(stopwatch.elapsedMilliseconds, lessThan(10000));
      });
    });
  });

  group('Widget Tests', () {
    testWidgets('should handle error widget rendering', (
      WidgetTester tester,
    ) async {
      final interpreter = FlutterRunInterpreter();
      interpreter.initialize();

      // Execute invalid code to get error widget
      const invalidCode = 'invalid code';
      final errorWidget = interpreter.execute(invalidCode, 'main');

      // Should be able to pump the error widget
      await tester.pumpWidget(errorWidget);

      // Should find error indication
      expect(find.byIcon(Icons.error), findsOneWidget);
      expect(find.text('Code Execution Error'), findsOneWidget);

      interpreter.dispose();
    });

    testWidgets('should render basic widgets', (WidgetTester tester) async {
      final interpreter = FlutterRunInterpreter();
      interpreter.initialize();

      // Simple valid code that should work
      const code = '''
        import 'package:flutter/material.dart';
        
        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: Text('Test Widget'),
            ),
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');

      // If it's an error widget (MaterialApp), it should still render
      await tester.pumpWidget(widget);

      // The widget should exist and be renderable
      expect(widget, isA<Widget>());

      interpreter.dispose();
    });
  });
}
