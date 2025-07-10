extension MapExtension<K, V> on Map<K, V> {
  double? getToDouble(K key) {
    return double.tryParse('${this[key]}');
  }
}
