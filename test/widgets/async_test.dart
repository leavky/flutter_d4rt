import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Async Widgets Support Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    test('FutureBuilder is available in interpreted code', () {
      const code = '''
import 'package:flutter/material.dart';
import 'dart:async';

Widget testFutureBuilder() {
  Future<String> testFuture = Future.value("test data");
  
  return FutureBuilder<String>(
    future: testFuture,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!);
      }
      return CircularProgressIndicator();
    },
  );
}
''';

      expect(
        () => interpreter.execute(code, 'testFutureBuilder'),
        returnsNormally,
      );
    });

    test('StreamBuilder is available in interpreted code', () {
      const code = '''
import 'package:flutter/material.dart';
import 'dart:async';

Widget testStreamBuilder() {
  Stream<int> testStream = Stream.fromIterable([1, 2, 3]);
  
  return StreamBuilder<int>(
    stream: testStream,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text('\${snapshot.data}');
      }
      return CircularProgressIndicator();
    },
  );
}
''';

      expect(
        () => interpreter.execute(code, 'testStreamBuilder'),
        returnsNormally,
      );
    });

    test('AsyncSnapshot constructors are available', () {
      const code = '''
import 'package:flutter/material.dart';

Widget testAsyncSnapshot() {
  final waitingSnapshot = AsyncSnapshot<String>.waiting();
  final dataSnapshot = AsyncSnapshot<String>.withData(ConnectionState.done, "test");
  final errorSnapshot = AsyncSnapshot<String>.withError(ConnectionState.done, "error");
  
  return Column(
    children: [
      Text('Waiting: \${waitingSnapshot.connectionState}'),
      Text('Data: \${dataSnapshot.hasData}'),
      Text('Error: \${errorSnapshot.hasError}'),
    ],
  );
}
''';

      expect(
        () => interpreter.execute(code, 'testAsyncSnapshot'),
        returnsNormally,
      );
    });

    test('ConnectionState enum is available', () {
      const code = '''
import 'package:flutter/material.dart';

Widget testConnectionState() {
  final states = [
    ConnectionState.none,
    ConnectionState.waiting,
    ConnectionState.active,
    ConnectionState.done,
  ];
  
  return Column(
    children: states.map((state) => Text(state.toString())).toList(),
  );
}
''';

      expect(
        () => interpreter.execute(code, 'testConnectionState'),
        returnsNormally,
      );
    });

    test('StreamController is available', () {
      const code = '''
import 'package:flutter/material.dart';
import 'dart:async';

Widget testStreamController() {
  final controller = StreamController<String>();
  
  // Ajouter quelques données
  controller.add("test1");
  controller.add("test2");
  
  return StreamBuilder<String>(
    stream: controller.stream,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!);
      }
      return Text('No data');
    },
  );
}
''';

      expect(
        () => interpreter.execute(code, 'testStreamController'),
        returnsNormally,
      );
    });

    test('Future utilities are available', () {
      const code = '''
import 'package:flutter/material.dart';
import 'dart:async';

Widget testFutureUtils() {
  // Test Future.value
  final valueFuture = Future<String>.value("immediate value");
  
  // Test Future.delayed
  final delayedFuture = Future<String>.delayed(
    Duration(milliseconds: 100), 
    () => "delayed value"
  );
  
  return Column(
    children: [
      FutureBuilder<String>(
        future: valueFuture,
        builder: (context, snapshot) {
          return Text('Value: \${snapshot.data ?? "loading"}');
        },
      ),
      FutureBuilder<String>(
        future: delayedFuture,
        builder: (context, snapshot) {
          return Text('Delayed: \${snapshot.data ?? "loading"}');
        },
      ),
    ],
  );
}
''';

      expect(
        () => interpreter.execute(code, 'testFutureUtils'),
        returnsNormally,
      );
    });

    test('Complex async widget interaction', () {
      const code = '''
import 'package:flutter/material.dart';
import 'dart:async';

Widget testComplexAsyncWidget() {
  final controller = StreamController<int>.broadcast();
  
  // Simulate periodic data
  Timer.periodic(Duration(milliseconds: 500), (timer) {
    if (timer.tick <= 3) {
      controller.add(timer.tick);
    } else {
      controller.close();
      timer.cancel();
    }
  });
  
  return Column(
    children: [
      StreamBuilder<int>(
        stream: controller.stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('No connection');
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return Text('Active: \${snapshot.data}');
            case ConnectionState.done:
              return Text('Done: \${snapshot.data}');
          }
        },
      ),
      FutureBuilder<String>(
        future: Future<String>.delayed(
          Duration(seconds: 2),
          () => "Future completed!"
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          }
          return Text(snapshot.data ?? 'No data');
        },
      ),
    ],
  );
}
''';

      expect(
        () => interpreter.execute(code, 'testComplexAsyncWidget'),
        returnsNormally,
      );
    });
  });
}
