import 'package:barnivore/core/failure.dart';
import 'package:barnivore/features/search_flow/search/company.dart';
import 'package:barnivore/features/search_flow/search/company_list_card.dart';
import 'package:barnivore/features/search_flow/search_flow_controller.dart';
import 'package:barnivore/widgets/empty_content.dart';
import 'package:barnivore/widgets/faiure_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompanySearchResultsList extends ConsumerWidget {
  final Function onTapHandler;
  const CompanySearchResultsList({Key? key, required this.onTapHandler}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(searchFlowControllerProvider).companys.when(
          data: (companyList) => companyList.isNotEmpty ? _buildList(companyList) : const SliverToBoxAdapter(child: EmptyContent()),
          loading: () {
            debugPrint('>>> loading');
            return SliverToBoxAdapter(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          error: (e, s) {
            debugPrint('>>> error');
            if (e is Failure) {
              return SliverToBoxAdapter(child: FailureBody(message: e.message));
            }
            return SliverToBoxAdapter(child: const FailureBody(message: 'Something went wrong on our end'));
          },
        );
  }

  Widget _buildList(List<Company> companyList) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index.isEven) {
            final company = companyList[index];
            return CompanyListCard(company: company, index: index, onTapHandler: onTapHandler);
          }
          return const Divider(height: 1, color: Colors.grey);
        },
        childCount: companyList.length,
      ),
    );
  }
}
