import 'dart:convert';

import 'package:ansaap_app/core/models/response_model.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/credentials_content_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';

part 'credentials_model.g.dart';

@JsonSerializable()
class CredentialsModel
    extends ResponseModel<CredentialsModel, CredentialsContentModel> {
  CredentialsModel();

  factory CredentialsModel.fromJson(Map<String, dynamic> json) =>
      _$CredentialsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CredentialsModelToJson(this);

  @override
  CredentialsModel fromJson(Map<String, dynamic> json) =>
      CredentialsModel.fromJson(json);

  @override
  List<Object?> get props => [];
}
