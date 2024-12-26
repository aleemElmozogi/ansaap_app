// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialsModel _$CredentialsModelFromJson(Map<String, dynamic> json) =>
    CredentialsModel()
      ..data = json['data'] == null
          ? null
          : CredentialsContentModel.fromJson(
              json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$CredentialsModelToJson(CredentialsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
