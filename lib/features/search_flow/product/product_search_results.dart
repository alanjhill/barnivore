import 'package:barnivore/core/failure.dart';
import 'package:barnivore/features/search_flow/search/company.dart';
import 'package:barnivore/features/search_flow/search/company_list_card.dart';
import 'package:barnivore/features/search_flow/product/product_list_card.dart';
import 'package:barnivore/features/search_flow/search/product.dart';
import 'package:barnivore/features/search_flow/search_flow_controller.dart';
import 'package:barnivore/widgets/empty_content.dart';
import 'package:barnivore/widgets/faiure_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductSearchResultsList extends ConsumerWidget {
  final Function onTapHandler;
  const ProductSearchResultsList({Key? key, required this.onTapHandler}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(searchFlowControllerProvider).products.when(
          data: (productList) => productList.isNotEmpty ? _buildList(ref, productList) : const SliverToBoxAdapter(child: EmptyContent()),
          loading: () {
            debugPrint('>>> ProductSearchResultsList.loading');
            return SliverToBoxAdapter(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          error: (e, s) {
            debugPrint('>>> ProductSearchResultsList.error');
            if (e is Failure) {
              return SliverToBoxAdapter(child: FailureBody(message: e.message));
            }
            return SliverToBoxAdapter(child: const FailureBody(message: 'Something went wrong on our end'));
          },
        );
  }

  Widget _buildList(WidgetRef ref, List<Product> productList) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final product = productList[index];
          final companyId = ref.read(searchFlowControllerProvider).companyId;
          final company = ref.read(searchFlowControllerProvider.notifier).getCompany(companyId);
          if (index.isEven) {
            return ProductListCard(company: company, product: product, index: index, onTapHandler: onTapHandler);
          }
          return const Divider(height: 1, color: Colors.grey);
        },
        childCount: productList.length,
      ),
    );
  }
}
