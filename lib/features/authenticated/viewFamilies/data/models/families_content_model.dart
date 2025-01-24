import 'dart:convert';

import 'package:ansaap_app/core/models/json_model.dart';
import 'package:ansaap_app/core/models/response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';

import 'cities_content_model.dart';

part 'families_content_model.g.dart';

@JsonSerializable()
class FamiliesContentModel extends JsonModel<FamiliesContentModel> {
  FamiliesContentModel({
    required this.familyName,
    required this.familyId,
    this.cityContentModel,
  });

  @JsonKey(defaultValue: '')
  final String familyName;
  @JsonKey(defaultValue: 0)
  final int familyId;
  @JsonKey(name: 'cityContent')
  final CitiesContentModel? cityContentModel;

  factory FamiliesContentModel.fromJson(Map<String, dynamic> json) =>
      _$FamiliesContentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FamiliesContentModelToJson(this);

  factory FamiliesContentModel.fromStorage(String data) =>
      FamiliesContentModel.fromJson(json.decode(data));

  @override
  FamiliesContentModel fromJson(Map<String, dynamic> json) =>
      FamiliesContentModel.fromJson(json);

  @override
  List<Object?> get props => [cityContentModel, familyId, familyName];
}
