import 'package:barnivore/models/ModelProvider.dart';

class ProductFavoriteBean {
  final String id;
  final String productId;
  ProductFavoriteBean({required this.id, required this.productId});

  factory ProductFavoriteBean.fromModel(ProductFavorite productFavorite) {
    return ProductFavoriteBean(
      id: productFavorite.id,
      productId: productFavorite.productFavoriteProductId!,
    );
  }

  @override
  String toString() {
    return 'ProductFavoriteBean{id: $id, productId: $productId}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ProductFavoriteBean && runtimeType == other.runtimeType && id == other.id && productId == other.productId;

  @override
  int get hashCode => id.hashCode ^ productId.hashCode;
}
