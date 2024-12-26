// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserContentModel _$UserContentModelFromJson(Map<String, dynamic> json) =>
    UserContentModel(
      userName: json['fullName'] as String? ?? '',
      userEmail: json['email'] as String? ?? '',
      profileImageUrl: json['imageUrl'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      walletTotal: json['walletTotal'] as num? ?? 0,
    );

Map<String, dynamic> _$UserContentModelToJson(UserContentModel instance) =>
    <String, dynamic>{
      'fullName': instance.userName,
      'email': instance.userEmail,
      'imageUrl': instance.profileImageUrl,
      'phoneNumber': instance.phoneNumber,
      'walletTotal': instance.walletTotal,
    };
