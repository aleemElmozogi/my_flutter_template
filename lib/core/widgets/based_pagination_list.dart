import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_template/generated/l10n.dart';

typedef ItemBuilder<T> =
    Widget Function(BuildContext context, T item, int index);
typedef FetchMoreCallback = Future<void> Function();

class BasePaginationList<T> extends StatefulWidget {
  final List<T> items;
  final ItemBuilder<T> itemBuilder;
  final FetchMoreCallback onFetchMore;
  final bool isLoadingMore;
  final bool hasMore;
  final Widget? loadingWidget;
  final Widget? emptyWidget;

  const BasePaginationList({
    Key? key,
    required this.items,
    required this.itemBuilder,
    required this.onFetchMore,
    required this.isLoadingMore,
    required this.hasMore,
    this.loadingWidget,
    this.emptyWidget,
  }) : super(key: key);

  @override
  _BasePaginationListState<T> createState() => _BasePaginationListState<T>();
}

class _BasePaginationListState<T> extends State<BasePaginationList<T>> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !widget.isLoadingMore &&
        widget.hasMore) {
      widget.onFetchMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty && !widget.isLoadingMore) {
      return widget.emptyWidget ??
          Center(child: AppText(S.of(context).emptyListMessage));
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.items.length + (widget.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == widget.items.length) {
          return widget.loadingWidget ??
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
        }
        return widget.itemBuilder(context, widget.items[index], index);
      },
    );
  }
}
