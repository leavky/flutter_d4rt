import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Scrollable Widgets Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    group('ListView Widget', () {
      test('should create ListView with children', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ListView(
              children: [
                ListTile(title: Text('Item 1')),
                ListTile(title: Text('Item 2')),
                ListTile(title: Text('Item 3')),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ListView.builder', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item \${index + 1}'),
                  leading: Icon(Icons.star),
                );
              },
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ListView.separated', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(title: Text('Item \${index + 1}'));
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ListView with custom scroll direction', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Center(child: Text('1')),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: Center(child: Text('2')),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  child: Center(child: Text('3')),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('GridView Widget', () {
      test('should create GridView.count', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return GridView.count(
              crossAxisCount: 2,
              children: [
                Container(
                  color: Colors.red,
                  child: Center(child: Text('1')),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(child: Text('2')),
                ),
                Container(
                  color: Colors.green,
                  child: Center(child: Text('3')),
                ),
                Container(
                  color: Colors.orange,
                  child: Center(child: Text('4')),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create GridView.builder', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Text('Grid Item \${index + 1}'),
                  ),
                );
              },
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create GridView.extent', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return GridView.extent(
              maxCrossAxisExtent: 200.0,
              padding: EdgeInsets.all(4.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: [
                Container(color: Colors.teal[100]),
                Container(color: Colors.teal[200]),
                Container(color: Colors.teal[300]),
                Container(color: Colors.teal[400]),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('SingleChildScrollView Widget', () {
      test('should create SingleChildScrollView with vertical scrolling', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(height: 200, color: Colors.red),
                  Container(height: 200, color: Colors.blue),
                  Container(height: 200, color: Colors.green),
                  Container(height: 200, color: Colors.orange),
                ],
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create SingleChildScrollView with horizontal scrolling', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(width: 200, height: 100, color: Colors.red),
                  Container(width: 200, height: 100, color: Colors.blue),
                  Container(width: 200, height: 100, color: Colors.green),
                ],
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create SingleChildScrollView with padding', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Scrollable content with padding'),
                  Container(height: 300, color: Colors.purple),
                  Text('More content'),
                ],
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('ScrollView Configuration', () {
      test('should create ListView with custom physics', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(height: 100, color: Colors.red),
                Container(height: 100, color: Colors.blue),
                Container(height: 100, color: Colors.green),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ListView with never scrollable physics', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ListTile(title: Text('Non-scrollable item 1')),
                ListTile(title: Text('Non-scrollable item 2')),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create ListView with clamping scroll physics', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ListView(
              physics: ClampingScrollPhysics(),
              children: [
                Container(height: 150, color: Colors.amber),
                Container(height: 150, color: Colors.cyan),
                Container(height: 150, color: Colors.pink),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Scrollbar Widget', () {
      test('should create Scrollbar with child', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Scrollbar(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item \${index + 1}'),
                  );
                },
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Scrollbar with thickness and radius', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Scrollbar(
              thickness: 8.0,
              radius: Radius.circular(4.0),
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(30, (index) {
                    return Container(
                      height: 50,
                      margin: EdgeInsets.all(4),
                      color: Colors.blue[100],
                      child: Center(child: Text('Item \${index + 1}')),
                    );
                  }),
                ),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('RefreshIndicator Widget', () {
      test('should create RefreshIndicator with ListView', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return RefreshIndicator(
              onRefresh: () async {
                // Simulate refresh
                await Future.delayed(Duration(seconds: 1));
              },
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Refreshable Item \${index + 1}'),
                    leading: Icon(Icons.refresh),
                  );
                },
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create RefreshIndicator with custom colors', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(Duration(milliseconds: 500));
              },
              color: Colors.red,
              backgroundColor: Colors.yellow,
              strokeWidth: 3.0,
              child: ListView(
                children: [
                  Container(height: 100, color: Colors.blue),
                  Container(height: 100, color: Colors.green),
                  Container(height: 100, color: Colors.orange),
                ],
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('NestedScrollView Widget', () {
      test('should create NestedScrollView with header and body', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    title: Text('Nested Scroll'),
                    pinned: true,
                    expandedHeight: 200.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('Header'),
                      background: Container(color: Colors.purple),
                    ),
                  ),
                ];
              },
              body: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Nested Item \${index + 1}'),
                  );
                },
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
