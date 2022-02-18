import 'package:barnivore/features/search_flow/search/company.dart';
import 'package:barnivore/features/search_flow/search/company_products.dart';
import 'package:barnivore/features/search_flow/search/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class SearchFlowState {
  final PageController pageController;
  final String keyword;
  final int companyId;
  final int productId;
  final AsyncValue<List<Company>> companys;
  final AsyncValue<List<Product>> products;

  const SearchFlowState({
    required this.pageController,
    required this.keyword,
    required this.companyId,
    required this.productId,
    required this.companys,
    required this.products,
  });

  SearchFlowState copyWith({
    PageController? pageController,
    String? keyword,
    int? companyId,
    int? productId,
    AsyncValue<List<Company>>? companys,
    AsyncValue<List<Product>>? products,
  }) {
    return SearchFlowState(
      pageController: pageController ?? this.pageController,
      keyword: keyword ?? this.keyword,
      companyId: companyId ?? this.companyId,
      productId: productId ?? this.productId,
      companys: companys ?? this.companys,
      products: products ?? this.products,
    );
  }
}
