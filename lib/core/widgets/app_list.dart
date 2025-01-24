import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:ansaap_app/core/widgets/loading_indicator.dart';
import 'package:ansaap_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef WidgetBuilder = Widget Function(int index);

class AppList extends StatelessWidget {
  final WidgetBuilder widgetBuilder;
  final int itemCount;
  final void Function()? fetchData;
  final bool hasMore;
  final bool isLoading;
  final bool isError;
  final String? errorMessage;
  final void Function()? retry;
  final void Function()? refresh;
  final Widget? header;
  final Color foregroundColor;
  final ScrollPhysics scrollPhysics;
  final Color backgroundColor;

  const AppList({
    Key? key,
    required this.widgetBuilder,
    required this.itemCount,
    this.fetchData,
    this.hasMore = false,
    this.scrollPhysics =
        const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    this.isLoading = false,
    this.isError = false,
    this.errorMessage,
    this.header,
    this.retry,
    this.refresh,
    this.foregroundColor = AppColors.black,
    this.backgroundColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isNewLoading = isLoading && itemCount == 0;
    final isNewError = isError && itemCount == 0;
    return CustomScrollView(
      physics: scrollPhysics,
      slivers: <Widget>[
        CupertinoSliverRefreshControl(
          builder: (context, refreshState, pulledExtent,
                  refreshTriggerPullDistance, refreshIndicatorExtent) =>
              SizedBox.shrink(),
          onRefresh: refresh != null ? () async => refresh!() : null,
        ),
        SliverToBoxAdapter(child: header ?? const SizedBox(height: 1)),
        isNewLoading
            ? const AppLoadingIndicator()
            : isNewError
                ? _emptyContainer()
                : SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      if (index == itemCount) {
                        if (hasMore) {
                          if (!isLoading) {
                            if (fetchData != null) fetchData!();
                          }
                        } else if (itemCount == 0) {
                          return _emptyContainer();
                        }
                        return Container(
                          height: 3,
                          color: Colors.transparent,
                        );
                      }
                      return widgetBuilder(index);
                    }, childCount: itemCount
                        // +  ((isError?  itemCount == 0 ? hasMore) ? 1 : 0),
                        ),
                  ),
      ],
    );
  }

  Center _emptyContainer() {
    return Center(
      child: AppText(errorMessage ?? 'يبدوا ان هذه الصفحة فارغة'),
    );
  }
}
