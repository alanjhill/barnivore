import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:barnivore/data/company_data.dart';
import 'package:barnivore/data/product_data.dart';
import 'package:barnivore/models/Company.dart';
import 'package:barnivore/models/ModelProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final dataLoadServiceProvider = Provider<DataLoadService>((ref) => throw UnimplementedError());

class DataLoadService {
  Future<void> deleteData() async {
    try {
      await Amplify.DataStore.clear();
    } catch (e) {
      debugPrint('An error occurred while deleting data $e');
    }
/*    // beers
    for (List<Product> productList in beers) {
      for (Product product in productList) {
        try {
          await Amplify.DataStore.delete(product);
        } catch (e) {
          debugPrint('An error occurred while deleting beer $e');
        }
      }
    }

    // breweries
    for (Company brewery in breweries) {
      try {
        await Amplify.DataStore.delete(brewery);
      } catch (e) {
        debugPrint('An error occurred while deleting brewery $e');
      }
    }*/
  }

  Future<void> loadCompanies() async {
    for (Company company in breweries) {
      try {
        final brewery = company.copyWith(
          keywords: company.companyName!.toLowerCase(),
        );
        await Amplify.DataStore.save(brewery);
      } catch (e) {
        debugPrint('An error occurred while saving brewery $e');
      }
    }
  }

  Future<void> loadBeers() async {
    int index = 0;
    for (List<Product> productList in beers) {
      debugPrint('index: $index');
      for (Product product in productList) {
        final brewery = breweries[index];
        try {
          final beer = product.copyWith(
            id: const Uuid().v1(),
            companyId: brewery.id,
            productName: brewery.id,
            productBelongsToCompanyId: brewery.id,
            keywords: product.productName!.toLowerCase(),
          );
          await Amplify.DataStore.save(beer);
        } catch (e) {
          debugPrint('An error occurred while saving beer $e');
        }
      }
      index++;
    }
  }
}
