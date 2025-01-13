import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:ansaap_app/core/utils/assets_manager.dart';
import 'package:ansaap_app/core/widgets/app_custom_button.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
part 'widgets/list_item.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.h,
          children: [
            _ListItem(
              title: 'شجرة العائلة',
              description:
                  'قم بإضافة شجرة عائلتك وتنظيم أفرادها لعرض تاريخ العائلة بشكل مرتب.',
              vector: ImgAssets.treeVector,
            ),
            _ListItem(
              title: 'عرض العائلات',
              description:
                  'عرض جميع شجرات العائلات المسجلة لاستكشاف الروابط العائلية.',
              vector: ImgAssets.treeVector,
            ),
            _ListItem(
              title: 'البحث عن عائلة',
              description:
                  'ابحث عن عائلتك أو أي عائلة أخرى لتعرف المزيد عن روابطها وأفرادها.',
              vector: ImgAssets.searchVector,
            ),
            _ListItem(
              title: 'إضافة إقتراح',
              description: 'قدم اقتراحاتك لتحسين التطبيق أو إضافة ميزات جديدة.',
              vector: ImgAssets.requestVector,
            ),
          ],
        ),
      ),
    );
  }
}
