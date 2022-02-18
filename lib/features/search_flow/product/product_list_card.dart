import 'package:barnivore/core/constants.dart';
import 'package:barnivore/features/search_flow/search/company.dart';
import 'package:barnivore/features/search_flow/search/product.dart';
import 'package:barnivore/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListCard extends ConsumerWidget {
  const ProductListCard({
    Key? key,
    required this.company,
    required this.product,
    required this.index,
    required this.onTapHandler,
  }) : super(key: key);

  final Company company;
  final Product product;
  final int index;
  final Function onTapHandler;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      key: ValueKey('product-$index'),
      child: InkWell(
        borderRadius: BorderRadius.circular(kBorderRadius),
        onTap: () {
          onTapHandler(ref);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity.comfortable,
            isThreeLine: true,
            leading: _getStatus(product.redYellowGreen),
            title: Text(
              product.productName,
            ),
            subtitle: Text('${company.companyName}, ${company.country}\n\n${product.status}'),
            trailing: const Icon(Icons.favorite_border),
          ),
        ),
      ),
    );
  }

  Widget _getStatus(String redYellowGreen) {
    if (redYellowGreen == 'Green') {
      return SizedBox(
        width: 32,
        height: 32,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Palette.Green),
        ),
      );
    } else if (redYellowGreen == 'Red') {
      return SizedBox(
        width: 32,
        height: 32,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Palette.Red),
        ),
      );
    } else {
      return SizedBox(
        width: 32,
        height: 32,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Palette.Yellow),
        ),
      );
    }
  }
}
