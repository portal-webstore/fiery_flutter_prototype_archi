import 'package:drug_repository/src/models/drug_model.dart' show Drug;

/// {@template drug_repository}
/// Repository which retrieves static drug list
/// {@endtemplate}
abstract class DrugRepository {
  // /// Create
  // Future<void> addNewDrug(Drug drug);

  // /// Delete
  // Future<void> deleteDrug(Drug drug);

  /// Read
  /// We only retrieve a static file for drug list.
  Future<List<Drug>> drugs();

  // /// Update
  // Future<void> updateDrug(Drug drug);
}
