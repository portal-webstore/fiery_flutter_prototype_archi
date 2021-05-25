import 'package:boundary_data_transducer/boundary_data_transducer.dart'
    show constructValidObjectsFromData;
import 'package:test/test.dart';

import 'mocks/sample_construction_parsed_object_model.dart'
    show SampleConstructionParsedObject;

void main() {
  setUp(() {
    print('setup main');
    return;
  });
  group('parse', () {
    const SampleConstructionParsedObject expectedConstructedValid =
        SampleConstructionParsedObject(
      test: 'test',
    );

    const SampleConstructionParsedObject
        expectedConstructedValidExtraFieldsIgnored = expectedConstructedValid;

    const Map<String, Object?> sampleMapValid = {
      'test': 'test',
    };
    const Map<String, Object?> sampleMapInvalidKey = {
      'invalidkeytest': -1,
    };
    const Map<String, Object?> sampleMapValidExtraFieldsIgnored = {
      'test': 'test',
      'extraField': <String, String>{
        'whyExtraFieldHere': '?to test buggy code',
      }
    };
    const Map<String, Object?> sampleMapInvalidCorrectKeyIncorrectType = {
      'test': 9001,
    };

    const List<Map<String, Object?>> sampleMaps = [
      sampleMapValid,
      sampleMapInvalidKey,
      sampleMapValidExtraFieldsIgnored,
      sampleMapInvalidCorrectKeyIncorrectType,
    ];

    setUp(() {
      print('setup parse group');
      return;
    });

    test('valid construction', () {
      final objects = constructValidObjectsFromData(
        [sampleMapValid],
        _mapConstructor,
      );

      final List<SampleConstructionParsedObject> expectedObjects = [
        expectedConstructedValid,
      ];
      expect(objects, expectedObjects);
    });

    test('empty list on all invalid construction', () {
      final objects = constructValidObjectsFromData(
        [
          sampleMapInvalidKey,
          sampleMapInvalidCorrectKeyIncorrectType,
        ],
        _mapConstructor,
      );

      final List<SampleConstructionParsedObject> expectedObjectsEmpty = [];
      expect(objects, expectedObjectsEmpty);
      expect(objects.isEmpty, true);
    });

    test('retain only valid non-null map data', () {
      final objects = constructValidObjectsFromData(
        [
          sampleMapValid, // ✅ Base success case
          sampleMapInvalidKey, // ❌ Completely fail
          sampleMapValidExtraFieldsIgnored, // ✅ Should succeed
          sampleMapInvalidCorrectKeyIncorrectType, // ❌ Should fail with TypeImplError
        ],
        _mapConstructor,
      );

      // Expect only two here
      final List<SampleConstructionParsedObject> expectedObjects = [
        expectedConstructedValid,
        expectedConstructedValidExtraFieldsIgnored,
      ];

      expect(objects, expectedObjects);
      // Redundant expectation for clarity magic number baked test
      expect(objects.length, 2);
    });
  });
}

SampleConstructionParsedObject _mapConstructor(dynamic map) {
  return SampleConstructionParsedObject.fromMap(
    map as Map<String, dynamic>,
  );
}
