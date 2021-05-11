import 'package:cache_client/cache_client.dart' show CacheClient;
import 'package:test/test.dart' show expect, group, test;

void main() {
  group('caches values', () {
    final CacheClient cacheClient = CacheClient();

    test('read null no value', () {
      final String? valueRead = cacheClient.read<String>(key: 'nothinghere');
      expect(valueRead, null);
    });
    test('read/write key', () {
      /// Assuming no practical limitations on character set

      const String keyWritten = 'Hello!';
      const String valueWritten = 'ho there';
      cacheClient.write(
        key: keyWritten,
        value: valueWritten,
      );

      final String? valueRead = cacheClient.read<String>(key: keyWritten);

      expect(valueRead, valueWritten);
    });
    test('overwrite key with most recent value', () {
      /// Assuming no practical limitations on character set

      const String keyWritten = 'Hello!';
      const String valueWritten = 'ho there';
      const String valueOverwritten = 'Goodbye';
      const String valueOverwrittenOverwritten = 'See you later';

      cacheClient.write(key: keyWritten, value: valueWritten);
      cacheClient.write(key: keyWritten, value: valueOverwritten);

      final String? valueRead = cacheClient.read<String>(key: keyWritten);

      expect(valueRead, valueOverwritten);

      cacheClient.write(key: keyWritten, value: valueOverwritten);
      cacheClient.write(key: keyWritten, value: keyWritten);
      cacheClient.write(key: keyWritten, value: valueWritten);
      cacheClient.write(key: keyWritten, value: valueOverwrittenOverwritten);

      final String? valueReadAgainOnSameKey = cacheClient.read<String>(
        key: keyWritten,
      );

      expect(valueReadAgainOnSameKey, valueOverwrittenOverwritten);
    });
    test('web memory limit', () {
      /// Find the load test point
      /// ? Platform/runtime dependent
      expect(true, true);
    });
  });
}
