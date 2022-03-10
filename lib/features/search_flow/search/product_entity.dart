import 'package:flutter/foundation.dart';

/*
@immutable
class ProductEntity {
  final int id;
  final int companyId;
  final String productName;
  final String status;
  final String redYellowGreen;

  const ProductEntity({
    required this.id,
    required this.companyId,
    required this.productName,
    required this.status,
    required this.redYellowGreen,
  });

  @override
  String toString() {
    return 'ProductEntity{id: $id, companyId: $companyId, productName: $productName, status: $status}';
  }

  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      id: map['id'],
      companyId: map['company_id'],
      productName: map['product_name'],
      status: map['status'],
      redYellowGreen: map['red_yellow_green'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          companyId == other.companyId &&
          productName == other.productName &&
          status == other.status &&
          redYellowGreen == other.redYellowGreen;

  @override
  int get hashCode => id.hashCode ^ companyId.hashCode ^ productName.hashCode ^ status.hashCode ^ redYellowGreen.hashCode;
}
*/
