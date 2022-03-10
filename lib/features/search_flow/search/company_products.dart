import 'package:barnivore/models/Company.dart';
import 'package:barnivore/models/Product.dart';

class CompanyProduct {
  final Company company;
  final Product product;

  CompanyProduct(this.company, this.product);

  @override
  String toString() {
    return 'CompanyProduct{company: $company, product: $product}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CompanyProduct && runtimeType == other.runtimeType && company == other.company && product == other.product;

  @override
  int get hashCode => company.hashCode ^ product.hashCode;
}
