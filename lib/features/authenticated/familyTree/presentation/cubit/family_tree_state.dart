import 'package:ansaap_app/core/enums/auth_status.dart';
import 'package:ansaap_app/core/enums/fetch_status.dart';
import 'package:ansaap_app/features/authenticated/familyTree/data/family_tree_content_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/cities_content_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/families_content_model.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_tree_state.freezed.dart';

@freezed
class FamilyTreeState with _$FamilyTreeState {
  const factory FamilyTreeState({
    @Default('') String message,
    @Default(0) int familyId,
    @Default(CallStatus.pure) CallStatus fetchFamilyTreeStatus,
    @Default(CallStatus.pure) CallStatus addFamilyMemberStatus,
   FamilyTreeContentModel? familyTreeContentModel,
  }) = _FamilyTreeState;

}
