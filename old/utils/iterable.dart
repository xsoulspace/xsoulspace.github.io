part of utils;

extension IterableExt<E> on Iterable<E> {
  /// url: https://stackoverflow.com/a/61349527/9908821
  Iterable<V> mapIndexed<V>(
    final V Function(int index, E item) transform,
  ) sync* {
    int index = 0;

    for (final item in this) {
      yield transform(index, item);
      index++;
    }
  }
}
