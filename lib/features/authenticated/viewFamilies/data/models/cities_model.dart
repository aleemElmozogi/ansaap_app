import 'dart:convert';

import 'package:ansaap_app/core/models/response_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/families_content_model.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/credentials_content_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';

import 'cities_content_model.dart';

part 'cities_model.g.dart';

@JsonSerializable()
class CitiesModel
    extends ResponseModel<CitiesModel, List<CitiesContentModel>> {
  CitiesModel();

  factory CitiesModel.fromJson(Map<String, dynamic> json) =>
      _$CitiesModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CitiesModelToJson(this);

  @override
  CitiesModel fromJson(Map<String, dynamic> json) =>
      CitiesModel.fromJson(json);

  @override
  List<Object?> get props => [];
}
