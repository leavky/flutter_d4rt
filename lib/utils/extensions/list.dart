extension ListExtension<T> on List<T> {
  double? getToDouble(int index) {
    try {
      return double.tryParse('${this[index]}');
    } on RangeError {
      return null;
    }
  }
}
