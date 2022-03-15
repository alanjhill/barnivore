import 'package:barnivore/models/Product.dart';
import 'package:barnivore/models/ProductFavorite.dart';
import 'package:barnivore/models/RedYellowGreen.dart';
import 'package:collection/collection.dart';

class ProductBean {
  final String id;
  final String companyId;
  final String productName;
  final String status;
  final RedYellowGreen redYellowGreen;
  final bool isFavorite;

  const ProductBean(
      {required this.id, required this.companyId, required this.productName, required this.status, required this.redYellowGreen, this.isFavorite = false});

  factory ProductBean.fromModel(Product product, List<ProductFavorite> productFavorites) {
    bool isFavorite = false;
    if (productFavorites.isNotEmpty) {
      final ProductFavorite? pf = productFavorites.firstWhereOrNull((pf) => pf.productFavoriteProductId == product.id);
      if (pf != null) {
        isFavorite = true;
      }
    }
    return ProductBean(
      id: product.id,
      companyId: product.companyId!,
      productName: product.productName!,
      status: product.status!,
      redYellowGreen: product.redYellowGreen!,
      isFavorite: isFavorite,
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, companyId: $companyId, productName: $productName, status: $status, redYellowGreen: $redYellowGreen, isFavorite: $isFavorite}';
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
          redYellowGreen == other.redYellowGreen &&
          isFavorite == other.isFavorite;

  @override
  int get hashCode => id.hashCode ^ companyId.hashCode ^ productName.hashCode ^ status.hashCode ^ redYellowGreen.hashCode ^ isFavorite.hashCode;
}
