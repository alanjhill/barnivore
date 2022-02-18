import 'package:barnivore/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      pinned: false,
      expandedHeight: 100.0,
      flexibleSpace: FlexibleSpaceBar(
        background: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[Palette.almostBlack, Palette.Green],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Image.asset(
              'assets/images/logo-300x90.png',
              alignment: Alignment.bottomCenter,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
