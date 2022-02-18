import 'package:barnivore/core/failure.dart';
import 'package:barnivore/features/search_flow/drink_repository.dart';
import 'package:barnivore/features/search_flow/search/company.dart';
import 'package:barnivore/features/search_flow/search/company_products.dart';
import 'package:barnivore/features/search_flow/search/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final searchServiceProvider = Provider<SearchService>((ref) {
  final drinkRepository = ref.watch(drinkRepositoryProvider);
  return BarnivoreSearchService(drinkRepository);
});

abstract class SearchService {
  Future<Result<Failure, List<Company>>> getCompanyList(String keyword);
  Future<Result<Failure, List<Product>>> getProductList(int companyId);
  //Future<Result<Failure, List<CompanyProduct>>> getCompanyProductList(String keyword);
}

class BarnivoreSearchService implements SearchService {
  final DrinkRepository _drinkRepository;
  BarnivoreSearchService(this._drinkRepository);

/*  @override
  Future<Result<Failure, List<CompanyProduct>>> getCompanyProductList(String keyword) async {
    List<CompanyProduct> companyProductsList = [];
    final companyList = await getCompanyList(keyword);
    if (companyList.isSuccess()) {
      for (Company company in companyList.get()) {
        final productList = await getProductList(company.id);
        if (productList.isSuccess()) {
          for (Product product in productList.get()) {
            final companyProduct = CompanyProduct(company, product);
            companyProductsList.add(companyProduct);
          }
        }
      }
      return Success(companyProductsList);
    }
    return Error(
      Failure(message: 'Something went wrong'),
    );
  }*/

  Future<Result<Failure, List<Company>>> getCompanyList(String keyword) async {
    debugPrint('SearchService.getCompanyList()');
    try {
      final companyEntities = await _drinkRepository.getCompanyData(keyword);
      final companyList = companyEntities.map((e) => Company.fromEntity(e)).toList(growable: false);
      return Success(companyList);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }

  Future<Result<Failure, List<Product>>> getProductList(int companyId) async {
    debugPrint('SearchService.getProductList()');
    try {
      final productEntities = await _drinkRepository.getProductData(companyId);
      final productList = productEntities.map((e) => Product.fromEntity(e)).toList(growable: false);
      return Success(productList);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }
}
