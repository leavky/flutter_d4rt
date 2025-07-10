import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Input Widgets Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    group('TextField Widget', () {
      test('should create TextField with basic properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return TextField(
              decoration: InputDecoration(
                labelText: 'Enter your name',
                hintText: 'John Doe',
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create TextField with controller and validation', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'example@email.com',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create TextField with obscure text', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.visibility),
                border: OutlineInputBorder(),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Checkbox Widget', () {
      test('should create Checkbox with basic properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Checkbox(
              value: true,
              onChanged: (bool? value) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create CheckboxListTile', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return CheckboxListTile(
              title: Text('Accept Terms and Conditions'),
              value: false,
              onChanged: (bool? value) {},
              controlAffinity: ListTileControlAffinity.leading,
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Radio Widget', () {
      test('should create Radio with basic properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Radio<String>(
              value: 'option1',
              groupValue: 'option1',
              onChanged: (String? value) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create RadioListTile', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return RadioListTile<String>(
              title: Text('Option 1'),
              value: 'option1',
              groupValue: 'option1',
              onChanged: (String? value) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Switch Widget', () {
      test('should create Switch with basic properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Switch(
              value: true,
              onChanged: (bool value) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create SwitchListTile', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return SwitchListTile(
              title: Text('Enable Notifications'),
              subtitle: Text('Receive push notifications'),
              value: true,
              onChanged: (bool value) {},
              secondary: Icon(Icons.notifications),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Slider Widget', () {
      test('should create Slider with basic properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Slider(
              value: 50.0,
              max: 100.0,
              divisions: 5,
              label: '50',
              onChanged: (double value) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create RangeSlider', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return RangeSlider(
              values: RangeValues(20, 80),
              max: 100,
              divisions: 5,
              labels: RangeLabels('20', '80'),
              onChanged: (RangeValues values) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('DropdownButton Widget', () {
      test('should create DropdownButton with items', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return DropdownButton<String>(
              value: 'option1',
              items: [
                DropdownMenuItem<String>(
                  value: 'option1',
                  child: Text('Option 1'),
                ),
                DropdownMenuItem<String>(
                  value: 'option2',
                  child: Text('Option 2'),
                ),
              ],
              onChanged: (String? newValue) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create DropdownButtonFormField', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select an option',
                border: OutlineInputBorder(),
              ),
              value: 'option1',
              items: [
                DropdownMenuItem<String>(
                  value: 'option1',
                  child: Text('Option 1'),
                ),
                DropdownMenuItem<String>(
                  value: 'option2',
                  child: Text('Option 2'),
                ),
              ],
              onChanged: (String? newValue) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Form and TextFormField Widget', () {
      test('should create Form with TextFormField', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Chip Widgets', () {
      test('should create Chip with basic properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Chip(
              label: Text('Chip Label'),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('A'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ActionChip', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ActionChip(
              label: Text('Action'),
              onPressed: () {},
              avatar: Icon(Icons.star),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create FilterChip', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return FilterChip(
              label: Text('Filter'),
              selected: true,
              onSelected: (bool value) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ChoiceChip', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ChoiceChip(
              label: Text('Choice'),
              selected: true,
              onSelected: (bool value) {},
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('InkWell and GestureDetector', () {
      test('should create InkWell with splash effect', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text('Tap me'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create GestureDetector with multiple gestures', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return GestureDetector(
              onTap: () {},
              onDoubleTap: () {},
              onLongPress: () {},
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: Text('Gesture'),
                ),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });
  });
}
