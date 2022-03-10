import 'package:barnivore/data/company_data.dart';
import 'package:barnivore/models/ModelProvider.dart';
import 'package:barnivore/models/Product.dart';

final List<List<Product>> beers = [
  [
    // Bridge Brewing
    Product(
      belongsToCompany: breweries[0],
      productName: 'Wunderbar Kolcsh',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[0],
      productName: 'North Shore Pal',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[0],
      productName: 'Hoplano IPA',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[0],
      productName: 'Lonsdale Lager',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[0],
      productName: 'Bourbon Blood Orange',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[0],
      productName: 'Imperial White IPA',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
  ],
  [
    // Parallel 49
    Product(
      belongsToCompany: breweries[1],
      productName: 'Craft Lager',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[1],
      productName: 'Ugly Sweater',
      status: 'Not Vegan Friendly',
      redYellowGreen: RedYellowGreen.RED,
    ),
    Product(
      belongsToCompany: breweries[1],
      productName: 'Trash Panda',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
  ],
  [
    // Beere
    Product(
      belongsToCompany: breweries[0],
      productName: 'Mental Floss',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[0],
      productName: 'Splash Pants',
      status: 'Not Vegan Friendly',
      redYellowGreen: RedYellowGreen.RED,
    ),
    Product(
      belongsToCompany: breweries[2],
      productName: 'Go Easy',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
  ],
  [
    // Wildeye Brewing
    Product(
      belongsToCompany: breweries[3],
      productName: 'Choppy Waters Hazy IPA',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[3],
      productName: 'Czech Pilsner',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[3],
      productName: 'German Kölsch',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[3],
      productName: 'Czech Dark Lager',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[3],
      productName: 'Cloud Bank Pale Ale',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[3],
      productName: 'Oberon\'s Elixier Blackberry Sour',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
  ],
  [
    // Coast Mountain
    Product(
      belongsToCompany: breweries[4],
      productName: 'Hope You\'re Happy IPA',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[4],
      productName: 'Surveyor IPA',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
  ],
  [
    // Backcountry Brewing
    Product(
      belongsToCompany: breweries[5],
      productName: 'Trailbreaker Pale Ale',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[5],
      productName: 'Widowmaker IPA',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
    Product(
      belongsToCompany: breweries[5],
      productName: 'Ridgerunner Pilsner',
      status: 'Vegan Friendly',
      redYellowGreen: RedYellowGreen.GREEN,
    ),
  ],
];
