import 'package:barnivore/models/Company.dart';
import 'package:uuid/uuid.dart';

final List<Company> breweries = [
  Company(
    id: Uuid().v1(),
    companyName: 'Bridge Brewing',
    country: 'Canada',
    status: 'Has Vegan Friendly Options',
  ),
  Company(
    id: Uuid().v1(),
    companyName: 'Parallel 49',
    country: 'Canada',
    status: 'Has Vegan Friendly Options',
  ),
  Company(
    id: Uuid().v1(),
    companyName: 'Beere',
    country: 'Canada',
    status: 'Has Vegan Friendly Options',
  ),
  Company(
    id: Uuid().v1(),
    companyName: 'Wildeye Brewing',
    country: 'Canada',
    status: 'Vegan Friendly',
  ),
  Company(
    id: Uuid().v1(),
    companyName: 'Coast Mountain',
    country: 'Canada',
    status: 'Has Vegan Friendly Options',
  ),
  Company(
    id: Uuid().v1(),
    companyName: 'Backcountry Brewing',
    country: 'Canada',
    status: 'Has Vegan Friendly Options',
  ),
  Company(
    id: Uuid().v1(),
    companyName: 'Longwood Brewery',
    country: 'Canada',
    status: 'Has Vegan Friendly Options',
  ),
];
