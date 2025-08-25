# Changelog

## [0.0.3] - 2025-08-25

- feat: Add StreamBuilder, FutureBuilder, and Timer examples to DartPad clone
- fix: Update d4rt dependency version to ^0.1.4, enhance icon support in Flutter, fix StreamBuilder and FutureBuilder bridge

## [0.0.2] - 2025-08-04

- Add counter example
- Refactor widget bridging definitions to use a centralized `toDouble` utility function for type conversion
- Updated all widget bridging functions to return BridgedClass.
- Enhanced type safety by specifying dynamic types in named arguments.

## [0.0.1] - 2025-07-10

### Added

#### Core Features
- **FlutterRunInterpreter**: Main interpreter class for dynamic Dart code execution
- **InterpretedWidget**: High-level widget for easy integration of dynamic code
- **Dynamic Widget Creation**: Convert Dart code strings to Flutter widgets at runtime
- **Comprehensive Widget Support**: Full support for Material Design and Flutter core widgets

#### Performance Features
- **Intelligent Caching**: Automatic widget caching with 5-minute expiration
- **Cache Management**: Methods to clear cache and get performance statistics
- **Memory Optimization**: Efficient memory usage with automatic cache cleanup
- **Performance Monitoring**: Built-in cache hit rate and memory usage tracking

#### Developer Experience
- **Error Handling**: Robust error handling with detailed logging
- **Custom Error Callbacks**: Configurable error and warning handlers
- **Hot Reload Support**: Automatic reloading when code changes
- **Loading States**: Customizable loading widgets during compilation
- **Debug Logging**: Comprehensive logging for development and debugging

#### Framework Integration
- **Foundation Support**: ChangeNotifier, ValueNotifier, and state management
- **Gesture System**: Complete gesture recognition and handling
- **Material Design**: Full Material Design component library
- **Painting System**: Colors, borders, text styles, and decorations
- **Layout Widgets**: Row, Column, Stack, Container, and positioning
- **UI Primitives**: Low-level UI components and geometry

#### Advanced Features
- **Custom Sources**: Support for additional source files and dependencies
- **Parameter Passing**: Pass arguments to executed functions and constructors
- **Resource Management**: Proper disposal and cleanup of interpreter resources
- **Thread Safety**: Safe initialization and execution in Flutter environment

### Framework Components

#### Supported Widget Categories
- **Material Components**: MaterialApp, Scaffold, AppBar, Buttons, Cards, etc.
- **Layout Widgets**: Container, Row, Column, Stack, Padding, Center, etc.
- **Input Widgets**: TextField, Checkbox, Radio, Switch, Slider, etc.
- **Display Widgets**: Text, Icon, Image, Card, Chip, etc.
- **Navigation**: BottomNavigationBar, Tabs, Drawer, PageView, etc.
- **Scrolling**: ListView, GridView, ScrollView, etc.
- **State Management**: StatelessWidget, StatefulWidget, ChangeNotifier, etc.

#### Supported Packages
- `package:flutter/material.dart` - Complete Material Design library
- `package:flutter/widgets.dart` - Core Flutter widgets
- `package:flutter/foundation.dart` - Foundation classes and utilities
- `package:flutter/gestures.dart` - Gesture recognition system
- `package:flutter/painting.dart` - Painting and styling
- `package:flutter/rendering.dart` - Low-level rendering
- `dart:ui` - UI primitives and geometry

### Documentation
- **Comprehensive README**: Complete user guide with examples
- **API Documentation**: Detailed dartdoc comments for all public APIs
- **Usage Examples**: Multiple examples from basic to advanced usage
- **Performance Guidelines**: Best practices for optimal performance
- **Error Handling Guide**: Comprehensive error handling strategies

### Testing
- **Unit Tests**: Core functionality testing
- **Widget Tests**: UI component testing
- **Integration Tests**: End-to-end testing scenarios
- **Performance Tests**: Cache and memory usage testing

### Example Application
- **Full Demo App**: Complete example showcasing all features
- **Theme Management**: Dynamic theme switching demonstration
- **State Management**: ChangeNotifier and state management examples
- **Complex UI**: Advanced Material Design implementation
- **Performance Demo**: Caching and performance optimization examples

### Known Limitations
- **Security**: Dynamic code execution requires careful input validation
- **Performance**: Initial compilation may be slower than static widgets
- **Debugging**: Limited debugging support for dynamic code
- **Platform**: Currently optimized for mobile platforms

### Dependencies
- `d4rt: ^0.0.9` - Core Dart interpreter
- `flutter: >=1.17.0` - Flutter framework
- `sdk: ^3.8.1` - Dart SDK requirement

