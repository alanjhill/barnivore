import 'package:barnivore/features/search_flow/search/product_entity.dart';
import 'package:barnivore/models/Product.dart';
import 'package:barnivore/models/RedYellowGreen.dart';

class ProductBean {
  final String id;
  final String companyId;
  final String productName;
  final String status;
  final RedYellowGreen redYellowGreen;

  const ProductBean({required this.id, required this.companyId, required this.productName, required this.status, required this.redYellowGreen});
  factory ProductBean.fromModel(Product product) {
    return ProductBean(
      id: product.id,
      companyId: product.companyId!,
      productName: product.productName!,
      status: product.status!,
      redYellowGreen: product.redYellowGreen!,
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, companyId: $companyId, productName: $productName, status: $status, redYellowGreen: $redYellowGreen}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductBean &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          companyId == other.companyId &&
          productName == other.productName &&
          status == other.status &&
          redYellowGreen == other.redYellowGreen;

  @override
  int get hashCode => id.hashCode ^ companyId.hashCode ^ productName.hashCode ^ status.hashCode ^ redYellowGreen.hashCode;
}
