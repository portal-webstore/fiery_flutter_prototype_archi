/// Some old boilerplate.

/// Filter null undefined
Iterable<T> filterMap<T>(
  Iterable<T> elements,
  T Function(dynamic) transform,
) {
  final Iterable<T> initialValue = <T>[];

  final Iterable<T> folded = elements.fold(
    initialValue,
    (
      Iterable<T> previous,
      T element,
    ) {
      if (element == null) {
        // Ignore invalid conversions
        return previous;
      }

      return <T>[];
    },
  );

  return [];
}

///

/**
 * Filter-map. Like map, but skips undefined values.
 *
 * @param callback
 */
List<T> fMap<T extends Object, D extends dynamic>(
  List<D> unsafeRawMaps,
  T Function(D) callback,
) {
  return unsafeRawMaps.fold(<T>[], (
    List<T> previousValidObjects,
    D element,
  ) {
    try {
      final T tryParsedValidObject = callback(element);

      return [...previousValidObjects, tryParsedValidObject];
    } on Exception catch (parseFailureException) {
      print('Failed to parse ' '${parseFailureException}');
    }

    return previousValidObjects;
  });
}
