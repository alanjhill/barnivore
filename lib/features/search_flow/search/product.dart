import 'package:barnivore/features/search_flow/search/product_entity.dart';

class Product {
  final int id;
  final int companyId;
  final String productName;
  final String status;

  const Product({required this.id, required this.companyId, required this.productName, required this.status});
  factory Product.fromEntity(ProductEntity entity) {
    return Product(
      id: entity.id,
      companyId: entity.companyId,
      productName: entity.productName,
      status: entity.status,
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, companyId: $companyId, productName: $productName, status: $status}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          companyId == other.companyId &&
          productName == other.productName &&
          status == other.status;

  @override
  int get hashCode => id.hashCode ^ companyId.hashCode ^ productName.hashCode ^ status.hashCode;
}
