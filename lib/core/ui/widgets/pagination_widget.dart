import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/errors/app_errors.dart';
import '../../../core/results/result.dart';

import 'footer_widget.dart';


/// Use this widget to do pagination on a list of items
/// 
/// [unit] could be page,offset,..ect, this is the value that indecate the pagination current page
///
class PaginationWidget<T> extends StatefulWidget {
  final RefreshController refreshController;
  final Widget? child;
  final Future<Result<AppErrors, List<T>>> Function(int unit) getItems;
  final void Function(List<T> items, int nextUnit) onDataFetched;
  final int unit;
  final List<T> items;
  final Widget? footer;
  final bool enablePullDown;
  final bool enablePullUp;
  final Axis? scrollDirection;

  const PaginationWidget({
    Key? key,
    required this.refreshController,
    this.child,
    required this.getItems,
    this.unit = 1,
    required this.items,
    required this.onDataFetched,
    this.scrollDirection,
    this.footer,
    this.enablePullDown = true,
    this.enablePullUp = true,
  }) : super(key: key);

  @override
  State<PaginationWidget<T>> createState() => _PaginationWidgetState<T>();
}

class _PaginationWidgetState<T> extends State<PaginationWidget<T>> {
  int _unit = 0;
  bool _endLoadingProducts = false;
  CancelToken cancelToken = CancelToken();
  late List<T> _items;
  @override
  void initState() {
    super.initState();
    _unit = widget.unit;
    _items = List.from(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: widget.enablePullDown,
      scrollDirection: widget.scrollDirection,
      controller: widget.refreshController,
      onLoading: _endLoadingProducts
          ? null
          : () async {
              loadList();
            },
      onRefresh: () async => _refreshList(),
      enablePullUp: enablePullUp(),
      footer: widget.footer ?? FooterWidget(),
      child: widget.child,
    );
  }

  /// Refresh the itmes list
  void _refreshList() async {
    _endLoadingProducts = false;
    _unit = 0;
    await _fetchNewItems(true);

    setState(() {
      widget.onDataFetched(_items, _unit);
      widget.refreshController.refreshCompleted();
    });
  }

  /// Fetch new  itmes
  void loadList() async {
    if (_endLoadingProducts) {
      widget.refreshController.loadComplete();
      return;
    }
    await _fetchNewItems(false);

    setState(() {
      widget.onDataFetched(_items, _unit);
      widget.refreshController.loadComplete();
    });
  }

  /// Refresh items or fetch new items
  Future<void> _fetchNewItems(bool isRefresh) async {
    if (!cancelToken.isCancelled) cancelToken.cancel();
    cancelToken = CancelToken();

    final result = await widget.getItems(_unit++);

    if (result.hasDataOnly) {
      final newListItems = result.data ?? [];
      // if (newListItems.length < widget.limit) {
      if (newListItems.length == 0) {
        _endLoadingProducts = true;
      }
      if (isRefresh) {
        _items = List.from(newListItems);
      } else
        _items.addAll(newListItems);
    } else {
      if (!isRefresh) _unit--;
    }
  }

  bool enablePullUp() {
    return widget.enablePullUp &&
        (!_endLoadingProducts && !widget.refreshController.isRefresh);
  }
}
