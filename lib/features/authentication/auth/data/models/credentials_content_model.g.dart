// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialsContentModel _$CredentialsContentModelFromJson(
        Map<String, dynamic> json) =>
    CredentialsContentModel(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      user: UserContentModel.fromJson(
          json['userContent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CredentialsContentModelToJson(
        CredentialsContentModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'userContent': instance.user,
    };
