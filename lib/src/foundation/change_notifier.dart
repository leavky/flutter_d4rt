import 'package:d4rt/d4rt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClass for the Flutter Listenable interface.
BridgedClass getListenableBridgingDefinition() {
  return BridgedClass(
    nativeType: Listenable,
    name: 'Listenable',
    nativeNames: ["_MergingListenable"],
    constructors: {
      'merge': (visitor, positionalArgs, namedArgs) {
        final listenables = positionalArgs.get<Iterable>(0)!.map((item) {
          if (item is BridgedInstance) {
            return item.nativeObject;
          }
          return item;
        });

        return Listenable.merge(listenables.cast());
      },
    },
    methods: {
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as Listenable).addListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as Listenable).removeListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ValueListenable interface.
BridgedClass getValueListenableBridgingDefinition() {
  return BridgedClass(
    nativeType: ValueListenable,
    name: 'ValueListenable',
    getters: {'value': (visitor, target) => (target as ValueListenable).value},
    methods: {
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as ValueListenable).addListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as ValueListenable).removeListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ChangeNotifier class.
BridgedClass getChangeNotifierBridgingDefinition() {
  return BridgedClass(
    nativeType: ChangeNotifierBridge,
    name: 'ChangeNotifier',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        return ChangeNotifierBridge(
          visitor: visitor,
          instance: positionalArgs.get<dynamic>(0),
        );
      },
    },
    getters: {
      'hashCode': (visitor, target) =>
          (target as ChangeNotifierBridge).hashCode,
    },
    methods: {
      'addListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as ChangeNotifierBridge).addListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as ChangeNotifierBridge).removeListener(
            () => listener.call(visitor, [], {}),
          );
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
      'debugAssertNotDisposed': (visitor, target, positionalArgs, namedArgs) {
        return ChangeNotifier.debugAssertNotDisposed(
          target as ChangeNotifierBridge,
        );
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ValueNotifier class.
BridgedClass getValueNotifierBridgingDefinition() {
  return BridgedClass(
    nativeType: ValueNotifierBridge,
    name: 'ValueNotifier',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final value = positionalArgs.get<dynamic>(0);
        return ValueNotifierBridge(
          visitor: visitor,
          instance: positionalArgs.get<dynamic>(1),
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
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as ValueNotifierBridge).addListener(
            () => listener.call(visitor, [], {}),
          );
        }
        return null;
      },
      'removeListener': (visitor, target, positionalArgs, namedArgs) {
        final listener = positionalArgs.get<InterpretedFunction>(0);
        if (listener != null) {
          (target as ValueNotifierBridge).removeListener(
            () => listener.call(visitor, [], {}),
          );
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
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as ValueNotifierBridge).toString();
      },
    },
  );
}

/// Returns the BridgedClass for the Flutter ValueListenableBuilder widget.
BridgedClass getValueListenableBuilderBridgingDefinition() {
  return BridgedClass(
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

/// Returns the BridgedClass for the Flutter ListenableBuilder widget.
BridgedClass getListenableBuilderBridgingDefinition() {
  return BridgedClass(
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
    if (value == newValue) {
      return;
    }
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

  @override
  String toString() {
    return '${instance.klass.name}($value)';
  }
}
