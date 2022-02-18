import 'package:barnivore/features/search_flow/common/custom_app_bar.dart';
import 'package:barnivore/features/search_flow/common/custom_persistent_header.dart';
import 'package:barnivore/features/search_flow/product/products_screen.dart';
import 'package:barnivore/features/search_flow/search/company_search_results.dart';
import 'package:barnivore/features/search_flow/search_flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static const routeName = '/search';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const CustomAppBar(),
          CustomPersistentHeader(onSearchHandler: _search),
          CompanySearchResultsList(onTapHandler: _getProducts),
        ],
      ),
    );
  }

  void _search(WidgetRef ref) {
    ref.read(searchFlowControllerProvider.notifier).search();
  }

  void _getProducts(WidgetRef ref) async {
    int companyId = ref.read(searchFlowControllerProvider).companyId;
    await ref.read(searchFlowControllerProvider.notifier).getProducts(companyId);
    Navigator.of(context).push(ProductsScreen.route(fullscreenDialog: true));
  }
}
