import 'dart:convert' show json;

class SampleConstructionParsedObject {
  const SampleConstructionParsedObject({
    required this.test,
  });

  factory SampleConstructionParsedObject.fromMap(
    Map<String, dynamic> map,
  ) {
    return SampleConstructionParsedObject(
      test: map['test'] as String,
    );
  }

  factory SampleConstructionParsedObject.fromJson(String source) {
    return SampleConstructionParsedObject.fromMap(
      json.decode(source) as Map<String, dynamic>,
    );
  }

  final String test;

  SampleConstructionParsedObject copyWith({
    String? test,
  }) {
    return SampleConstructionParsedObject(
      test: test ?? this.test,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'test': test,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SampleConstructionParsedObject && other.test == test;
  }

  @override
  int get hashCode => test.hashCode;
}
