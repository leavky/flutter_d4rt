# API Documentation - flutter_d4rt

This document provides detailed API documentation for the flutter_d4rt package.

## Table of Contents

- [FlutterRunInterpreter](#flutterruninterpreter)
- [InterpretedWidget](#interpretedwidget)
- [Error Handling](#error-handling)
- [Performance](#performance)
- [Supported Widgets](#supported-widgets)

## FlutterRunInterpreter

The core class for dynamic Dart code execution and widget creation.

### Constructor

```dart
FlutterRunInterpreter()
```

Creates a new interpreter instance. Must call `initialize()` before use.

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `onError` | `Function(String)?` | Callback for handling execution errors |
| `onWarning` | `Function(String)?` | Callback for handling warnings |

### Methods

#### initialize()

```dart
void initialize()
```

Initializes the interpreter and preloads Flutter framework sources. Must be called before executing any code.

**Throws:**
- Any exception from the underlying D4rt interpreter

#### execute()

```dart
Widget execute(
  String code,
  String functionName, {
  bool useCache = true,
  Map<String, String>? sources,
  Object? args,
})
```

Executes Dart code and returns a Widget.

**Parameters:**
- `code`: Dart code string to execute
- `functionName`: Entry point function/class name
- `useCache`: Enable caching (default: true)
- `sources`: Additional source files
- `args`: Arguments to pass to the function

**Returns:** Widget or error widget

**Throws:**
- `StateError` if not initialized

#### clearCache()

```dart
void clearCache()
```

Clears all cached widgets and timestamps.

#### getCacheStats()

```dart
Map<String, dynamic> getCacheStats()
```

Returns cache performance statistics.

**Returns:**
```dart
{
  'cacheSize': int,      // Number of cached widgets
  'cacheHitRate': double, // Cache hit rate (0.0-1.0)
  'memoryUsage': int,    // Estimated memory usage in bytes
}
```

#### registerBridgedClass()

```dart
void registerBridgedClass(BridgedClassDefinition definition, String uri)
```

Registers a custom bridged class with the interpreter.

#### getErrorLogs()

```dart
List<String> getErrorLogs()
```

Returns all logged errors with timestamps.

#### clearErrorLogs()

```dart
void clearErrorLogs()
```

Clears the internal error log.

#### dispose()

```dart
void dispose()
```

Disposes interpreter resources and clears caches.

---

## InterpretedWidget

A StatefulWidget that provides high-level interface for dynamic code execution.

### Constructor

```dart
const InterpretedWidget({
  Key? key,
  required String code,
  String entryPoint = 'MyApp',
  Widget? loadingWidget,
  Function(String error)? onError,
  bool useCache = true,
  Map<String, String>? sources,
  Object? args,
})
```

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `code` | `String` | required | Dart code to execute |
| `entryPoint` | `String` | `'MyApp'` | Function/class name to execute |
| `loadingWidget` | `Widget?` | `null` | Widget shown during loading |
| `onError` | `Function(String)?` | `null` | Error callback |
| `useCache` | `bool` | `true` | Enable caching |
| `sources` | `Map<String, String>?` | `null` | Additional sources |
| `args` | `Object?` | `null` | Arguments for the function |

### State Methods

The widget automatically manages its lifecycle:

1. **initState()**: Initializes interpreter and executes code
2. **didUpdateWidget()**: Reloads when code/entryPoint changes
3. **dispose()**: Cleans up interpreter resources

### Public Methods

#### reload()

```dart
void reload()
```

Manually reloads the dynamic code. Useful for refresh functionality.

---

## Error Handling

### Error Types

1. **Initialization Errors**: Thrown during interpreter setup
2. **Compilation Errors**: Syntax errors in provided code
3. **Runtime Errors**: Exceptions during widget creation
4. **State Errors**: Using uninitialized interpreter

### Error Widget

When execution fails, an error widget is automatically displayed:

```dart
MaterialApp(
  home: Scaffold(
    body: Container(
      child: Column(
        children: [
          Icon(Icons.error, color: Colors.red),
          Text('Code Execution Error'),
          Text(errorMessage),
        ],
      ),
    ),
  ),
)
```

### Custom Error Handling

```dart
// Interpreter level
interpreter.onError = (error) {
  print('Error: $error');
  // Log to analytics, show notification, etc.
};

// Widget level
InterpretedWidget(
  code: code,
  onError: (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to load: $error')),
    );
  },
)
```

---

## Performance

### Caching System

The interpreter uses an intelligent caching system:

- **Cache Key**: Generated from function name + code hash
- **Expiration**: 5 minutes (configurable)
- **Memory Management**: Automatic cleanup of expired entries
- **Statistics**: Built-in performance monitoring

### Best Practices

1. **Enable Caching**: Keep `useCache: true` for production
2. **Monitor Memory**: Use `getCacheStats()` regularly
3. **Clear When Needed**: Call `clearCache()` if memory usage is high
4. **Optimize Code**: Write efficient Dart code for better performance

### Performance Monitoring

```dart
final stats = interpreter.getCacheStats();
print('Cache size: ${stats['cacheSize']} widgets');
print('Hit rate: ${(stats['cacheHitRate'] * 100).toStringAsFixed(1)}%');
print('Memory: ${(stats['memoryUsage'] / 1024).toStringAsFixed(1)} KB');

// Clear cache if memory usage exceeds threshold
if (stats['memoryUsage'] > 10 * 1024 * 1024) { // 10MB
  interpreter.clearCache();
}
```


## Examples

### Basic Widget Creation

```dart
const code = '''
import 'package:flutter/material.dart';

Widget createGreeting() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text(
      'Hello from dynamic code!',
      style: TextStyle(fontSize: 24),
    ),
  );
}
''';

final widget = interpreter.execute(code, 'createGreeting');
```

### Stateful Widget with State Management

```dart
const code = '''
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: \$count'),
        ElevatedButton(
          onPressed: () => setState(() => count++),
          child: Text('Increment'),
        ),
      ],
    );
  }
}
''';

final widget = interpreter.execute(code, 'Counter');
```

### Complex Application

```dart
const code = '''
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Dynamic Content')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('This is a dynamic card!'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => print('Dynamic button pressed'),
                child: Text('Press Me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
''';

InterpretedWidget(code: code, entryPoint: 'MyApp')
```
