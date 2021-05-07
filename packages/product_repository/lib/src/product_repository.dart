import 'package:product_repository/product_repository.dart' show Product;

/// {@template product_repository}
/// Repository to manage product info.
/// May map from clinic preferences
/// @endtemplate}
abstract class ProductRepository {
  // /// Create
  // Future<void> addNewProduct(Product product);

  // /// Delete
  // Future<void> deleteProduct(Product product);

  /// Read
  /// We only retrieve a static file for product list.
  Future<List<Product>> products();

  // /// Update
  // Future<void> updateProduct(Product product);
}
