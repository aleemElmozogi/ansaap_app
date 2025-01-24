import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:ansaap_app/core/widgets/app_search_field.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:ansaap_app/core/widgets/loading_indicator.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/families_content_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/presentation/cubit/view_families_cubit.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/presentation/cubit/view_families_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widgets/family_list_item.dart';
class FamiliesView extends StatelessWidget {
  const FamiliesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            spacing: 5.w,
            children: [
              Expanded(
                  flex: 2,
                  child: BlocBuilder<ViewFamiliesCubit, ViewFamiliesState>(
                    builder: (context, state) {
                      return AppSearchField(
                        onChanged: context
                            .read<ViewFamiliesCubit>()
                            .onSearchQueryChanged,
                      );
                    },
                  )),
              Expanded(
                  flex: 1,
                  child: BlocBuilder<ViewFamiliesCubit, ViewFamiliesState>(
                    buildWhen: (previous, current) =>
                    previous.fetchCitiesStatus !=
                        current.fetchCitiesStatus ||
                        previous.selectedCityId != current.selectedCityId,
                    builder: (context, state) {
                      if (state.fetchCitiesStatus.isInProgress) {
                        return const AppLoadingIndicator();
                      }
                      return DropdownButtonFormField<int>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                              AppColors.grey, // Border color when focused
                              width: 0.5,
                            ),
                            borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        value: state.selectedCityId, // Default selected value
                        items: [
                          DropdownMenuItem<int>(
                            value: 0, // Default value
                            child: AppText("الكل"), // Default display text
                          ),
                          ...state.citiesList.map((city) {
                            return DropdownMenuItem<int>(
                              value: city.cityId,
                              child: AppText(city.cityName),
                            );
                          }),
                        ],
                        onChanged:
                        context.read<ViewFamiliesCubit>().onCitySelected,
                        hint: AppText(
                            'اختر مدينة'), // Placeholder when no city is selected
                      );
                    },
                  )),
            ],
          ),
          Expanded(
              child: BlocBuilder<ViewFamiliesCubit, ViewFamiliesState>(
                buildWhen: (previous, current) =>
                previous.fetchFamilyStatus != current.fetchFamilyStatus ||
                    previous.queryResult != current.queryResult ||
                    previous.familiesList != current.familiesList ||
                    previous.selectedCityId != current.selectedCityId ||
                    previous.searchQuery != current.searchQuery,
                builder: (context, state) {
                  final families =
                  context.read<ViewFamiliesCubit>().displayAllFamilies
                      ? state.familiesList
                      : state.queryResult;
                  return state.fetchFamilyStatus.isInProgress
                      ?
                  // Show a loading indicator if data is being fetched
                  const AppLoadingIndicator()
                      : ListView.builder(
                    itemCount:
                    families.length, // Adding 1 for loading or error item
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemBuilder: (context, index) {
                      return FamilyListItem(family: families[index]);
                    },
                  );
                },
              ))
        ],
      ),
    );
  }
}
