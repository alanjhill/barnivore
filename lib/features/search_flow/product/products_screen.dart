import 'package:barnivore/features/search_flow/common/custom_app_bar.dart';
import 'package:barnivore/features/search_flow/common/custom_persistent_header.dart';
import 'package:barnivore/features/search_flow/product/product_search_results.dart';
import 'package:barnivore/features/search_flow/search/company_search_results.dart';
import 'package:barnivore/features/search_flow/search_flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsScreen extends ConsumerWidget {
  static const routeName = '/products';
  const ProductsScreen({Key? key}) : super(key: key);

  static route({bool fullscreenDialog = true}) => MaterialPageRoute(
        builder: (context) => const ProductsScreen(),
        fullscreenDialog: fullscreenDialog,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const CustomAppBar(),
          const SliverPadding(padding: EdgeInsets.only(top: 16.0)),
          ProductSearchResultsList(onTapHandler: _selectProduct),
        ],
      ),
    );
  }

  void _search(WidgetRef ref) {
    ref.read(searchFlowControllerProvider.notifier).search();
  }

  void _selectProduct(WidgetRef ref) {
    debugPrint('>>> selectProduct');
    //ref.read(searchFlowControllerProvider.notifier).search();
  }
}
