import 'package:boundary_data_transducer/src/models/constructor_transform_model.dart';

/// Similar to dart convention parse vs parseStrict vs tryParse
/// tryParse returns null instead of throwing hard exceptions
///
///
/// Use the constructor and catch when explicit issues are found.
T? tryParseDataTransform<T>(
  dynamic datum,
  ConstructorTransform<T> objectConstructor,
) {
  /// [data] i.e. a Map<String, dynamic> representation of json
  try {
    final T parsedObject = objectConstructor(datum);

    return parsedObject;
  } on Exception catch (exception) {
    print(
      'Exception: Unable to construct/parse object from given data: '
      '${exception.toString()}',
    );
  } on TypeError catch (error) {
    // Big bad!
    // Means developer did not check null accessors when using map[''] subscript
    /// _errorMsg:"type 'Null' is not a subtype of type 'String' in type cast"
    print(
      'TYPE ERROR: Unable to construct/parse object from given data: '
      'This is likely due to unsafe null access from map. \n'
      'Please make sure to check for null field before attempting to access '
      "a map subscript key. i.e. map['key'] != null ? ?? throw ArgumentError ??"
      '\n'
      '${error.toString()}',
    );

    /// We handle this internal to the library for usefulness
    /// Otherwise we probably should not catch errors per common practice
    /// http://www.codinghorror.com/blog/archives/000358.html
    /// https://stackoverflow.com/a/467628
    /// Exceptions should be exceptional
    /// Performance tax?
    ///
    /// Safety importance.
    /// In case developer forgets to unit test their constructor conversions
    /// separately.
  }

  return null;
}
