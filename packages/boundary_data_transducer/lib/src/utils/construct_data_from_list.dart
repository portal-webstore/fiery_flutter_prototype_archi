import 'package:boundary_data_transducer/src/models/models.dart'
    show ConstructorTransform, TryConstructorTransform;
import 'package:boundary_data_transducer/src/utils/utils.dart'
    show tryParseDataTransform;

/// Self-descriptive alias for readability, brevity, when priming an in-line
/// function primed with transformation
typedef ValidConstructionAccumulator<T> = List<T> Function(
  List<T> previous,
  dynamic jsonMapElement,
);

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
  final TryConstructorTransform<T> tryParse = (dynamic datum) {
    return tryParseDataTransform<T>(datum, transform);
  };

  final ValidConstructionAccumulator<T> accumulateValidObjects = (
    List<T> previous,
    dynamic jsonMapElement,
  ) {
    return accumulateValidNonNullJsonMapFromData<T, dynamic>(
      previous,
      jsonMapElement,
      tryParse,
    );
  };

  final List<T> validElements = dataJsonMaps.fold(
    initialBlankListCurrPrev,
    accumulateValidObjects,
  );

  return validElements;
}

T combine<T, E>(T accumulated, E element) {
  return accumulated;
}

List<T> accumulateValidNonNullJsonMapFromData<T, E>(
  List<T> previousValidValuesAccumulated,
  E untrustedJsonMapElementToParse,
  ConstructorTransform<T?> transform,
) {
  if (untrustedJsonMapElementToParse == null) {
    // Base condition
    return previousValidValuesAccumulated;
  }

  final T? attemptedParsedObject = transform(untrustedJsonMapElementToParse);
  if (attemptedParsedObject == null) {
    // Child-checked conversion
    return previousValidValuesAccumulated;
  }
  final T validParsedObject = attemptedParsedObject;

  return [
    ...previousValidValuesAccumulated,
    validParsedObject,
  ];
}
