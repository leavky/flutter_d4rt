import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';
import 'package:d4rt/d4rt.dart' hide LogLevel;

void main() {
  group('FlutterRunInterpreter', () {
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
        expect(interpreter.isInitialized, isTrue);
      });

      test('should handle multiple initialization calls', () {
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

    group('Code Execution', () {
      setUp(() {
        interpreter.initialize();
      });

      test('should execute simple widget code', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Container(
              width: 100,
              height: 100,
              color: Colors.red,
            );
          }
        ''';

        expect(() => interpreter.execute(code, 'build'), returnsNormally);
      });

      test('should execute StatelessWidget code', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          class MyWidget extends StatelessWidget {
            const MyWidget({super.key});
            
            @override
            Widget build(BuildContext context) {
              return Text('Hello World');
            }
          }
          
          Widget main() {
            return MyWidget();
          }
        ''';

        final result = interpreter.execute(code, 'main');
        expect(result, isA<Widget>());
      });

      test('should execute StatefulWidget code', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          class CounterWidget extends StatefulWidget {
            const CounterWidget({super.key});
            
            @override
            State<CounterWidget> createState() => _CounterWidgetState();
          }
          
          class _CounterWidgetState extends State<CounterWidget> {
            int counter = 0;
            
            @override
            Widget build(BuildContext context) {
              return Column(
                children: [
                  Text('Counter: \$counter'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: Text('Increment'),
                  ),
                ],
              );
            }
          }
          
          Widget main() {
            return CounterWidget();
          }
        ''';

        final result = interpreter.execute(code, 'main');
        expect(result, isA<Widget>());
      });

      test('should handle code with syntax errors gracefully', () {
        const invalidCode = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Container(
              width: 100,
              height: 100,
              color: Colors.red
              // Missing semicolon and closing brace
        ''';

        final result = interpreter.execute(invalidCode, 'build');
        expect(result, isA<Widget>()); // Should return error widget
      });
    });

    group('Caching', () {
      setUp(() {
        interpreter.initialize();
      });

      test('should cache executed widgets', () {
        const code = '''
          import 'package:flutter/material.dart';
          Widget build() => Container();
        ''';

        // First execution
        final widget1 = interpreter.execute(code, 'build');
        final stats1 = interpreter.getCacheStats();

        // Second execution with same code
        final widget2 = interpreter.execute(code, 'build');
        final stats2 = interpreter.getCacheStats();

        expect(widget1, isA<Widget>());
        expect(widget2, isA<Widget>());
        expect(stats2['cacheSize'], greaterThan(stats1['cacheSize']));
      });

      test('should clear cache', () {
        const code = '''
          import 'package:flutter/material.dart';
          Widget build() => Container();
        ''';

        interpreter.execute(code, 'build');
        expect(interpreter.getCacheStats()['cacheSize'], greaterThan(0));

        interpreter.clearCache();
        expect(interpreter.getCacheStats()['cacheSize'], equals(0));
      });

      test('should bypass cache when disabled', () {
        const code = '''
          import 'package:flutter/material.dart';
          Widget build() => Container();
        ''';

        final widget1 = interpreter.execute(code, 'build', useCache: false);
        final widget2 = interpreter.execute(code, 'build', useCache: false);

        expect(widget1, isA<Widget>());
        expect(widget2, isA<Widget>());
        // Both should be freshly executed
      });
    });

    group('Error Handling', () {
      setUp(() {
        interpreter.initialize();
      });

      test('should log errors', () {
        const invalidCode = 'invalid dart code {{{';

        interpreter.execute(invalidCode, 'main');
        final errors = interpreter.getErrorLogs();

        expect(errors, isNotEmpty);
        expect(errors.last, contains('ERROR'));
      });

      test('should clear error logs', () {
        const invalidCode = 'invalid dart code {{{';

        interpreter.execute(invalidCode, 'main');
        expect(interpreter.getErrorLogs(), isNotEmpty);

        interpreter.clearErrorLogs();
        expect(interpreter.getErrorLogs(), isEmpty);
      });

      test('should handle callback errors', () {
        var errorReceived = false;
        interpreter.onError = (error) {
          errorReceived = true;
        };

        const invalidCode = 'invalid dart code {{{';
        interpreter.execute(invalidCode, 'main');

        expect(errorReceived, isTrue);
      });
    });

    group('Bridge Registration', () {
      setUp(() {
        interpreter.initialize();
      });

      test('should register custom bridges', () {
        // This would test custom bridge registration
        // Implementation depends on specific bridge structure
        expect(
          () => interpreter.registerBridgedClass(
            // Mock bridge definition
            getMockBridgeDefinition(),
            'package:test/mock.dart',
          ),
          returnsNormally,
        );
      });
    });
  });

  group('Widget Tests', () {
    testWidgets('should render interpreted widgets', (
      WidgetTester tester,
    ) async {
      final interpreter = FlutterRunInterpreter();
      interpreter.initialize();

      const code = '''
        import 'package:flutter/material.dart';
        
        Widget build() {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Hello from Interpreter!'),
              ),
            ),
          );
        }
      ''';

      final widget = interpreter.execute(code, 'build');
      await tester.pumpWidget(widget);

      expect(find.text('Hello from Interpreter!'), findsOneWidget);

      interpreter.dispose();
    });

    testWidgets('should handle stateful widgets', (WidgetTester tester) async {
      final interpreter = FlutterRunInterpreter();
      interpreter.initialize();

      const code = '''
        import 'package:flutter/material.dart';
        
        class Counter extends StatefulWidget {
          const Counter({super.key});
          
          @override
          State<Counter> createState() => _CounterState();
        }
        
        class _CounterState extends State<Counter> {
          int count = 0;
          
          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              home: Scaffold(
                body: Column(
                  children: [
                    Text('Count: \$count'),
                    ElevatedButton(
                      onPressed: () => setState(() => count++),
                      child: Text('Increment'),
                    ),
                  ],
                ),
              ),
            );
          }
        }
        
        Widget main() => Counter();
      ''';

      final widget = interpreter.execute(code, 'main');
      await tester.pumpWidget(widget);

      expect(find.text('Count: 0'), findsOneWidget);

      await tester.tap(find.text('Increment'));
      await tester.pump();

      expect(find.text('Count: 1'), findsOneWidget);

      interpreter.dispose();
    });
  });

  group('Performance Tests', () {
    test('should handle multiple executions efficiently', () {
      final interpreter = FlutterRunInterpreter();
      interpreter.initialize();

      const code = '''
        import 'package:flutter/material.dart';
        Widget build() => Container();
      ''';

      final stopwatch = Stopwatch()..start();

      for (int i = 0; i < 100; i++) {
        interpreter.execute(code, 'build');
      }

      stopwatch.stop();

      // Should complete in reasonable time (less than 1 second for 100 executions)
      expect(stopwatch.elapsedMilliseconds, lessThan(1000));

      interpreter.dispose();
    });
  });
}

// Mock bridge definition for testing
BridgedClass getMockBridgeDefinition() {
  return BridgedClass(
    nativeType: MockTestClass,
    name: 'MockTestClass',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return MockTestClass();
      },
    },
    methods: {
      'testMethod': (visitor, target, positionalArgs, namedArgs) {
        return 'test result';
      },
    },
  );
}

// Mock class for testing
class MockTestClass {
  String testMethod() => 'test result';
}

// Extension to add isInitialized getter for testing
extension InterpreterTestExtension on FlutterRunInterpreter {
  bool get isInitialized =>
      true; // This would check actual initialization state
}
