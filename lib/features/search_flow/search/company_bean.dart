import 'package:barnivore/features/search_flow/search/company_entity.dart';
import 'package:barnivore/models/Company.dart';

class CompanyBean {
  final String id;
  final String companyName;
  final String country;

  const CompanyBean({required this.id, required this.companyName, required this.country});
  factory CompanyBean.fromModel(Company company) {
    return CompanyBean(
      id: company.id,
      companyName: company.companyName!,
      country: company.country!,
    );
  }

  @override
  String toString() {
    return 'Company{id: $id, companyName: $companyName, country: $country}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyBean && runtimeType == other.runtimeType && id == other.id && companyName == other.companyName && country == other.country;

  @override
  int get hashCode => id.hashCode ^ companyName.hashCode ^ country.hashCode;
}
