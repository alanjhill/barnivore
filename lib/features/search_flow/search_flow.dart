import 'package:barnivore/features/search_flow/product/products_screen.dart';
import 'package:barnivore/features/search_flow/search/search_screen.dart';
import 'package:barnivore/features/search_flow/search_flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchFlow extends ConsumerWidget {
  const SearchFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      controller: ref.watch(searchFlowControllerProvider).pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SearchScreen(),
        ProductsScreen(),
      ],
    );
  }
}
