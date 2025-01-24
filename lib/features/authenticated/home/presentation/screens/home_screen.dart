import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:ansaap_app/core/utils/assets_manager.dart';
import 'package:ansaap_app/core/utils/dialog_extension.dart';
import 'package:ansaap_app/core/widgets/app_custom_button.dart';
import 'package:ansaap_app/core/widgets/app_list.dart';
import 'package:ansaap_app/core/widgets/app_search_field.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:ansaap_app/core/widgets/app_text_form_field.dart';
import 'package:ansaap_app/core/widgets/loading_indicator.dart';
import 'package:ansaap_app/features/authenticated/sendSuggestion/presentation/screens/send_suggestion_screen.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/families_content_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/presentation/cubit/view_families_cubit.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/presentation/cubit/view_families_state.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/presentation/screens/family_view_screen.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              onPressed: () {},
            ),
            _ListItem(
              title: 'عرض العائلات',
              description:
                  'عرض جميع شجرات العائلات المسجلة لاستكشاف الروابط العائلية.',
              vector: ImgAssets.treeVector,
              onPressed: () {
                context.showAppBottomSheet(
                    child: BlocProvider.value(
                  value: context.read<ViewFamiliesCubit>(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.h),
                    child: Column(
                      spacing: 10,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: BackButton()
                        ),
                        Expanded(
                            child: FamiliesView()),
                      ],
                    ),
                  ),
                ));
              },
            ),
            _ListItem(
              title: 'البحث عن عائلة',
              description:
                  'ابحث عن عائلتك أو أي عائلة أخرى لتعرف المزيد عن روابطها وأفرادها.',
              vector: ImgAssets.searchVector,
              onPressed: () {
                context.showAppBottomSheet(
                    child: BlocProvider.value(
                  value: context.read<ViewFamiliesCubit>(),
                  child: SizedBox(
                    height: .7.sh,
                    child: FamiliesView(),
                  ),
                ));
              },
            ),
            _ListItem(
              title: 'إضافة إقتراح',
              description: 'قدم اقتراحاتك لتحسين التطبيق أو إضافة ميزات جديدة.',
              vector: ImgAssets.requestVector,
              onPressed: () {
                context.showAppBottomSheet(
                    child: SizedBox(
                      height: .55.sh,
                      child: SendSuggestionScreen(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

