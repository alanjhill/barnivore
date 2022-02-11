import 'package:barnivore/core/constants.dart';
import 'package:barnivore/core/failure.dart';
import 'package:barnivore/features/search_flow/search/company_list_card.dart';
import 'package:barnivore/features/search_flow/search_flow_controller.dart';
import 'package:barnivore/theme/palette.dart';
import 'package:barnivore/widgets/faiure_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static const routeName = '/search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Barnivore'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onSubmitted: (_) => _search(ref),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'Search for Booze',
              ),
            ),
          ),
          SearchResultsList(),
        ],
      ),
    );
  }

  void _search(WidgetRef ref) {
    ref.read(searchFlowControllerProvider.notifier).setKeyword(_searchController.text);
    ref.read(searchFlowControllerProvider.notifier).search();
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Color _backgroundColor;
  final Widget _title;
  _SliverPersistentHeaderDelegate(this._backgroundColor, this._title);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 48,
      color: _backgroundColor,
      child: _title,
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class SearchResultsList extends ConsumerWidget {
  const SearchResultsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ref.watch(searchFlowControllerProvider).companyProducts.when(
            data: (companyProductList) {
              return ListView.separated(
                itemCount: companyProductList.length,
                itemBuilder: (context, index) {
                  final companyProduct = companyProductList[index];
                  return CompanyProductListCard(company: companyProduct.company, product: companyProduct.product, index: index, onTap: () => {});
                },
                separatorBuilder: (context, index) {
                  return const Divider(height: kListItemSpacing);
                },
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (e, s) {
              if (e is Failure) {
                return FailureBody(message: e.message);
              }
              return const FailureBody(message: 'Something went wrong on our end');
            },
          ),
    );
  }
}
