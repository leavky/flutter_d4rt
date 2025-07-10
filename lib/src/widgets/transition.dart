import 'package:d4rt/d4rt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_d4rt/utils/extensions/widget.dart';

/// Returns the BridgedClassDefinition for AnimatedBuilder
BridgedClassDefinition getAnimatedBuilderBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: AnimatedBuilder,
    name: 'AnimatedBuilder',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final animation = namedArgs.get<Listenable>('animation');
        final builder = namedArgs['builder'];
        final child = visitor.toWidgets(namedArgs['child']);
        final key = namedArgs.get<Key?>('key');

        return AnimatedBuilder(
          key: key,
          animation: animation!,
          builder: (BuildContext context, Widget? child) {
            // Call the interpreted builder function
            if (builder is InterpretedFunction) {
              final result = builder.call(visitor, [context, child], {});
              return visitor.toWidgets(result);
            } else {
              throw RuntimeError('AnimatedBuilder builder must be a function');
            }
          },
          child: child,
        );
      },
    },
  );
}

/// Returns the BridgedClassDefinition for FadeTransition
BridgedClassDefinition getFadeTransitionBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: FadeTransition,
    name: 'FadeTransition',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final opacity = namedArgs.get<Animation<double>>('opacity');
        final alwaysIncludeSemantics =
            namedArgs.get<bool?>('alwaysIncludeSemantics') ?? false;
        final child = visitor.toWidgets(namedArgs['child']);
        final key = namedArgs.get<Key?>('key');

        return FadeTransition(
          key: key,
          opacity: opacity!,
          alwaysIncludeSemantics: alwaysIncludeSemantics,
          child: child,
        );
      },
    },
    getters: {
      'opacity': (visitor, target) => (target as FadeTransition).opacity,
      'alwaysIncludeSemantics': (visitor, target) =>
          (target as FadeTransition).alwaysIncludeSemantics,
    },
  );
}

/// Returns the BridgedClassDefinition for ScaleTransition
BridgedClassDefinition getScaleTransitionBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: ScaleTransition,
    name: 'ScaleTransition',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final scale = namedArgs.get<Animation<double>>('scale');
        final alignment =
            namedArgs.get<Alignment?>('alignment') ?? Alignment.center;
        final filterQuality = namedArgs.get<FilterQuality?>('filterQuality');
        final child = visitor.toWidgets(namedArgs['child']);
        final key = namedArgs.get<Key?>('key');

        return ScaleTransition(
          key: key,
          scale: scale!,
          alignment: alignment,
          filterQuality: filterQuality,
          child: child,
        );
      },
    },
    getters: {
      'scale': (visitor, target) => (target as ScaleTransition).scale,
      'alignment': (visitor, target) => (target as ScaleTransition).alignment,
    },
  );
}

/// Returns the BridgedClassDefinition for RotationTransition
BridgedClassDefinition getRotationTransitionBridgingDefinition() {
  return BridgedClassDefinition(
    nativeType: RotationTransition,
    name: 'RotationTransition',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final turns = namedArgs.get<Animation<double>>('turns');
        final alignment =
            namedArgs.get<Alignment?>('alignment') ?? Alignment.center;
        final filterQuality = namedArgs.get<FilterQuality?>('filterQuality');
        final child = visitor.toWidgets(namedArgs['child']);
        final key = namedArgs.get<Key?>('key');

        return RotationTransition(
          key: key,
          turns: turns!,
          alignment: alignment,
          filterQuality: filterQuality,
          child: child,
        );
      },
    },
    getters: {
      'turns': (visitor, target) => (target as RotationTransition).turns,
      'alignment': (visitor, target) =>
          (target as RotationTransition).alignment,
    },
  );
}
