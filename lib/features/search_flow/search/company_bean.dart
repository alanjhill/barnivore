import 'package:barnivore/features/search_flow/search/company_entity.dart';
import 'package:barnivore/models/Company.dart';

class CompanyBean {
  final String id;
  final String companyName;
  final String country;
  final String status;

  const CompanyBean({required this.id, required this.companyName, required this.country, required this.status});
  factory CompanyBean.fromModel(Company company) {
    return CompanyBean(
      id: company.id,
      companyName: company.companyName!,
      country: company.country!,
      status: company.status!,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyBean &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          companyName == other.companyName &&
          country == other.country &&
          status == other.status;

  @override
  int get hashCode => id.hashCode ^ companyName.hashCode ^ country.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'CompanyBean{id: $id, companyName: $companyName, country: $country, status: $status}';
  }
}
