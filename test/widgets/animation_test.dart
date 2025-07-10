import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Animation Widgets Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    group('AnimatedContainer Widget', () {
      test('should create AnimatedContainer with duration', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AnimatedContainer(
              duration: Duration(seconds: 1),
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(child: Text('Animated')),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create AnimatedContainer with curve', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('Curved Animation'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('AnimatedOpacity Widget', () {
      test('should create AnimatedOpacity with opacity change', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AnimatedOpacity(
              opacity: 0.5,
              duration: Duration(seconds: 2),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Center(child: Text('Fading')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create AnimatedOpacity with curve', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AnimatedOpacity(
              opacity: 0.8,
              duration: Duration(milliseconds: 800),
              curve: Curves.bounceIn,
              child: Text('Bouncing Fade'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('AnimatedAlign Widget', () {
      test('should create AnimatedAlign with alignment change', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AnimatedAlign(
              alignment: Alignment.topRight,
              duration: Duration(seconds: 1),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.purple,
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('AnimatedPadding Widget', () {
      test('should create AnimatedPadding with padding change', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AnimatedPadding(
              padding: EdgeInsets.all(20.0),
              duration: Duration(seconds: 1),
              child: Container(
                color: Colors.orange,
                child: Text('Padded Content'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create AnimatedPadding with curve', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AnimatedPadding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              duration: Duration(milliseconds: 600),
              curve: Curves.elasticOut,
              child: Text('Elastic Padding'),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('AnimatedPositioned Widget', () {
      test('should create AnimatedPositioned in Stack', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Stack(
              children: [
                AnimatedPositioned(
                  top: 50,
                  left: 100,
                  duration: Duration(seconds: 1),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create AnimatedPositioned with all properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Stack(
              children: [
                AnimatedPositioned(
                  top: 20,
                  left: 30,
                  right: 40,
                  bottom: 50,
                  duration: Duration(milliseconds: 800),
                  curve: Curves.decelerate,
                  child: Container(color: Colors.blue),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('AnimatedCrossFade Widget', () {
      test('should create AnimatedCrossFade with two children', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AnimatedCrossFade(
              firstChild: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Center(child: Text('First')),
              ),
              secondChild: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(child: Text('Second')),
              ),
              crossFadeState: CrossFadeState.showFirst,
              duration: Duration(seconds: 1),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create AnimatedCrossFade with custom layout', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AnimatedCrossFade(
              firstChild: Text('First State'),
              secondChild: Text('Second State'),
              crossFadeState: CrossFadeState.showSecond,
              duration: Duration(milliseconds: 500),
              layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
                return Stack(
                  children: [
                    Positioned(
                      key: bottomChildKey,
                      child: bottomChild,
                    ),
                    Positioned(
                      key: topChildKey,
                      child: topChild,
                    ),
                  ],
                );
              },
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('AnimatedSwitcher Widget', () {
      test('should create AnimatedSwitcher with child transition', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: Container(
                key: ValueKey<int>(1),
                width: 100,
                height: 100,
                color: Colors.green,
                child: Center(child: Text('Child 1')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create AnimatedSwitcher with custom transition', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 600),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Text(
                'Scaled Text',
                key: ValueKey<String>('text'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Hero Widget', () {
      test('should create Hero with tag and child', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Hero(
              tag: 'hero-image',
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: Center(child: Text('Hero')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Hero with flight shuttle builder', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Hero(
              tag: 'custom-hero',
              flightShuttleBuilder: (context, animation, direction, fromContext, toContext) {
                return Material(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('H'),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('Transform Widget', () {
      test('should create Transform with rotation', () {
        const code = '''
          import 'package:flutter/material.dart';
          import 'dart:math' as math;
          
          Widget build() {
            return Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.cyan,
                child: Center(child: Text('Rotated')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Transform with scale', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Transform.scale(
              scale: 1.5,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.pink,
                child: Center(child: Text('Scaled')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Transform with translation', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Transform.translate(
              offset: Offset(50, 30),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.lime,
                child: Center(child: Text('Translated')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('FadeTransition Widget', () {
      test('should create FadeTransition with animation controller', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return FadeTransition(
              opacity: AlwaysStoppedAnimation(0.7),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.teal,
                child: Center(child: Text('Fade')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('SlideTransition Widget', () {
      test('should create SlideTransition with position animation', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return SlideTransition(
              position: AlwaysStoppedAnimation(Offset(0.5, 0.0)),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.indigo,
                child: Center(child: Text('Slide')),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('ScaleTransition Widget', () {
      test('should create ScaleTransition with scale animation', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return ScaleTransition(
              scale: AlwaysStoppedAnimation(1.2),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.brown,
                child: Center(child: Text('Scale')),
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
