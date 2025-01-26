import 'dart:convert';

import 'package:ansaap_app/core/enums/familiy_visability_state.dart';
import 'package:ansaap_app/core/models/json_model.dart';
import 'package:ansaap_app/features/authenticated/familyTree/data/family_member_content_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/cities_content_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_tree_content_model.g.dart';

@JsonSerializable()
class FamilyTreeContentModel extends JsonModel<FamilyTreeContentModel> {
  FamilyTreeContentModel({
    required this.cityName,
    required this.cityId,
    required this.familyId,
    required this.familyName,
    required this.familyVisibility,
    required this.familyMembers,
    required this.cityContentModel,
  });
  @JsonKey(defaultValue: 0)
  final int familyId;
  @JsonKey(defaultValue: '')
  final String familyName;
  @JsonKey(defaultValue: 0)
  final int cityId;
  @JsonKey(defaultValue: '')
  final String cityName;
  @JsonKey(
      defaultValue: FamilyVisibilityState.visible,
      fromJson: FamilyVisibilityState.fromJson)
  final FamilyVisibilityState familyVisibility;
  @JsonKey(defaultValue: [])
  final List<FamilyMemberContentModel> familyMembers;
  @JsonKey(name: 'cityContent')
  final CitiesContentModel? cityContentModel;

  factory FamilyTreeContentModel.fromJson(Map<String, dynamic> json) =>
      _$FamilyTreeContentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FamilyTreeContentModelToJson(this);

  factory FamilyTreeContentModel.fromStorage(String data) =>
      FamilyTreeContentModel.fromJson(json.decode(data));

  @override
  FamilyTreeContentModel fromJson(Map<String, dynamic> json) =>
      FamilyTreeContentModel.fromJson(json);

  @override
  List<Object?> get props => [
        familyMembers,
        cityName,
        cityId,
        familyVisibility,
        familyId,
        familyName,
        cityContentModel
      ];
}
