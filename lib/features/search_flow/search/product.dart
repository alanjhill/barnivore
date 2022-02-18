import 'package:barnivore/features/search_flow/search/product_entity.dart';

class Product {
  final int id;
  final int companyId;
  final String productName;
  final String status;
  final String redYellowGreen;

  const Product({required this.id, required this.companyId, required this.productName, required this.status, required this.redYellowGreen});
  factory Product.fromEntity(ProductEntity entity) {
    return Product(
      id: entity.id,
      companyId: entity.companyId,
      productName: entity.productName,
      status: entity.status,
      redYellowGreen: entity.redYellowGreen,
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, companyId: $companyId, productName: $productName, status: $status, redYellowGreen: $redYellowGreen}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          companyId == other.companyId &&
          productName == other.productName &&
          status == other.status &&
          redYellowGreen == other.redYellowGreen;

  @override
  int get hashCode => id.hashCode ^ companyId.hashCode ^ productName.hashCode ^ status.hashCode ^ redYellowGreen.hashCode;
}
