import 'package:flutter_test/flutter_test.dart';

// Import all widget test suites
import 'basic_test.dart' as basic_tests;
import 'material_test.dart' as material_tests;
import 'input_test.dart' as input_tests;
import 'navigation_test.dart' as navigation_tests;
import 'animation_test.dart' as animation_tests;
import 'scrollable_test.dart' as scrollable_tests;

void main() {
  group('Flutter Run - All Widgets Tests', () {
    group('Basic Widgets', basic_tests.main);
    group('Material Widgets', material_tests.main);
    group('Input Widgets', input_tests.main);
    group('Navigation Widgets', navigation_tests.main);
    group('Animation Widgets', animation_tests.main);
    group('Scrollable Widgets', scrollable_tests.main);
  });
}
