import 'package:barnivore/features/search_flow/search/company.dart';
import 'package:barnivore/features/search_flow/search_service.dart';
import 'package:barnivore/features/search_flow/search_flow_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchFlowControllerProvider = StateNotifierProvider.autoDispose<SearchFlowController, SearchFlowState>((ref) {
  return SearchFlowController(
    SearchFlowState(
      pageController: PageController(),
      keyword: '',
      companyId: -1,
      productId: -1,
      companys: const AsyncValue.data([]),
      products: const AsyncValue.data([]),
    ),
    ref.watch(searchServiceProvider),
  );
});

class SearchFlowController extends StateNotifier<SearchFlowState> {
  SearchFlowController(
    SearchFlowState state,
    this._searchService,
  ) : super(state) {}

  final SearchService _searchService;

  Future<void> search() async {
    state = state.copyWith(companys: const AsyncValue.loading());
    final result = await _searchService.getCompanyList(state.keyword);

    result.when(
      (error) {
        state = state.copyWith(companys: AsyncValue.error(error));
      },
      (companyList) {
        final updatedCompanyList = AsyncValue.data(companyList);
        state = state.copyWith(companys: updatedCompanyList);
      },
    );
  }

  Future<void> getProducts(int companyId) async {
    state = state.copyWith(companyId: companyId);
    final result = await _searchService.getProductList(state.companyId);

    result.when(
      (error) {
        state = state.copyWith(products: AsyncValue.error(error));
      },
      (productList) {
        final updatedProductList = AsyncValue.data(productList);
        state = state.copyWith(products: updatedProductList);
      },
    );
  }

  void setKeyword(String keyword) {
    state = state.copyWith(keyword: keyword);
  }

  void setCompanyId(int companyId) {
    state = state.copyWith(companyId: companyId);
  }

  Company getCompany(int companyId) {
    final company = state.companys.asData?.value.firstWhere((c) => c.id == companyId);
    return company!;
  }

  void nextPage() {
    // TODO: Checks.....
    state.pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  void previousPage() {
    state.pageController.previousPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}
