import 'dart:convert';

import 'package:ansaap_app/core/models/json_model.dart';
import 'package:ansaap_app/core/models/response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';

part 'cities_content_model.g.dart';

@JsonSerializable()
class CitiesContentModel extends JsonModel<CitiesContentModel> {
  CitiesContentModel({
    required this.cityName,
    required this.cityId,
  });
  @JsonKey(defaultValue: 0)
  final int cityId;
  @JsonKey(defaultValue: '')
  final String cityName;
  factory CitiesContentModel.fromJson(Map<String, dynamic> json) =>
      _$CitiesContentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CitiesContentModelToJson(this);

  factory CitiesContentModel.fromStorage(String data) =>
      CitiesContentModel.fromJson(json.decode(data));

  @override
  CitiesContentModel fromJson(Map<String, dynamic> json) =>
      CitiesContentModel.fromJson(json);

  @override
  List<Object?> get props => [cityName, cityId];
}
