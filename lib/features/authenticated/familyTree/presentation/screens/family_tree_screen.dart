import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:ansaap_app/core/utils/dialog_extension.dart';
import 'package:ansaap_app/core/validation/input_validation.dart';
import 'package:ansaap_app/core/widgets/app_button.dart';
import 'package:ansaap_app/core/widgets/app_custom_button.dart';
import 'package:ansaap_app/core/widgets/app_date_form_field.dart';
import 'package:ansaap_app/core/widgets/app_scaffold.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:ansaap_app/core/widgets/app_text_form_field.dart';
import 'package:ansaap_app/core/widgets/loading_indicator.dart';
import 'package:ansaap_app/features/authenticated/familyTree/data/family_member_content_model.dart';
import 'package:ansaap_app/features/authenticated/familyTree/data/family_tree_content_model.dart';
import 'package:ansaap_app/features/authenticated/familyTree/presentation/cubit/family_tree_cubit.dart';
import 'package:ansaap_app/features/authenticated/familyTree/presentation/cubit/family_tree_state.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ansaap_app/core/di/injection.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphview/GraphView.dart';

part 'widgets/family_member_info_item.dart';
part 'widgets/family_tree_graph_view.dart';
part 'widgets/family_member_info_view.dart';
@RoutePage()
class FamilyTreeScreen extends StatelessWidget {
  const FamilyTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'شجرة العائلة',
      contentPadding: EdgeInsets.symmetric(vertical: 25.0),
      body: BlocProvider(
        create: (context) => di.getIt<FamilyTreeCubit>()..fetchFamilyTree(),
        child: BlocBuilder<FamilyTreeCubit, FamilyTreeState>(
          builder: (context, state) {
            if (state.fetchFamilyTreeStatus.isInProgress) {
              return const Center(
                child: AppLoadingIndicator(),
              );
            } else if (state.fetchFamilyTreeStatus.isFailed) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline),
                  const SizedBox(height: 5),
                  AppText(state.message, maxLines: 2,),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: context.read<FamilyTreeCubit>().fetchFamilyTree,
                    child: AppText(
                      'حاول مرة أخرى',
                      fontWeight: FontWeight.bold,
                      textColor: Colors.red,
                    ),
                  ),
                ],
              );
            } else if (state.fetchFamilyTreeStatus.isSucceeded &&
                state.familyTreeContentModel != null) {
              return Expanded(
                child: FamilyTreeGraphView(
                  familyTree: state.familyTreeContentModel!,
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
