import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:barnivore/core/failure.dart';
import 'package:barnivore/models/Company.dart';
import 'package:barnivore/models/Product.dart';
import 'package:barnivore/models/ProductFavorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final drinkRepositoryProvider = Provider<DrinkRepository>((ref) {
  //final dio = ref.watch(dioProvider);
  return BarnivoreRepository();
});

abstract class DrinkRepository {
  Future<List<Company>> listCompanies();
  Future<List<Company>> getCompanyData(String keyword);
  Future<List<Product>> listProducts();
  Future<List<Product>> getProductData(String companyId);
  Future<List<Product>> queryProductData(String keyword);
  Future<List<ProductFavorite>> listProductFavorites();
  Future<List<Company>> typeahead(String keyword);
  Future<void> setProductFavorite(String productId, bool favorite);
}

class BarnivoreRepository implements DrinkRepository {
  BarnivoreRepository();

  @override
  Future<List<Company>> listCompanies() async {
    try {
      List<Company> results = await Amplify.DataStore.query(Company.classType);
      return results;
    } catch (e) {
      debugPrint('listCompanies: $e');
      throw Failure(
        message: 'Could not get data',
        exception: e as Exception,
      );
    }
  }

  @override
  Future<List<Company>> getCompanyData(String keyword) async {
    try {
      List<Company> results = await Amplify.DataStore.query(Company.classType, where: Company.KEYWORDS.contains(keyword.toLowerCase()));
      return results;
    } catch (e) {
      debugPrint('getCompanyData: $e');
      throw Failure(
        message: 'Could not get data',
        exception: e as Exception,
      );
    }
  }

  @override
  Future<List<Product>> getProductData(String companyId) async {
    try {
      List<Product> results = await Amplify.DataStore.query(Product.classType, where: Product.COMPANYID.eq(companyId));
      return results;
    } catch (e) {
      debugPrint('getProductData: $e');
      throw Failure(
        message: 'Could not get data',
        exception: e as Exception,
      );
    }
  }

  @override
  Future<List<Product>> listProducts() async {
    try {
      List<Product> results = await Amplify.DataStore.query(Product.classType);
      return results;
    } catch (e) {
      debugPrint('getProductData: $e');
      throw Failure(
        message: 'Could not get data',
        exception: e as Exception,
      );
    }
  }

  @override
  Future<List<Product>> queryProductData(String keyword) async {
    try {
      List<Product> results = await Amplify.DataStore.query(Product.classType, where: Product.KEYWORDS.contains(keyword.toLowerCase()));
      return results;
    } catch (e) {
      debugPrint('queryProductData: $e');
      throw Failure(
        message: 'Could not get data',
        exception: e as Exception,
      );
    }
  }

  @override
  Future<List<Company>> typeahead(String keyword) async {
    try {
      List<Company> results = await Amplify.DataStore.query(Company.classType, where: Company.KEYWORDS.contains(keyword.toLowerCase()));
      return results;
    } catch (e) {
      debugPrint('typeahead: $e');
      throw Failure(
        message: 'Could not get data',
        exception: e as Exception,
      );
    }
  }

  @override
  Future<List<ProductFavorite>> listProductFavorites() async {
    try {
      List<ProductFavorite> results = await Amplify.DataStore.query(ProductFavorite.classType);
      return results;
    } catch (e) {
      debugPrint('listProductFavorites: $e');
      throw Failure(
        message: 'Could not get data',
        exception: e as Exception,
      );
    }
  }

  @override
  Future<void> setProductFavorite(String productId, bool favorite) async {
    final List<ProductFavorite> productFavorites =
        await Amplify.DataStore.query(ProductFavorite.classType, where: ProductFavorite.PRODUCTFAVORITEPRODUCTID.eq(productId));
    if (productFavorites.isNotEmpty) {
      if (!favorite) {
        try {
          debugPrint('>>> 1. setProductFavorite: $favorite');
          final productFavorite = productFavorites.first;
          await Amplify.DataStore.delete(productFavorite);
        } catch (e) {
          debugPrint('setProductFavorite: $e');
          throw Failure(
            message: 'Could not unset favorite',
            exception: e as Exception,
          );
        }
      }
    } else {
      try {
        debugPrint('>>> 2. setProductFavorite: $favorite');
        final products = await Amplify.DataStore.query(Product.classType, where: Product.ID.eq(productId));
        if (products.isNotEmpty) {
          final product = products.first;
          final productFavorite = ProductFavorite(
            productFavoriteProductId: product.id,
          );
          await Amplify.DataStore.save(productFavorite);
          debugPrint('productFavorite: $productFavorite');
        } else {
          debugPrint('!!! Error, product does not exist');
        }
      } catch (e) {
        debugPrint('setProductFavorite: $e');
        throw Failure(
          message: 'Could not set favorite',
          exception: e as Exception,
        );
      }
    }
  }
}
