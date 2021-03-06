import 'package:barnivore/features/search_flow/search/company.dart';
import 'package:barnivore/features/search_flow/search_flow_controller.dart';
import 'package:barnivore/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompanyListCard extends ConsumerWidget {
  final Company company;
  final int index;
  final Function onTapHandler;

  const CompanyListCard({
    Key? key,
    required this.company,
    required this.index,
    required this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      key: ValueKey('company-$index'),
      child: InkWell(
        onTap: () {
          ref.read(searchFlowControllerProvider.notifier).setCompanyId(company.id);
          onTapHandler(ref);
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity.comfortable,
            title: Text(
              company.companyName,
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            subtitle: Text(company.country),
            trailing: const Icon(Icons.favorite_border),
          ),
        ),
      ),
    );
  }
}
