import 'package:barnivore/features/search_flow/search/company_entity.dart';

class Company {
  final int id;
  final String companyName;

  const Company({required this.id, required this.companyName});
  factory Company.fromEntity(CompanyEntity entity) {
    return Company(
      id: entity.id,
      companyName: entity.companyName,
    );
  }

  @override
  String toString() {
    return 'Company{id: $id, companyName: $companyName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Company && runtimeType == other.runtimeType && id == other.id && companyName == other.companyName;

  @override
  int get hashCode => id.hashCode ^ companyName.hashCode;
}
