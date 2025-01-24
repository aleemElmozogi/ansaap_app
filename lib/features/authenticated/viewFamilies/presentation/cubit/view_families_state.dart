import 'package:ansaap_app/core/enums/auth_status.dart';
import 'package:ansaap_app/core/enums/fetch_status.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/cities_content_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/families_content_model.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_families_state.freezed.dart';

@freezed
class ViewFamiliesState with _$ViewFamiliesState {
  const factory ViewFamiliesState({
    @Default('') String message,
    @Default('') String searchQuery,
    @Default(0) int selectedCityId,
    @Default(CallStatus.pure) CallStatus fetchFamilyStatus,
    @Default(CallStatus.pure) CallStatus fetchCitiesStatus,
    @Default([]) List<CitiesContentModel> citiesList,
    @Default([]) List<FamiliesContentModel> familiesList,
    @Default([]) List<FamiliesContentModel> queryResult,
  }) = _ViewFamiliesState;

}
