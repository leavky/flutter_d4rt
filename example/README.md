# Flutter D4rt Example App

This example demonstrates the advanced capabilities of the Flutter D4rt package, showcasing how to build a complete Flutter application using interpreted Dart code.

## What This Example Demonstrates

### 🎨 **Advanced Theming System**
- Complete Material 3 theme configuration
- Dynamic theme switching (Light/Dark/System)
- Custom color schemes and component themes
- Theme state management with ChangeNotifier

### 🧭 **Navigation & State Management**
- Bottom navigation with multiple screens
- Stateful widgets with proper lifecycle management
- Navigation between screens with route management
- State preservation across navigation

### 📱 **Complex UI Components**
- Cards with custom styling and animations
- Lists with dynamic content and scrolling
- Forms with input validation and state
- Custom app bars and floating action buttons
- Responsive layout techniques

### ⚡ **Advanced Flutter Features**
- Animation controllers and transitions
- Stream builders and async operations
- Provider pattern for state management
- Custom widgets and reusable components
- Material Design 3 components

### 🔧 **Performance Optimizations**
- Widget recycling and efficient builds
- State management best practices
- Memory-efficient list handling
- Optimized theme switching

## Running the Example

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK (included with Flutter)
- An IDE with Flutter support (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-repo/flutter_d4rt.git
   cd flutter_d4rt/example
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the example:**
   ```bash
   flutter run
   ```

### Available Platforms
- ✅ Android
- ✅ iOS  
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## Example Features

### 🏠 **Home Screen**
- Welcome message with dynamic theming
- Feature showcase cards
- Theme toggle functionality
- Animated transitions

### 📋 **List Screen**
- Dynamic list generation
- Custom list items with Material design
- Scroll performance optimization
- Interactive elements

### 👤 **Profile Screen**
- User profile mockup
- Form inputs and validation
- Settings and preferences
- Theme switching controls

### 🔍 **Detail Screen**
- Navigation with parameters
- Detailed content display
- Back navigation handling
- Context-aware theming

## Code Structure

The example is built entirely using Flutter D4rt's interpreted code system:

```dart
import 'package:flutter_d4rt/flutter_d4rt.dart';

// The entire app is defined as interpreted Dart code
final String code = '''
  import 'package:flutter/material.dart';
  
  // Your complete Flutter app code here
  class MyApp extends StatelessWidget {
    // ... app implementation
  }
''';

// The app is rendered using InterpretedWidget
class MyAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InterpretedWidget(
      code: code, 
      entryPoint: 'MyApp'
    );
  }
}
```

## Learning Resources

### 📚 **Flutter D4rt Documentation**
- [Main README](../README.md) - Getting started guide
- [API Documentation](../API.md) - Complete API reference
- [Advanced Examples](../EXAMPLES.md) - More usage patterns
- [Contributing Guide](../CONTRIBUTING.md) - Development setup

### 🎯 **Key Learning Points**
1. **Interpreted Code Execution**: See how complex Flutter apps can be built and executed from string-based Dart code
2. **State Management**: Learn provider patterns and state management within interpreted widgets
3. **Theme Management**: Understand dynamic theming and Material 3 implementation
4. **Navigation**: Master Flutter navigation patterns in interpreted code
5. **Performance**: Observe best practices for smooth, responsive UIs

### 🚀 **Next Steps**
- Modify the theme colors and see real-time changes
- Add new screens and navigation routes
- Implement your own state management patterns
- Experiment with animations and transitions
- Test performance with larger datasets

## Troubleshooting

### Common Issues

**App not starting:**
- Ensure Flutter SDK is properly installed: `flutter doctor`
- Check dependencies: `flutter pub get`
- Verify platform support: `flutter config --enable-<platform>`

**Hot reload not working:**
- Use `flutter run` instead of interpreted code hot reload
- Restart the app to see interpreted code changes
- Check for syntax errors in the interpreted code string

**Theme not switching:**
- Verify ChangeNotifier implementation
- Check ListenableBuilder widget usage
- Ensure proper state management setup

## Contributing

Found an issue or want to improve the example? See our [Contributing Guide](../CONTRIBUTING.md) for:
- Code style guidelines
- Testing procedures  
- Documentation standards
- Pull request process

## License

This example is part of the Flutter D4rt project and is licensed under the MIT License. See [LICENSE](../LICENSE) for details.
