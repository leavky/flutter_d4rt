import 'package:d4rt/d4rt.dart';
import 'package:flutter/services.dart';

/// Returns the BridgedClass for the Flutter AssetBundle interface.
BridgedClass getAssetBundleBridgingDefinition() {
  return BridgedClass(
    nativeType: AssetBundle,
    name: 'AssetBundle',
    methods: {
      'load': (visitor, target, positionalArgs, namedArgs) async {
        final key = positionalArgs.get<String?>(0);
        if (key == null) throw ArgumentError('Key cannot be null');
        return await (target as AssetBundle).load(key);
      },
      'loadString': (visitor, target, positionalArgs, namedArgs) async {
        final key = positionalArgs.get<String?>(0);
        final cache = namedArgs.get<bool?>('cache') ?? true;
        if (key == null) throw ArgumentError('Key cannot be null');
        return await (target as AssetBundle).loadString(key, cache: cache);
      },
      'loadStructuredData': (visitor, target, positionalArgs, namedArgs) async {
        final key = positionalArgs.get<String?>(0);
        final parser = positionalArgs.get<InterpretedFunction?>(1);
        if (key == null || parser == null) {
          throw ArgumentError('Key and parser cannot be null');
        }
        return await (target as AssetBundle).loadStructuredData(
          key,
          (value) async => parser.call(visitor, [value], {}),
        );
      },
      'evict': (visitor, target, positionalArgs, namedArgs) {
        final key = positionalArgs.get<String?>(0);
        if (key == null) throw ArgumentError('Key cannot be null');
        (target as AssetBundle).evict(key);
        return null;
      },
      'clear': (visitor, target, positionalArgs, namedArgs) {
        (target as AssetBundle).clear();
        return null;
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as AssetBundle).toString();
      },
    },
    getters: {
      'hashCode': (visitor, target) => (target as AssetBundle).hashCode,
      'runtimeType': (visitor, target) => (target as AssetBundle).runtimeType,
    },
  );
}

/// Returns the BridgedClass for the Flutter NetworkAssetBundle.
BridgedClass getNetworkAssetBundleBridgingDefinition() {
  return BridgedClass(
    nativeType: NetworkAssetBundle,
    name: 'NetworkAssetBundle',
    constructors: {
      '': (visitor, positionalArgs, namedArgs) {
        final baseUrl = positionalArgs.get<Uri>(0);
        if (baseUrl == null) throw ArgumentError('Base URL cannot be null');
        return NetworkAssetBundle(baseUrl);
      },
    },
    methods: {
      'load': (visitor, target, positionalArgs, namedArgs) async {
        final key = positionalArgs.get<String?>(0);
        if (key == null) throw ArgumentError('Key cannot be null');
        return await (target as NetworkAssetBundle).load(key);
      },
      'loadString': (visitor, target, positionalArgs, namedArgs) async {
        final key = positionalArgs.get<String?>(0);
        final cache = namedArgs.get<bool?>('cache') ?? true;
        if (key == null) throw ArgumentError('Key cannot be null');
        return await (target as NetworkAssetBundle).loadString(
          key,
          cache: cache,
        );
      },
      'loadStructuredData': (visitor, target, positionalArgs, namedArgs) async {
        final key = positionalArgs.get<String?>(0);
        final parser = positionalArgs.get<InterpretedFunction?>(1);
        if (key == null || parser == null) {
          throw ArgumentError('Key and parser cannot be null');
        }
        return await (target as NetworkAssetBundle).loadStructuredData(
          key,
          (value) async => parser.call(visitor, [value], {}),
        );
      },
      'evict': (visitor, target, positionalArgs, namedArgs) {
        final key = positionalArgs.get<String?>(0);
        if (key == null) throw ArgumentError('Key cannot be null');
        (target as NetworkAssetBundle).evict(key);
        return null;
      },
      'clear': (visitor, target, positionalArgs, namedArgs) {
        (target as NetworkAssetBundle).clear();
        return null;
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as NetworkAssetBundle).toString();
      },
    },
    getters: {
      'hashCode': (visitor, target) => (target as NetworkAssetBundle).hashCode,
      'runtimeType': (visitor, target) =>
          (target as NetworkAssetBundle).runtimeType,
    },
  );
}

/// Returns the BridgedClass for the Flutter CachingAssetBundle.
BridgedClass getCachingAssetBundleBridgingDefinition() {
  return BridgedClass(
    nativeType: CachingAssetBundle,
    name: 'CachingAssetBundle',
    methods: {
      'load': (visitor, target, positionalArgs, namedArgs) async {
        final key = positionalArgs.get<String?>(0);
        if (key == null) throw ArgumentError('Key cannot be null');
        return await (target as CachingAssetBundle).load(key);
      },
      'loadString': (visitor, target, positionalArgs, namedArgs) async {
        final key = positionalArgs.get<String?>(0);
        final cache = namedArgs.get<bool?>('cache') ?? true;
        if (key == null) throw ArgumentError('Key cannot be null');
        return await (target as CachingAssetBundle).loadString(
          key,
          cache: cache,
        );
      },
      'loadStructuredData': (visitor, target, positionalArgs, namedArgs) async {
        final key = positionalArgs.get<String?>(0);
        final parser = positionalArgs.get<InterpretedFunction?>(1);
        if (key == null || parser == null) {
          throw ArgumentError('Key and parser cannot be null');
        }
        return await (target as CachingAssetBundle).loadStructuredData(
          key,
          (value) async => parser.call(visitor, [value], {}),
        );
      },
      'evict': (visitor, target, positionalArgs, namedArgs) {
        final key = positionalArgs.get<String?>(0);
        if (key == null) throw ArgumentError('Key cannot be null');
        (target as CachingAssetBundle).evict(key);
        return null;
      },
      'clear': (visitor, target, positionalArgs, namedArgs) {
        (target as CachingAssetBundle).clear();
        return null;
      },
      'toString': (visitor, target, positionalArgs, namedArgs) {
        return (target as CachingAssetBundle).toString();
      },
    },
    getters: {
      'hashCode': (visitor, target) => (target as CachingAssetBundle).hashCode,
      'runtimeType': (visitor, target) =>
          (target as CachingAssetBundle).runtimeType,
    },
  );
}
