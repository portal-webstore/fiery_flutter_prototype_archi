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
      'Unable to construct/parse object from given data: '
      '${exception.toString()}',
    );
  }

  return null;
}
