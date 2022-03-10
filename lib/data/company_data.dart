import 'package:barnivore/models/Company.dart';
import 'package:uuid/uuid.dart';

final List<Company> breweries = [
  Company(
    id: Uuid().v1(),
    companyName: 'Bridge Brewing',
    country: 'Canada',
  ),
  Company(
    id: Uuid().v1(),
    companyName: 'Parallel 49',
    country: 'Canada',
  ),
  Company(
    id: Uuid().v1(),
    companyName: 'Beere',
    country: 'Canada',
  ),
  Company(
    id: Uuid().v1(),
    companyName: 'Wildeye',
    country: 'Canada',
  ),
  Company(
    id: Uuid().v1(),
    companyName: 'Coast Mountain',
    country: 'Canada',
  ),
  Company(
    id: Uuid().v1(),
    companyName: 'Backcountry Brewing',
    country: 'Canada',
  ),
];
