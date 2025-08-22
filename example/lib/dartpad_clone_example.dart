import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  runApp(const DartPadApp());
}

// Intent for keyboard shortcuts
class _RunCodeIntent extends Intent {
  const _RunCodeIntent();
}

class DartPadApp extends StatelessWidget {
  const DartPadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DartPad Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: ThemeData.light().textTheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme,
      ),
      home: const DartPadScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DartPadScreen extends StatefulWidget {
  const DartPadScreen({super.key});

  @override
  State<DartPadScreen> createState() => _DartPadScreenState();
}

class _DartPadScreenState extends State<DartPadScreen> {
  late TextEditingController _codeController;
  String _currentCode = _defaultCode;
  bool _isRunning = false;
  String? _error;
  bool _isVerticalSplit = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentLine = 1;
  int _currentColumn = 1;

  static const String _defaultCode = '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DartPad Example'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '\$_counter',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text('Increment'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}''';

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: _currentCode);
    _codeController.addListener(_onTextChanged);
    _runCode(); // Auto-run on start
  }

  void _onTextChanged() {
    setState(() {
      _currentCode = _codeController.text;
      _updateCursorPosition();
    });
  }

  void _updateCursorPosition() {
    final text = _codeController.text;
    final selection = _codeController.selection;
    if (selection.isValid) {
      final lines = text.substring(0, selection.start).split('\n');
      setState(() {
        _currentLine = lines.length;
        _currentColumn = lines.last.length + 1;
      });
    }
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _runCode() {
    setState(() {
      _isRunning = true;
      _error = null;
      _currentCode = _codeController.text;
    });

    // Simulate compilation delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isRunning = false;
        });

        // Show success feedback if no errors
        if (_error == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.play_circle_filled, color: Colors.white, size: 16),
                  SizedBox(width: 8),
                  Text('Code executed successfully'),
                ],
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 1),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    });
  }

  void _resetCode() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 8),
              Text('Reset Code'),
            ],
          ),
          content: Text(
            'Are you sure you want to reset the code to the default template? All current changes will be lost.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _codeController.text = _defaultCode;
                  _currentCode = _defaultCode;
                  _error = null;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(Icons.refresh, color: Colors.white, size: 16),
                        SizedBox(width: 8),
                        Text('Code reset to default'),
                      ],
                    ),
                    backgroundColor: Colors.blue,
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: Text('Reset'),
            ),
          ],
        );
      },
    );
  }

  void _copyCode() {
    Clipboard.setData(ClipboardData(text: _codeController.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 16),
            SizedBox(width: 8),
            Text('Code copied to clipboard'),
          ],
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _formatCode() {
    try {
      // Simple indentation formatting with improved logic
      final lines = _codeController.text.split('\n');
      final formattedLines = <String>[];
      int indentLevel = 0;

      for (String line in lines) {
        final trimmed = line.trim();

        // Handle closing braces first
        if (trimmed.startsWith('}')) {
          indentLevel = (indentLevel - 1).clamp(0, 20);
          formattedLines.add('  ' * indentLevel + trimmed);
        }
        // Handle opening braces
        else if (trimmed.endsWith('{')) {
          formattedLines.add('  ' * indentLevel + trimmed);
          indentLevel++;
        }
        // Handle other lines
        else if (trimmed.isNotEmpty) {
          formattedLines.add('  ' * indentLevel + trimmed);
        } else {
          formattedLines.add('');
        }
      }

      setState(() {
        _codeController.text = formattedLines.join('\n');
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.auto_fix_high, color: Colors.white, size: 16),
              SizedBox(width: 8),
              Text('Code formatted successfully'),
            ],
          ),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.white, size: 16),
              SizedBox(width: 8),
              Text('Failed to format code'),
            ],
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _onCodeError(String error) {
    setState(() {
      _error = error;
      _isRunning = false;
    });

    // Show error feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error, color: Colors.white, size: 16),
            SizedBox(width: 8),
            Expanded(child: Text('Compilation failed')),
          ],
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'DETAILS',
          textColor: Colors.white,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Row(
                  children: [
                    Icon(Icons.bug_report, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Compilation Error'),
                  ],
                ),
                content: SingleChildScrollView(
                  child: Text(
                    error,
                    style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSamples() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SampleCodeSheet(
        onCodeSelected: (code) {
          setState(() {
            _codeController.text = code;
            _currentCode = code;
            _error = null; // Clear any existing errors
          });
          Navigator.pop(context);

          // Auto-run the selected sample
          _runCode();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.enter):
            const _RunCodeIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.enter):
            const _RunCodeIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          _RunCodeIntent: CallbackAction<_RunCodeIntent>(
            onInvoke: (_RunCodeIntent intent) {
              if (!_isRunning) _runCode();
              return null;
            },
          ),
        },
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Text('Flutter DartPad Clone'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                icon: Icon(
                  _isVerticalSplit ? Icons.view_agenda : Icons.view_column,
                ),
                tooltip: 'Toggle Layout',
                onPressed: () {
                  setState(() {
                    _isVerticalSplit = !_isVerticalSplit;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.copy),
                tooltip: 'Copy Code (Ctrl+C)',
                onPressed: _copyCode,
              ),
              IconButton(
                icon: const Icon(Icons.auto_fix_high),
                tooltip: 'Format Code (Ctrl+Shift+F)',
                onPressed: _formatCode,
              ),
              IconButton(
                icon: const Icon(Icons.code),
                tooltip: 'Sample Code',
                onPressed: _showSamples,
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Reset to Default',
                onPressed: _resetCode,
              ),
              const SizedBox(width: 8),
              FilledButton.icon(
                onPressed: _isRunning ? null : _runCode,
                icon: _isRunning
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.play_arrow),
                label: Text(_isRunning ? 'Running...' : 'Run (Cmd+Enter)'),
              ),
              const SizedBox(width: 16),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: _isVerticalSplit
                    ? Column(
                        children: [
                          Expanded(child: _buildCodeEditor()),
                          const Divider(height: 1, thickness: 1),
                          Expanded(child: _buildPreview()),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(child: _buildCodeEditor()),
                          const VerticalDivider(width: 1, thickness: 1),
                          Expanded(child: _buildPreview()),
                        ],
                      ),
              ),
              _buildStatusBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCodeEditor() {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.code,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  'main.dart',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(),
                if (_error != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error, size: 12, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          'Error',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Numérotation des lignes
                Container(
                  width: 50,
                  color: Colors.grey[100],
                  child: Column(
                    children: [
                      Container(
                        height: 48, // Hauteur de la barre d'outils
                        color: Colors.grey[200],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: List.generate(
                              _currentCode.split('\n').length,
                              (index) => Container(
                                height: 19.6, // 14 * 1.4 (fontSize * height)
                                padding: EdgeInsets.only(right: 8),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    fontFamily: 'monospace',
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Éditeur de code
                Expanded(
                  child: TextField(
                    controller: _codeController,
                    maxLines: null,
                    expands: true,
                    onTap: () {
                      // Mettre à jour la position après un délai pour que la sélection soit mise à jour
                      Future.delayed(
                        Duration(milliseconds: 10),
                        _updateCursorPosition,
                      );
                    },
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 14,
                      height: 1.4,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                      hintText: 'Write your Flutter code here...',
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_error != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.red.shade50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _error!,
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPreview() {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.phone_android,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(width: 8),
                Text('Preview', style: Theme.of(context).textTheme.titleSmall),
                const Spacer(),
                if (_isRunning)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _isRunning
                    ? const Center(child: CircularProgressIndicator())
                    : InterpretedWidget(
                        code: _currentCode,
                        entryPoint: 'MyWidget',
                        onError: _onCodeError,
                        loadingWidget: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 24,
      color: Colors.blueGrey[100],
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(Icons.code, size: 16, color: Colors.blueGrey[600]),
          const SizedBox(width: 8),
          Text(
            'Line $_currentLine, Column $_currentColumn',
            style: TextStyle(fontSize: 12, color: Colors.blueGrey[700]),
          ),
          const Spacer(),
          if (_isRunning) ...[
            SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.blue[600],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Running...',
              style: TextStyle(fontSize: 12, color: Colors.blue[600]),
            ),
          ] else if (_error != null) ...[
            Icon(Icons.error, size: 16, color: Colors.red[600]),
            const SizedBox(width: 4),
            Text(
              'Error',
              style: TextStyle(fontSize: 12, color: Colors.red[600]),
            ),
          ] else ...[
            Icon(Icons.check_circle, size: 16, color: Colors.green[600]),
            const SizedBox(width: 4),
            Text(
              'Ready',
              style: TextStyle(fontSize: 12, color: Colors.green[600]),
            ),
          ],
        ],
      ),
    );
  }
}

class SampleCodeSheet extends StatelessWidget {
  final Function(String) onCodeSelected;

  const SampleCodeSheet({super.key, required this.onCodeSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Sample Code',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: _sampleCodes.map((sample) {
                return Card(
                  child: ListTile(
                    title: Text(sample['title']!),
                    subtitle: Text(sample['description']!),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () => onCodeSelected(sample['code']!),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  static final List<Map<String, String>> _sampleCodes = [
    {
      'title': 'Hello World',
      'description': 'Simple text display',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Text(
            'Hello, Flutter World!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Counter App',
      'description': 'Stateful widget with counter',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Button pressed:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '\$_counter times',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'ListView Example',
      'description': 'Scrollable list of items',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Example'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('\${index + 1}'),
              ),
              title: Text('Item \${index + 1}'),
              subtitle: Text('This is item number \${index + 1}'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle tap
              },
            );
          },
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Form Example',
      'description': 'Input form with validation',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Example'),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _name = value ?? '',
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _email = value ?? '',
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form submitted!')),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Animated Container',
      'description': 'Container with smooth animations',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: _isExpanded ? 200 : 100,
                height: _isExpanded ? 200 : 100,
                decoration: BoxDecoration(
                  color: _isExpanded ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(_isExpanded ? 50 : 10),
                ),
                child: Icon(
                  _isExpanded ? Icons.favorite : Icons.star,
                  color: Colors.white,
                  size: _isExpanded ? 50 : 30,
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(_isExpanded ? 'Shrink' : 'Expand'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'StreamBuilder Example',
      'description': 'Real-time data stream with StreamBuilder',
      'code': '''import 'package:flutter/material.dart';
import 'dart:async';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late StreamController<int> _streamController;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<int>();
    
    // Emit a new value every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_streamController.isClosed) {
        _streamController.add(_counter++);
      }
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('StreamBuilder Example'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Real-time Counter:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              StreamBuilder<int>(
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      'Error: \${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    );
                  }
                  
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  
                  return Text(
                    '\${snapshot.data}',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'FutureBuilder Example',
      'description': 'Async data loading with FutureBuilder',
      'code': '''import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late Future<String> _futureData;

  Future<String> _fetchData() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 3));
    
    // Simulate random success/failure
    if (DateTime.now().millisecond % 2 == 0) {
      return 'Data loaded successfully!';
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureData = _fetchData();
  }

  void _refreshData() {
    setState(() {
      _futureData = _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder Example'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<String>(
                future: _futureData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Loading data...'),
                      ],
                    );
                  }
                  
                  if (snapshot.hasError) {
                    return Column(
                      children: [
                        Icon(Icons.error, color: Colors.red, size: 64),
                        SizedBox(height: 16),
                        Text(
                          'Error: \${snapshot.error}',
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }
                  
                  return Column(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 64),
                      SizedBox(height: 16),
                      Text(
                        snapshot.data ?? 'No data',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _refreshData,
                child: Text('Refresh Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
    },
    {
      'title': 'Timer Example',
      'description': 'Countdown timer with periodic updates',
      'code': '''import 'package:flutter/material.dart';
import 'dart:async';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Timer? _timer;
  int _seconds = 60;
  bool _isRunning = false;

  void _startTimer() {
    if (_timer != null) return;
    
    setState(() {
      _isRunning = true;
    });
    
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _stopTimer();
          _showCompletionDialog();
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _seconds = 60;
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Timer Complete!'),
        content: Text('The countdown has finished.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetTimer();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '\${minutes.toString().padLeft(2, '0')}:\${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer Example'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Countdown Timer',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              Container(
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  _formatTime(_seconds),
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isRunning ? null : _startTimer,
                    child: Text('Start'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _isRunning ? _stopTimer : null,
                    child: Text('Stop'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _resetTimer,
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}''',
    },
  ];
}
