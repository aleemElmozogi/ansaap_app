import 'dart:convert';

import 'package:ansaap_app/core/models/response_model.dart';
import 'package:ansaap_app/features/authenticated/familyTree/data/family_tree_content_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/families_content_model.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/credentials_content_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';


part 'family_tree_model.g.dart';

@JsonSerializable()
class FamilyTreeModel
    extends ResponseModel<FamilyTreeModel, FamilyTreeContentModel> {
  FamilyTreeModel();

  factory FamilyTreeModel.fromJson(Map<String, dynamic> json) =>
      _$FamilyTreeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FamilyTreeModelToJson(this);

  @override
  FamilyTreeModel fromJson(Map<String, dynamic> json) =>
      FamilyTreeModel.fromJson(json);

  @override
  List<Object?> get props => [];
}
