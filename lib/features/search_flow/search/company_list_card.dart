import 'package:barnivore/core/constants.dart';
import 'package:barnivore/features/search_flow/search/company.dart';
import 'package:barnivore/features/search_flow/search/product.dart';
import 'package:barnivore/theme/palette.dart';
import 'package:flutter/material.dart';

class CompanyProductListCard extends StatelessWidget {
  const CompanyProductListCard({
    Key? key,
    required this.company,
    required this.product,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final Company company;
  final Product product;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      key: ValueKey('company-$index'),
      //color: genre.isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity.comfortable,
            leading: _getStatus(product.status),
            title: Text(
              product.productName,
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            subtitle: Text(company.companyName),
            trailing: Text(product.status),
          ),
        ),
      ),
    );
  }

  Widget _getStatus(String status) {
    if (status == 'Vegan Friendly') {
      return SizedBox(
        width: 32,
        height: 32,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Palette.veganFriendly),
        ),
      );
    }
    return SizedBox(
      width: 32,
      height: 32,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Palette.veganUnfriendly),
      ),
    );
  }
}
