import 'package:boundary_data_transducer/src/models/models.dart'
    show ConstructorTransform;
import 'package:boundary_data_transducer/src/utils/utils.dart'
    show tryParseDataTransform;

/// i.e. A list of maps/jsons Map<String, dynamic> to attempt to construct into
/// our frontend business data objects
///
/// [T] our expected parsed object types
/// [D] dynamic... Could presumedly pass in Map<String, Object?> for a little
/// bit more specificity. Coupled with Firestore implementation YAGNI
///
/// Cover with unit tests instead until we get better type unions or other
/// Dart language features
List<T> constructValidObjectsFromData<T>(
  List<dynamic> dataJsonMaps,
  ConstructorTransform<T> transform,
) {
  final List<T> initialBlankListCurrPrev = <T>[];
  final ConstructorTransform<T?> tryParse = (dynamic datum) {
    return tryParseDataTransform<T>(datum, transform);
  };

  final List<T> validElements = dataJsonMaps.fold(
    initialBlankListCurrPrev,
    (
      List<T> previousValidValues,
      dynamic untrustedElementToParse,
    ) {
      if (untrustedElementToParse == null) {
        return previousValidValues;
      }

      final T? attemptedParsedObject = tryParse(untrustedElementToParse);
      if (attemptedParsedObject == null) {
        return previousValidValues;
      }

      final T validParsedObject = attemptedParsedObject;

      return [...previousValidValues, validParsedObject];
    },
  );

  return validElements;
}
