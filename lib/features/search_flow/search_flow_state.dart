import 'package:barnivore/features/search_flow/search/company.dart';
import 'package:barnivore/features/search_flow/search/company_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class SearchFlowState {
  final PageController pageController;
  final String keyword;
  final int companyId;
  final AsyncValue<List<CompanyProduct>> companyProducts;

  const SearchFlowState({
    required this.pageController,
    required this.keyword,
    required this.companyId,
    required this.companyProducts,
  });

  SearchFlowState copyWith({
    PageController? pageController,
    String? keyword,
    int? companyId,
    AsyncValue<List<CompanyProduct>>? companyProducts,
  }) {
    return SearchFlowState(
      pageController: pageController ?? this.pageController,
      keyword: keyword ?? this.keyword,
      companyId: companyId ?? this.companyId,
      companyProducts: companyProducts ?? this.companyProducts,
    );
  }
}
