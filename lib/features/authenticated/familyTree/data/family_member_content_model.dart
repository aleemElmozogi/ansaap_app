import 'dart:convert';

import 'package:ansaap_app/core/enums/familiy_visability_state.dart';
import 'package:ansaap_app/core/models/json_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_member_content_model.g.dart';

@JsonSerializable()
class FamilyMemberContentModel extends JsonModel<FamilyMemberContentModel> {
  FamilyMemberContentModel({
    required this.id,
    required this.name,
    required this.familyId,
    required this.dateOfBirth,
    required this.dateOfDeath,
    required this.parentId,
    required this.parentName,
  });
  @JsonKey(defaultValue: 0)
  final int familyId;
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String dateOfBirth;
  @JsonKey()
  final String? dateOfDeath;
  @JsonKey()
  final int? parentId;
  @JsonKey()
  final String? parentName;

  factory FamilyMemberContentModel.fromJson(Map<String, dynamic> json) =>
      _$FamilyMemberContentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FamilyMemberContentModelToJson(this);

  factory FamilyMemberContentModel.fromStorage(String data) =>
      FamilyMemberContentModel.fromJson(json.decode(data));

  @override
  FamilyMemberContentModel fromJson(Map<String, dynamic> json) =>
      FamilyMemberContentModel.fromJson(json);

  @override
  List<Object?> get props =>
      [id, name, familyId, dateOfBirth, dateOfDeath, parentId, parentName];
}
