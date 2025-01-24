// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserContentModel _$UserContentModelFromJson(Map<String, dynamic> json) =>
    UserContentModel(
      fullName: json['fullName'] as String? ?? '',
      userEmail: json['email'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
    );

Map<String, dynamic> _$UserContentModelToJson(UserContentModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'userName': instance.userName,
      'email': instance.userEmail,
      'phoneNumber': instance.phoneNumber,
    };
