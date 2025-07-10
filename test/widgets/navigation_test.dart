import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  group('Navigation Widgets Tests', () {
    late FlutterRunInterpreter interpreter;

    setUp(() {
      interpreter = FlutterRunInterpreter();
      interpreter.initialize();
    });

    tearDown(() {
      interpreter.dispose();
    });

    group('NavigationBar Widget (Material 3)', () {
      test('should create NavigationBar with destinations', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return NavigationBar(
              selectedIndex: 0,
              onDestinationSelected: (int index) {},
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create NavigationBar with custom styling', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return NavigationBar(
              selectedIndex: 1,
              height: 80,
              backgroundColor: Colors.blue[50],
              surfaceTintColor: Colors.blue,
              shadowColor: Colors.grey,
              onDestinationSelected: (int index) {},
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.search_outlined),
                  selectedIcon: Icon(Icons.search),
                  label: 'Search',
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('NavigationDestination Widget', () {
      test('should create NavigationDestination with basic properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create NavigationDestination with tooltip', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: 'Settings',
              tooltip: 'Settings Page',
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('NavigationDrawer Widget', () {
      test('should create NavigationDrawer with destinations', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return NavigationDrawer(
              selectedIndex: 0,
              onDestinationSelected: (int index) {},
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
                  child: Text(
                    'Mail',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                NavigationDrawerDestination(
                  icon: Icon(Icons.inbox),
                  label: Text('Inbox'),
                ),
                NavigationDrawerDestination(
                  icon: Icon(Icons.send),
                  label: Text('Sent'),
                ),
                Divider(indent: 28, endIndent: 28),
                NavigationDrawerDestination(
                  icon: Icon(Icons.drafts),
                  label: Text('Drafts'),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('NavigationDrawerDestination Widget', () {
      test(
        'should create NavigationDrawerDestination with basic properties',
        () {
          const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return NavigationDrawerDestination(
              icon: Icon(Icons.inbox_outlined),
              selectedIcon: Icon(Icons.inbox),
              label: Text('Inbox'),
            );
          }
        ''';

          final widget = interpreter.execute(code, 'build');
          expect(widget, isA<Widget>());
        },
      );

      test(
        'should create NavigationDrawerDestination with background color',
        () {
          const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return NavigationDrawerDestination(
              icon: Icon(Icons.star_outline),
              selectedIcon: Icon(Icons.star),
              label: Text('Starred'),
              backgroundColor: Colors.amber[50],
            );
          }
        ''';

          final widget = interpreter.execute(code, 'build');
          expect(widget, isA<Widget>());
        },
      );
    });

    group('TabBar Widget', () {
      test('should create TabBar with tabs', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return DefaultTabController(
              length: 3,
              child: TabBar(
                tabs: [
                  Tab(text: 'Tab 1'),
                  Tab(text: 'Tab 2'),
                  Tab(text: 'Tab 3'),
                ],
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create TabBar with icons and text', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return DefaultTabController(
              length: 3,
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                    text: 'Home',
                  ),
                  Tab(
                    icon: Icon(Icons.search),
                    text: 'Search',
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                    text: 'Profile',
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

    group('Tab Widget', () {
      test('should create Tab with text', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Tab(text: 'Home');
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Tab with icon and text', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Tab(
              icon: Icon(Icons.favorite),
              text: 'Favorites',
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create Tab with custom child', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star),
                  SizedBox(width: 8),
                  Text('Custom Tab'),
                ],
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('TabBarView Widget', () {
      test('should create TabBarView with children', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return DefaultTabController(
              length: 3,
              child: Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text('Content 1')),
                    Center(child: Text('Content 2')),
                    Center(child: Text('Content 3')),
                  ],
                ),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create TabBarView with physics', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return DefaultTabController(
              length: 2,
              child: Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      color: Colors.red[100],
                      child: Center(child: Text('Page 1')),
                    ),
                    Container(
                      color: Colors.blue[100],
                      child: Center(child: Text('Page 2')),
                    ),
                  ],
                ),
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('DefaultTabController Widget', () {
      test('should create DefaultTabController with basic properties', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'First'),
                      Tab(text: 'Second'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Text('First Tab Content'),
                        Text('Second Tab Content'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create DefaultTabController with initial index', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return DefaultTabController(
              length: 3,
              initialIndex: 1,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Tab 1'),
                      Tab(text: 'Tab 2'),
                      Tab(text: 'Tab 3'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Center(child: Text('Content 1')),
                        Center(child: Text('Content 2')),
                        Center(child: Text('Content 3')),
                      ],
                    ),
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

    group('PageView Widget', () {
      test('should create PageView with children', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return PageView(
              children: [
                Container(
                  color: Colors.red,
                  child: Center(child: Text('Page 1')),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(child: Text('Page 2')),
                ),
                Container(
                  color: Colors.green,
                  child: Center(child: Text('Page 3')),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create PageView with scroll direction', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return PageView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  color: Colors.orange,
                  child: Center(child: Text('Vertical Page 1')),
                ),
                Container(
                  color: Colors.purple,
                  child: Center(child: Text('Vertical Page 2')),
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });

    group('BottomNavigationBar Legacy', () {
      test('should create BottomNavigationBar with type fixed', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });

      test('should create BottomNavigationBar with shifting type', () {
        const code = '''
          import 'package:flutter/material.dart';
          
          Widget build() {
            return BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              currentIndex: 1,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                  backgroundColor: Colors.blue,
                ),
              ],
            );
          }
        ''';

        final widget = interpreter.execute(code, 'build');
        expect(widget, isA<Widget>());
      });
    });
  });
}
