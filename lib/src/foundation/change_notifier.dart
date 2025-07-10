import 'package:d4rt/d4rt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClassDefinition for the Flutter ChangeNotifier class.
BridgedClassDefinition getChangeNotifierBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ChangeNotifierBridge,
    name: 'ChangeNotifier',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ChangeNotifierBridge(
          visitor: visitor,
          instance: positionalArgs.get(0),
        );
      },
    },
    getters: {
      'hashCode': (visitor, target) =>
          (target as ChangeNotifierBridge).hashCode,
    },
    methods: {
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<VoidCallback>(0);
        if (listener != null) {
          (target as ChangeNotifierBridge).addListener(listener);
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<VoidCallback>(0);
        if (listener != null) {
          (target as ChangeNotifierBridge).removeListener(listener);
        }
        return null;
      },
      'notifyListeners': (visitor, target, positionalArgs, namedArgs) {
        (target as ChangeNotifierBridge).notifyListeners();
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as ChangeNotifierBridge).dispose();
        return null;
      },
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter ValueNotifier class.
BridgedClassDefinition getValueNotifierBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ValueNotifierBridge,
    name: 'ValueNotifier',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.get(0);
        return ValueNotifierBridge(
          visitor: visitor,
          instance: positionalArgs.get(1),
          initialValue: value,
        );
      },
    },
    getters: {
      'value': (visitor, target) => (target as ValueNotifierBridge).value,
    },
    setters: {
      'value': (visitor, target, value) {
        (target as ValueNotifierBridge).value = value;
      },
    },
    methods: {
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<VoidCallback>(0);
        if (listener != null) {
          (target as ValueNotifierBridge).addListener(listener);
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<VoidCallback>(0);
        if (listener != null) {
          (target as ValueNotifierBridge).removeListener(listener);
        }
        return null;
      },
      'notifyListeners': (visitor, target, positionalArgs, namedArgs) {
        (target as ValueNotifierBridge).notifyListeners();
        return null;
      },
      'dispose': (visitor, target, positionalArgs, namedArgs) {
        (target as ValueNotifierBridge).dispose();
        return null;
      },
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter ValueListenableBuilder widget.
BridgedClassDefinition getValueListenableBuilderBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ValueListenableBuilder,
    name: 'ValueListenableBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final valueListenable = namedArgs.get<ValueListenable>(
          'valueListenable',
        );
        final builderFunction = namedArgs['builder'];
        final child = namedArgs['child'] != null
            ? visitor.toWidgets(namedArgs['child'])
            : null;

        // Convert the interpreted builder function to a native one
        Widget Function(BuildContext, dynamic, Widget?) builder;
        if (builderFunction is InterpretedFunction) {
          builder = (context, value, child) {
            final result = builderFunction.call(visitor, [
              context,
              value,
              child,
            ]);
            return visitor.toWidgets(result);
          };
        } else {
          throw RuntimeError(
            'builder must be a function for ValueListenableBuilder',
          );
        }

        return ValueListenableBuilder(
          key: key,
          valueListenable: valueListenable!,
          builder: builder,
          child: child,
        );
      },
    },
    getters: {
      'valueListenable': (visitor, target) =>
          (target as ValueListenableBuilder).valueListenable,
      'key': (visitor, target) => (target as ValueListenableBuilder).key,
    },
  );
}

/// Returns the BridgedClassDefinition for the Flutter ListenableBuilder widget.
BridgedClassDefinition getListenableBuilderBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ListenableBuilder,
    name: 'ListenableBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final key = namedArgs.get<Key?>('key');
        final listenableInstance = namedArgs.get<InterpretedInstance?>(
          'listenable',
        );

        // Check if the instance already has a bridged super object
        ChangeNotifierBridge listenable;
        if (listenableInstance!.bridgedSuperObject is ChangeNotifierBridge) {
          listenable =
              listenableInstance.bridgedSuperObject as ChangeNotifierBridge;
        } else {
          listenable = ChangeNotifierBridge(
            visitor: visitor,
            instance: listenableInstance,
          );
        }

        final builderFunction = namedArgs['builder'];
        final child = namedArgs['child'] != null
            ? visitor.toWidgets(namedArgs['child'])
            : null;

        // Convert the interpreted builder function to a native one
        Widget Function(BuildContext, Widget?) builder;
        if (builderFunction is InterpretedFunction) {
          builder = (context, child) {
            final result = builderFunction.call(visitor, [context, child]);
            return visitor.toWidgets(result);
          };
        } else {
          throw RuntimeError(
            'builder must be a function for ListenableBuilder',
          );
        }

        return ListenableBuilder(
          key: key,
          listenable: listenable,
          builder: builder,
          child: child,
        );
      },
    },
    getters: {
      'listenable': (visitor, target) =>
          (target as ListenableBuilder).listenable,
      'key': (visitor, target) => (target as ListenableBuilder).key,
    },
  );
}

/// Bridge class for ChangeNotifier that connects to d4rt interpreted instances
class ChangeNotifierBridge extends ChangeNotifier {
  final InterpreterVisitor visitor;
  final InterpretedInstance instance;

  ChangeNotifierBridge({required this.visitor, required this.instance}) {
    instance.bridgedSuperObject = this;
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
    final fn = instance.klass.findInstanceMethod('notifyListeners');
    if (fn != null) {
      fn.bind(instance).call(visitor, [], {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    final fn = instance.klass.findInstanceMethod('dispose');
    if (fn != null) {
      fn.bind(instance).call(visitor, [], {});
    }
  }

  /// Called when the interpreted instance calls notifyListeners()
  /// to trigger notification to native listeners
  void notifyListenersFromNative() {
    super.notifyListeners();
  }
}

/// Bridge class for ValueNotifier that connects to d4rt interpreted instances
class ValueNotifierBridge<T> extends ValueNotifier<T> {
  final InterpreterVisitor visitor;
  final InterpretedInstance instance;

  ValueNotifierBridge({
    required this.visitor,
    required this.instance,
    required T initialValue,
  }) : super(initialValue) {
    instance.bridgedSuperObject = this;
  }

  @override
  T get value {
    final interpretedValue = instance.get('value');
    if (interpretedValue is T) {
      return interpretedValue;
    }
    return super.value;
  }

  @override
  set value(T newValue) {
    instance.set('value', newValue, visitor);
    super.value = newValue;
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
    final fn = instance.klass.findInstanceMethod('notifyListeners');
    if (fn != null) {
      fn.bind(instance).call(visitor, [], {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    final fn = instance.klass.findInstanceMethod('dispose');
    if (fn != null) {
      fn.bind(instance).call(visitor, [], {});
    }
  }
}
