import 'package:ansaap_app/core/widgets/error_widget.dart';
import 'package:flutter/material.dart';

typedef FetchItems<T> = Future<List<T>> Function(int page);

class BasePaginationWidget<T> extends StatefulWidget {
  final FetchItems<T> fetchMore; // Function to fetch more items (pagination)
  final FetchItems<T> refresh; // Function to refresh items (reset pagination)
  final Widget Function(T item) itemBuilder; // Widget to build individual items
  final Widget Function()? errorWidget; // Widget to show errors
  final Widget Function()? loadingWidget; // Widget to show loading state
  final int itemsPerPage; // Number of items per page

  const BasePaginationWidget({
    Key? key,
    required this.fetchMore,
    required this.refresh,
    required this.itemBuilder,
    this.errorWidget,
    this.loadingWidget,
    this.itemsPerPage = 10,
  }) : super(key: key);

  @override
  _BasePaginationWidgetState<T> createState() =>
      _BasePaginationWidgetState<T>();
}

class _BasePaginationWidgetState<T> extends State<BasePaginationWidget<T>> {
  List<T> _items = [];
  bool _isLoading = false;
  bool _hasMore = true;
  bool _isError = false;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _loadInitialItems();
  }

  // Load initial items (for refreshing)
  Future<void> _loadInitialItems() async {
    setState(() {
      _isLoading = true;
      _isError = false;
    });

    try {
      final items = await widget.refresh(1); // Use refresh to load fresh data
      setState(() {
        _items = items;
        _hasMore = items.length == widget.itemsPerPage;
      });
    } catch (e) {
      setState(() {
        _isError = true;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Load more items (for pagination)
  Future<void> _loadMoreItems() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final items = await widget.fetchMore(_currentPage + 1);
      setState(() {
        _items.addAll(items);
        _hasMore = items.length == widget.itemsPerPage;
        _currentPage++;
      });
    } catch (e) {
      setState(() {
        _isError = true;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Refresh the data (triggered by pulling down)
  Future<void> _onRefresh() async {
    setState(() {
      _isLoading = true;
      _isError = false;
      _hasMore = true;
      _currentPage = 1;
    });

    try {
      final items = await widget.refresh(1); // Use refresh to reset data
      setState(() {
        _items = items;
        _hasMore = items.length == widget.itemsPerPage;
      });
    } catch (e) {
      setState(() {
        _isError = true;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isError) {
      return widget.errorWidget != null
          ? widget.errorWidget!()
          : Center(
              child: AppErrorWidget(
                onPress: () => widget.refresh,
              ),
            );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        // Detect scroll direction
        if (scrollInfo is ScrollUpdateNotification) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.minScrollExtent) {
            // User scrolled to the top, trigger refresh
            if (!_isLoading) _onRefresh();
          } else if (scrollInfo.metrics.pixels ==
              scrollInfo.metrics.maxScrollExtent) {
            // User scrolled to the bottom, trigger fetch more items
            if (!_isLoading) _loadMoreItems();
          }
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: _items.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _items.length) {
              return widget.loadingWidget != null
                  ? widget.loadingWidget!()
                  : const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
            }
            return widget.itemBuilder(_items[index]);
          },
        ),
      ),
    );
  }
}
