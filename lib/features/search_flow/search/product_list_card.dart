import 'package:barnivore/core/constants.dart';
import 'package:barnivore/features/search_flow/search/company.dart';
import 'package:barnivore/features/search_flow/search/product.dart';
import 'package:flutter/material.dart';

class ProductListCard extends StatelessWidget {
  const ProductListCard({
    Key? key,
    required this.company,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  final Company company;
  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Material(
        //color: genre.isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(kBorderRadius),
          onTap: onTap,
          child: Container(
            width: 140,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              company.companyName,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
