import 'dart:io';

import 'package:barnivore/core/failure.dart';
import 'package:barnivore/features/search_flow/search/company_entity.dart';
import 'package:barnivore/features/search_flow/search/product_entity.dart';
import 'package:barnivore/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final drinkRepositoryProvider = Provider<DrinkRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return BarnivoreRepository(dio: dio);
});

abstract class DrinkRepository {
  Future<List<CompanyEntity>> getCompanyData(String keyword);
  Future<List<ProductEntity>> getProductData(int companyId);
}

class BarnivoreRepository implements DrinkRepository {
  BarnivoreRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<CompanyEntity>> getCompanyData(String keyword) async {
    try {
      final response = await dio.get(
        '/search.json',
        queryParameters: {
          'keyword': keyword,
        },
      );
      final results = List<Map<String, dynamic>>.from(response.data);
      final companyData = results.map((e) => CompanyEntity.fromMap(e)).toList();

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
  Future<List<ProductEntity>> getProductData(int companyId) async {
    try {
      final response = await dio.get(
        '/company/$companyId.json',
      );
      final results = Map<String, dynamic>.from(response.data);
      final company = results['company'];
      final products = List<Map<String, dynamic>>.from(company['products']);
      final productData = products.map((e) => ProductEntity.fromMap(e)).toList();

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
}

class EndpointPath {
  static String search() => '/search.json';
  static String company(String id) => '/company/$id.json';
}
