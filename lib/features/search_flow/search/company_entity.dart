import 'package:flutter/foundation.dart';

@immutable
class CompanyEntity {
  final int id;
  final String companyName;

  const CompanyEntity({
    required this.id,
    required this.companyName,
  });

  factory CompanyEntity.fromMap(Map<String, dynamic> map) {
    final company = map['company'];
    return CompanyEntity(
      id: company['id'],
      companyName: company['company_name'],
    );
  }

  @override
  String toString() {
    return 'EndpointData{id: $id, companyName: $companyName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CompanyEntity && runtimeType == other.runtimeType && id == other.id && companyName == other.companyName;

  @override
  int get hashCode => id.hashCode ^ companyName.hashCode;
}
