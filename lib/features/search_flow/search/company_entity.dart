import 'package:flutter/foundation.dart';

@immutable
class CompanyEntity {
  final int id;
  final String companyName;
  final String country;

  const CompanyEntity({
    required this.id,
    required this.companyName,
    required this.country,
  });

  factory CompanyEntity.fromMap(Map<String, dynamic> map) {
    final company = map['company'];
    return CompanyEntity(
      id: company['id'],
      companyName: company['company_name'],
      country: company['country'],
    );
  }

  @override
  String toString() {
    return 'CompanyEntity{id: $id, companyName: $companyName, country: $country}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyEntity && runtimeType == other.runtimeType && id == other.id && companyName == other.companyName && country == other.country;

  @override
  int get hashCode => id.hashCode ^ companyName.hashCode ^ country.hashCode;
}
