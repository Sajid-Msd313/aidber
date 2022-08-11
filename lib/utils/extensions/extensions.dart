extension IterableExtension<T> on Iterable<T> {
  Iterable<T> distinctBy(Object Function(T e) getCompareValue) {
    var result = <T>[];
    forEach((element) {
      if (!result.any((x) => getCompareValue(x) == getCompareValue(element))) {
        result.add(element);
      }
    });

    return result;
  }
}

extension IterableExtension2<T> on Iterable<T> {
  Iterable<T> distinctByMultiple(Object Function(T e) getCompareValue, Object Function(T e) getCompareValue2) {
    var result = <T>[];
    forEach((element) {
      if (!result.any((x) => getCompareValue(x) == getCompareValue(element) && getCompareValue2(x) == getCompareValue2(element))) {
        result.add(element);
      }
    });

    return result;
  }
}