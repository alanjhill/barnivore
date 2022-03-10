import 'package:barnivore/core/failure.dart';
import 'package:barnivore/features/search_flow/drink_repository.dart';
import 'package:barnivore/features/search_flow/search/company_bean.dart';
import 'package:barnivore/features/search_flow/search/product_bean.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final searchServiceProvider = Provider<SearchService>((ref) {
  final drinkRepository = ref.watch(drinkRepositoryProvider);
  return BarnivoreSearchService(drinkRepository);
});

abstract class SearchService {
  Future<Result<Failure, List<CompanyBean>>> getCompanyList(String keyword);
  Future<Result<Failure, List<ProductBean>>> getProductList(String companyId);
  Future<Result<Failure, List<String?>>> typeahead(String keyword);
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

  Future<Result<Failure, List<String?>>> typeahead(String keyword) async {
    debugPrint('SearchService.typeahead');
    try {
      final results = await _drinkRepository.typeahead(keyword);
      final typeaheadList = results.map((e) => e.companyName).toList();
      return Success(typeaheadList);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }

  Future<Result<Failure, List<CompanyBean>>> getCompanyList(String keyword) async {
    debugPrint('SearchService.getCompanyList()');
    try {
      final companyModels = await _drinkRepository.getCompanyData(keyword);
      final companyList = companyModels.map((e) => CompanyBean.fromModel(e)).toList(growable: false);
      return Success(companyList);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }

  Future<Result<Failure, List<ProductBean>>> getProductList(String companyId) async {
    debugPrint('SearchService.getProductList()');
    try {
      final productModels = await _drinkRepository.getProductData(companyId);
      final productList = productModels.map((e) => ProductBean.fromModel(e)).toList(growable: false);
      return Success(productList);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }
}
