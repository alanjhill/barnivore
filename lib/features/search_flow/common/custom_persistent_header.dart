import 'package:barnivore/features/search_flow/search_flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomPersistentHeader extends ConsumerStatefulWidget {
  final Function onSearchHandler;
  const CustomPersistentHeader({Key? key, required this.onSearchHandler}) : super(key: key);

  @override
  _CustomPersistentHeaderState createState() => _CustomPersistentHeaderState();
}

class _CustomPersistentHeaderState extends ConsumerState<CustomPersistentHeader> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: false,
      delegate: _SliverPersistentHeaderDelegate(
        Theme.of(context).canvasColor,
        Container(
          padding: const EdgeInsets.only(top: 16.0),
          child: FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 0.7,
            child: TextField(
              controller: _searchController,
              onSubmitted: (_) {
                ref.read(searchFlowControllerProvider.notifier).setKeyword(_searchController.text);
                widget.onSearchHandler(ref);
              },
              style: TextStyle(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: const EdgeInsets.only(left: 10),
                //filled: true,
                hintText: 'Search for Booze',
              ),
            ),
          ),
        ),
      ),
    );
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
