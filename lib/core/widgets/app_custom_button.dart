import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class AppCustomButton extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  final int borderRadius;
  final Color? backgroundColor;
  final Color borderColor;
  final EdgeInsets? contentPadding;
  final Function() onPressed;
  const AppCustomButton({
    super.key,
    required this.child,
    this.borderColor = AppColors.grey,
    required this.onPressed,
    this.contentPadding,
    this.borderWidth = 1.0,
    this.borderRadius = 7,
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
                  borderRadius: BorderRadius.circular(borderRadius.r),
                  side: BorderSide(color: borderColor, width: borderWidth)))),
      onPressed: onPressed,
      child: child,
    );
  }
}
