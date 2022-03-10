import 'package:barnivore/features/search_flow/search_flow_controller.dart';
import 'package:barnivore/features/search_flow/search_service.dart';
import 'package:barnivore/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomPersistentHeader extends ConsumerStatefulWidget {
  final Function onSearchHandler;
  const CustomPersistentHeader({Key? key, required this.onSearchHandler}) : super(key: key);

  @override
  _CustomPersistentHeaderState createState() => _CustomPersistentHeaderState();
}

class _CustomPersistentHeaderState extends ConsumerState<CustomPersistentHeader> {
  late final TextEditingController _searchController;
  late final _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
    _searchFocusNode.requestFocus();
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
            child: SearchField(_searchController, widget.onSearchHandler, _clearTextField),
          ),
        ),
      ),
    );
  }

  void _clearTextField() {
    _searchController.clear();
    _searchFocusNode.requestFocus();
  }
}

class SearchField extends ConsumerWidget {
  final TextEditingController _searchController;
  final Function _searchHandler;
  final VoidCallback _clearTextField;
  SearchField(this._searchController, this._searchHandler, this._clearTextField);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TypeAheadFormField(
        textFieldConfiguration: TextFieldConfiguration(
          controller: _searchController,
          onSubmitted: (_) {
            debugPrint('onSubmitted, ${_searchController.text}');
            search(ref, _searchController.text);
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.Green),
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: const EdgeInsets.only(left: 10),
            //filled: true,
            hintText: 'Search for Booze',
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Palette.Green),
              iconSize: 18.0,
              color: Palette.Green,
              onPressed: _searchController.text.isEmpty ? null : _clearTextField,
            ),
          ),
          style: const TextStyle(),
        ),
        hideOnEmpty: true,
        //keepSuggestionsOnLoading: false,
        suggestionsCallback: (pattern) async {
          if (_searchController.text.length < 2) {
            return Future.value([]);
          } else {
            final searchService = ref.read(searchServiceProvider);
            return await _typeahead(searchService);
          }
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion as String),
          );
        },
        transitionBuilder: (context, suggestionsBox, controller) {
          return suggestionsBox;
        },
        onSuggestionSelected: (suggestion) {
          this._searchController.text = suggestion as String;
          search(ref, this._searchController.text);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Search for booze...';
          }
        });
  }

  Future<List<String?>> _typeahead(SearchService searchService) async {
    final results = await searchService.typeahead(_searchController.text);
    return results.when(
      (error) {
        return Future.value(['An error occurred...sorry!']);
      },
      (typeaheadResults) {
        return typeaheadResults;
      },
    );
  }

  void search(WidgetRef ref, String text) {
    ref.read(searchFlowControllerProvider.notifier).setKeyword(text);
    _searchHandler(ref);
  }
}

/*class _SearchField extends ConsumerWidget {
  final TextEditingController _searchController;
  final Function _searchHandler;
  final VoidCallback _clearTextField;
  SearchField(this._searchController, this._searchHandler, this._clearTextField);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: _searchController,
      onSubmitted: (_) {
        ref.read(searchFlowControllerProvider.notifier).setKeyword(_searchController.text);
        _searchHandler(ref);
      },
      style: const TextStyle(),
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.Green),
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsets.only(left: 10),
          //filled: true,
          hintText: 'Search for Booze',
          suffixIcon: IconButton(
            icon: Icon(Icons.clear, color: Palette.Green),
            iconSize: 18.0,
            color: Palette.Green,
            onPressed: _searchController.text.isEmpty ? null : _clearTextField,
          )),
    );
  }
}*/

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
