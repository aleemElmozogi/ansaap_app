import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class AppCustomButton extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? contentPadding;
  final Function() onPressed;
  const AppCustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.contentPadding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(
              contentPadding ?? EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all<Color>(
              backgroundColor ?? Theme.of(context).scaffoldBackgroundColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r),
                  side: const BorderSide(color: AppColors.grey)))),
      onPressed: onPressed,
      child: child,
    );
  }
}
