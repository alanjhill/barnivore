import 'dart:async';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:barnivore/core/failure.dart';
import 'package:barnivore/features/search_flow/search/company_bean.dart';
import 'package:barnivore/features/search_flow/search/company_entity.dart';
import 'package:barnivore/features/search_flow/search/product_bean.dart';
import 'package:barnivore/features/search_flow/search/product_entity.dart';
import 'package:barnivore/main.dart';
import 'package:barnivore/models/Company.dart';
import 'package:barnivore/models/Product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final drinkRepositoryProvider = Provider<DrinkRepository>((ref) {
  //final dio = ref.watch(dioProvider);
  return BarnivoreRepository();
});

abstract class DrinkRepository {
  Future<List<Company>> getCompanyData(String keyword);
  Future<List<Product>> getProductData(String companyId);
  Future<List<Product>> queryProductData(String keyword);
  Future<List<Company>> typeahead(String keyword);
}

class BarnivoreRepository implements DrinkRepository {
  BarnivoreRepository();

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
}

/*
class _BarnivoreRepository implements DrinkRepository {
  _BarnivoreRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<Company>> getCompanyData(String keyword) async {
    try {
      final response = await dio.get(
        '/search.json',
        queryParameters: {
          'keyword': keyword,
        },
      );
      final results = List<Map<String, dynamic>>.from(response.data);
      final companyData = results.map((e) => Company.fromJson(e)).toList();

      return companyData;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure(
          message: 'No internet connection',
          exception: e,
        );
      }

      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        code: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<Product>> getProductData(String companyId) async {
    try {
      final response = await dio.get(
        '/company/$companyId.json',
      );
      final results = Map<String, dynamic>.from(response.data);
      final company = results['company'];
      final products = List<Map<String, dynamic>>.from(company['products']);
      final productData = products.map((e) => Product.fromJson(e)).toList();

      return productData;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure(
          message: 'No internet connection',
          exception: e,
        );
      }

      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        code: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<String>> typeahead(String keyword) async {
    try {
      final response = await dio.get(
        '/autocomplete',
        queryParameters: {'term': keyword},
      );
      final results = List<String>.from(response.data);

      return results;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure(
          message: 'No internet connection',
          exception: e,
        );
      }

      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        code: e.response?.statusCode,
      );
    }
  }
}

class EndpointPath {
  static String search() => '/search.json';
  static String company(String id) => '/company/$id.json';
}
*/
