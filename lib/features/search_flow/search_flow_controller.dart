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
      companyProducts: const AsyncValue.data([]),
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
    state = state.copyWith(companyProducts: const AsyncValue.loading());
    final result = await _searchService.getCompanyProductList(state.keyword);

    result.when(
      (error) {
        state = state.copyWith(companyProducts: AsyncValue.error(error));
      },
      (companyList) {
        final updatedCompanyList = AsyncValue.data(companyList);
        state = state.copyWith(companyProducts: updatedCompanyList);
      },
    );
  }

  void setKeyword(String keyword) {
    state = state.copyWith(keyword: keyword);
  }
}
