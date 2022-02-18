import 'package:barnivore/features/search_flow/search/company_entity.dart';

class Company {
  final int id;
  final String companyName;
  final String country;

  const Company({required this.id, required this.companyName, required this.country});
  factory Company.fromEntity(CompanyEntity entity) {
    return Company(
      id: entity.id,
      companyName: entity.companyName,
      country: entity.country,
    );
  }

  @override
  String toString() {
    return 'Company{id: $id, companyName: $companyName, country: $country}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Company && runtimeType == other.runtimeType && id == other.id && companyName == other.companyName && country == other.country;

  @override
  int get hashCode => id.hashCode ^ companyName.hashCode ^ country.hashCode;
}
