# flutter_d4rt

[![pub package](https://img.shields.io/pub/v/flutter_d4rt.svg)](https://pub.dev/packages/flutter_d4rt)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A WIP Flutter package that provides a Dart interpreter based on the [d4rt](https://pub.dev/packages/d4rt) package. This allows you to execute Dart code dynamically at runtime and create Flutter widgets on-the-fly, enabling dynamic UI generation, and runtime code execution.


## 🚀 Getting Started

### Installation

Add `flutter_d4rt` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_d4rt: ^0.0.1
```

Then run:

```bash
flutter pub get
```

### Basic Setup

```dart
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InterpretedWidget(
      code: '''
        import 'package:flutter/material.dart';
        
        class MyDynamicApp extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              title: 'Dynamic Flutter App',
              home: Scaffold(
                appBar: AppBar(title: Text('Hello Dynamic World!')),
                body: Center(
                  child: Text('This UI was generated dynamically!'),
                ),
              ),
            );
          }
        }
      ''',
      entryPoint: 'MyDynamicApp',
    );
  }
}
```

## 📖 Usage

### Simple Widget Creation

Create a basic dynamic widget:

```dart
class SimpleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const dynamicCode = '''
      import 'package:flutter/material.dart';
      
      Widget createButton() {
        return ElevatedButton(
          onPressed: () => print('Dynamic button pressed!'),
          child: Text('Dynamic Button'),
        );
      }
    ''';

    return InterpretedWidget(
      code: dynamicCode,
      entryPoint: 'createButton',
    );
  }
}
```

### Advanced Usage with State Management

```dart
class AdvancedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const dynamicCode = '''
      import 'package:flutter/material.dart';
      
      class CounterController extends ChangeNotifier {
        int _count = 0;
        int get count => _count;
        
        void increment() {
          _count++;
          notifyListeners();
        }
      }
      
      class DynamicCounter extends StatelessWidget {
        final CounterController controller = CounterController();
        
        @override
        Widget build(BuildContext context) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(title: Text('Dynamic Counter')),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListenableBuilder(
                      listenable: controller,
                      builder: (context, child) {
                        return Text(
                          'Count: \${controller.count}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: controller.increment,
                      child: Text('Increment'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
    ''';

    return InterpretedWidget(
      code: dynamicCode,
      entryPoint: 'DynamicCounter',
      loadingWidget: CircularProgressIndicator(),
      onError: (error) => print('Error: $error'),
    );
  }
}
```

### Manual Interpreter Usage

For more control, use the interpreter directly:

```dart
class ManualInterpreterExample extends StatefulWidget {
  @override
  _ManualInterpreterExampleState createState() => _ManualInterpreterExampleState();
}

class _ManualInterpreterExampleState extends State<ManualInterpreterExample> {
  final FlutterRunInterpreter interpreter = FlutterRunInterpreter();
  Widget? dynamicWidget;

  @override
  void initState() {
    super.initState();
    _initializeInterpreter();
  }

  void _initializeInterpreter() async {
    // Initialize the interpreter
    interpreter.initialize();
    
    // Configure error handling
    interpreter.onError = (error) {
      print('Interpreter Error: $error');
    };
    
    // Execute code
    const code = '''
      import 'package:flutter/material.dart';
      
      Widget buildCard() {
        return Card(
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('Dynamic Card Content'),
          ),
        );
      }
    ''';
    
    final widget = interpreter.execute(code, 'buildCard');
    setState(() {
      dynamicWidget = widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manual Interpreter')),
      body: dynamicWidget ?? CircularProgressIndicator(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Clear cache and reload
          interpreter.clearCache();
          _initializeInterpreter();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  @override
  void dispose() {
    interpreter.dispose();
    super.dispose();
  }
}
```

### Performance and Caching

```dart
// Enable/disable caching
InterpretedWidget(
  code: dynamicCode,
  entryPoint: 'MyWidget',
  useCache: true, // Default: true
)

// Get cache statistics
final stats = interpreter.getCacheStats();
print('Cache size: ${stats['cacheSize']}');
print('Cache hit rate: ${stats['cacheHitRate']}');
print('Memory usage: ${stats['memoryUsage']} bytes');

// Clear cache manually
interpreter.clearCache();
```


## ⚙️ Configuration

### Custom Error Handling

```dart
final interpreter = FlutterRunInterpreter();

interpreter.onError = (error) {
  // Custom error handling
  logger.error('Interpreter error: $error');
  FirebaseCrashlytics.instance.recordError(error, null);
};

interpreter.onWarning = (warning) {
  // Custom warning handling
  logger.warning('Interpreter warning: $warning');
};
```

### Cache Configuration

```dart
// The cache expiry is set to 5 minutes by default
// You can clear it manually or let it expire automatically

// Clear all cached widgets
interpreter.clearCache();

// Get detailed cache information
final stats = interpreter.getCacheStats();
```

## 🔧 Advanced Features

### Custom Widget Registration

```dart
// Register custom bridged classes
interpreter.registerBridgedClass(
  myCustomWidgetDefinition,
  'package:my_package/my_widget.dart'
);
```

### Dynamic Source Loading

```dart
InterpretedWidget(
  code: mainCode,
  entryPoint: 'MyApp',
  sources: {
    'package:my_custom/utils.dart': utilsCode,
    'package:my_custom/widgets.dart': widgetsCode,
  },
)
```

## 🐛 Error Handling

flutter_d4rt provides comprehensive error handling:

```dart
InterpretedWidget(
  code: codeWithPotentialErrors,
  entryPoint: 'MyWidget',
  onError: (error) {
    // Handle interpretation errors
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Code Error'),
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  },
)
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

```bash
# Clone the repository
git clone https://github.com/kodjodevf/flutter_d4rt.git

# Install dependencies
flutter pub get

# Run tests
flutter test

# Run the example app
cd example
flutter run
```

## Acknowledgments

- Built on top of the [d4rt](https://pub.dev/packages/d4rt) package
- Inspired by Flutter's dynamic capabilities

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.