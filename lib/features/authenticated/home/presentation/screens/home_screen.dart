import 'package:ansaap_app/core/utils/assets_manager.dart';
import 'package:ansaap_app/core/widgets/app_custom_button.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: [
        AppCustomButton(
            contentPadding: EdgeInsets.all(10.r),
            child: Row(
              spacing: 5.w,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.h,
                    children: [
                      AppText(
                        'شجرة العائلة',
                        fontSize: 20.sp,
                      ),
                      AppText(
                        'قم بإضافة شجرة عائلتك وتنظيم أفرادها لعرض تاريخ العائلة بشكل مرتب.',
                        maxLines: 3,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  ImgAssets.treeVector,
                  height: 100.h,
                ),
              ],
            ),
            onPressed: () {}),
        AppCustomButton(
            contentPadding: EdgeInsets.all(10.r),
            child: Row(
              spacing: 5.w,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.h,
                    children: [
                      AppText(
                        'عرض العائلات',
                        fontSize: 20.sp,
                      ),
                      AppText(
                        'عرض جميع شجرات العائلات المسجلة لاستكشاف الروابط العائلية.',
                        maxLines: 3,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  ImgAssets.libyaVector,
                  height: 100.h,
                ),
              ],
            ),
            onPressed: () {}),
        AppCustomButton(
            contentPadding: EdgeInsets.all(10.r),
            child: Row(
              spacing: 5.w,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.h,
                    children: [
                      AppText(
                        'البحث عن عائلة',
                        fontSize: 20.sp,
                      ),
                      AppText(
                        'ابحث عن عائلتك أو أي عائلة أخرى لتعرف المزيد عن روابطها وأفرادها.',
                        maxLines: 3,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  ImgAssets.libyaVector,
                  height: 100.h,
                ),
              ],
            ),
            onPressed: () {}),
        AppCustomButton(
            contentPadding: EdgeInsets.all(10.r),
            child: Row(
              spacing: 5.w,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.h,
                    children: [
                      AppText(
                        'إضافة إقتراح',
                        fontSize: 20.sp,
                      ),
                      AppText(
                        'قدم اقتراحاتك لتحسين التطبيق أو إضافة ميزات جديدة.',
                        maxLines: 3,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  ImgAssets.libyaVector,
                  height: 100.h,
                ),
              ],
            ),
            onPressed: () {}),
      ],
    );
  }
}
