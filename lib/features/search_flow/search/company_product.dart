import 'package:barnivore/models/Company.dart';
import 'package:barnivore/models/Product.dart';
import 'package:barnivore/models/ProductFavorite.dart';

class CompanyProduct {
  final Company company;
  final Product product;
  final ProductFavorite productFavorite;

  CompanyProduct(this.company, this.product, this.productFavorite);

  @override
  String toString() {
    return 'CompanyProduct{company: $company, product: $product, productFavorite: $productFavorite}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyProduct &&
          runtimeType == other.runtimeType &&
          company == other.company &&
          product == other.product &&
          productFavorite == other.productFavorite;

  @override
  int get hashCode => company.hashCode ^ product.hashCode ^ productFavorite.hashCode;
}
