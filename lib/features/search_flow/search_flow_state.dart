import 'package:barnivore/features/search_flow/search/company_bean.dart';
import 'package:barnivore/features/search_flow/search/product_bean.dart';
import 'package:barnivore/features/search_flow/search/product_favorite_bean.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class SearchFlowState {
  final PageController pageController;
  final String keyword;
  final String? companyId;
  final String? productId;
  final AsyncValue<List<CompanyBean>> companys;
  final AsyncValue<List<ProductBean>> products;
  final AsyncValue<List<ProductFavoriteBean>> productFavorites;

  const SearchFlowState({
    required this.pageController,
    required this.keyword,
    required this.companyId,
    required this.productId,
    required this.companys,
    required this.products,
    required this.productFavorites,
  });

  SearchFlowState copyWith({
    PageController? pageController,
    String? keyword,
    String? companyId,
    String? productId,
    AsyncValue<List<CompanyBean>>? companys,
    AsyncValue<List<ProductBean>>? products,
    AsyncValue<List<ProductFavoriteBean>>? productFavorites,
  }) {
    return SearchFlowState(
      pageController: pageController ?? this.pageController,
      keyword: keyword ?? this.keyword,
      companyId: companyId ?? this.companyId,
      productId: productId ?? this.productId,
      companys: companys ?? this.companys,
      products: products ?? this.products,
      productFavorites: productFavorites ?? this.productFavorites,
    );
  }
}
