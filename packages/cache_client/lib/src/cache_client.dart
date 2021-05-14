/// {@template cache_client}
/// Cache client (memory-only at the moment)
/// {@endtemplate}
class CacheClient {
  /// {@macro cache_client}
  CacheClient() : _cache = <String, Object>{};

  final Map<String, Object> _cache;

  /// Write [key]-[value] pair to the in-memory [Map][_cache].
  void write<T extends Object>({
    required String key,
    required T value,
  }) {
    _cache[key] = value;
  }

  /// Read value for the given [key].
  ///
  /// Escapes null if unexpected type is found
  /// or if no value is found for the given key.
  T? read<T extends Object>({
    required String key,
  }) {
    final Object? value = _cache[key];

    if (value == null) {
      return null;
    }
    if (value is! T) {
      return null;
    }

    return value;
  }
}
