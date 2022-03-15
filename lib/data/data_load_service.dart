import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:barnivore/data/company_data.dart';
import 'package:barnivore/data/product_data.dart';
import 'package:barnivore/features/search_flow/drink_repository.dart';
import 'package:barnivore/models/Company.dart';
import 'package:barnivore/models/ModelProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final dataLoadServiceProvider = Provider<DataLoadService>((ref) => throw UnimplementedError());

class DataLoadService {
  final DrinkRepository drinkRespository;
  DataLoadService(this.drinkRespository);

  Future<void> deleteData() async {
    try {
      //await Amplify.DataStore.clear();
      await _deleteProductFavorites();
      await _deleteProducts();
      await _deleteCompanies();
    } catch (e) {
      debugPrint('An error occurred while deleting data $e');
    }
  }

  Future<void> loadData() async {
    try {
      debugPrint('>>>> 1');
      await _loadCompanies();
      debugPrint('>>>> 2');
      await _loadBeers();
      debugPrint('>>>> 3');
      await _loadProductFavorites();
      debugPrint('>>>> 4');
    } catch (e) {
      debugPrint('An error occurreed while loading data $e');
    }
  }

  Future<void> _loadCompanies() async {
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

  Future<void> _deleteCompanies() async {
    final companies = await drinkRespository.listCompanies();
    for (Company company in companies) {
      try {
        await Amplify.DataStore.delete(company);
      } catch (e) {
        debugPrint('An error occurred deleting company: $company');
      }
    }
  }

  Future<void> _loadBeers() async {
    int index = 0;
    for (List<Product> productList in beers) {
      debugPrint('index: $index');
      for (Product product in productList) {
        final brewery = breweries[index];
        try {
          final beer = product.copyWith(
            id: const Uuid().v1(),
            companyId: brewery.id,
            company: brewery,
            keywords: product.productName!.toLowerCase(),
          );
          debugPrint('load beer: $beer');
          await Amplify.DataStore.save(beer);
        } catch (e) {
          debugPrint('An error occurred while saving beer $e');
        }
      }
      index++;
    }
  }

  Future<void> _loadProductFavorites() async {
    final beers = await Amplify.DataStore.query(Product.classType);
    final beer = beers.first;

    final productFavorite = ProductFavorite(
      productFavoriteProductId: beer.id,
      product: beer,
    );

    try {
      return await Amplify.DataStore.save(productFavorite);
    } catch (e) {
      debugPrint('An error occurred while saving beer $e');
    }
  }

  Future<void> _deleteProducts() async {
    final products = await drinkRespository.listProducts();
    for (Product product in products) {
      try {
        await Amplify.DataStore.delete(product);
      } catch (e) {
        debugPrint('An error occurred deleting product: $product');
      }
    }
  }

  Future<void> _deleteProductFavorites() async {
    final productFavorites = await drinkRespository.listProductFavorites();
    for (ProductFavorite productFavorite in productFavorites) {
      try {
        await Amplify.DataStore.delete(productFavorite);
      } catch (e) {
        debugPrint('An error occurred deleting productFavorite: $productFavorite');
      }
    }
  }
}
