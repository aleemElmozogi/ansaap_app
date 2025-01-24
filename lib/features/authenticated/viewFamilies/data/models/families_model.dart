import 'dart:convert';

import 'package:ansaap_app/core/models/response_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/families_content_model.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/credentials_content_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';

part 'families_model.g.dart';

@JsonSerializable()
class FamiliesModel
    extends ResponseModel<FamiliesModel, List<FamiliesContentModel>> {
  FamiliesModel();

  factory FamiliesModel.fromJson(Map<String, dynamic> json) =>
      _$FamiliesModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FamiliesModelToJson(this);

  @override
  FamiliesModel fromJson(Map<String, dynamic> json) =>
      FamiliesModel.fromJson(json);

  @override
  List<Object?> get props => [];
}
