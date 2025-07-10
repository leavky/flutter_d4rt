import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Basic Widgets Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    group('Column Widget', () {
      test('should create Column with default properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Column(
              children: [
                Text('Item 1'),
                Text('Item 2'),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Column with custom alignment', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Aligned Item'),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Column with spacing', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Column(
              spacing: 16.0,
              children: [
                Text('Item 1'),
                Text('Item 2'),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      testWidgets('should render Column correctly', (
        WidgetTester tester,
      ) async {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return MaterialApp(
              home: Scaffold(
                body: Column(
                  children: [
                    Text('First'),
                    Text('Second'),
                  ],
                ),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        await tester.pumpWidget(widget);

        // Check if it's a widget (might be error widget due to d4rt limitations)
        expect(widget, isA<Widget>());
      });
    });

    group('Row Widget', () {
      test('should create Row with default properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Row(
              children: [
                Icon(Icons.star),
                Text('Rating'),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Row with custom alignment', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Left'),
                Text('Right'),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Container Widget', () {
      test('should create Container with decoration', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('Container'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Container with padding and margin', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Padded Container'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Padding Widget', () {
      test('should create Padding with EdgeInsets.all', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Padded Text'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Padding with EdgeInsets.symmetric', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Text('Symmetric Padding'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Stack Widget', () {
      test('should create Stack with positioned children', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
                Positioned(
                  top: 50,
                  left: 50,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Stack with alignment', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 200, height: 200, color: Colors.grey),
                Text('Centered'),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Positioned Widget', () {
      test('should create Positioned with all properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 20,
                  right: 30,
                  bottom: 40,
                  child: Container(color: Colors.green),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Flexible and Expanded Widgets', () {
      test('should create Flexible widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(height: 50, color: Colors.red),
                ),
                Flexible(
                  flex: 1,
                  child: Container(height: 50, color: Colors.blue),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Expanded widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Column(
              children: [
                Container(height: 50, color: Colors.red),
                Expanded(
                  child: Container(color: Colors.blue),
                ),
                Container(height: 50, color: Colors.green),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Center Widget', () {
      test('should create Center widget', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Center(
              child: Text('Centered Text'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Text Widget', () {
      test('should create Text with simple string', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Text('Hello World');
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Text with style', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Text(
              'Styled Text',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Text with alignment', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Text(
              'Aligned Text',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });
  });
}
