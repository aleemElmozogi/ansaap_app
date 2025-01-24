import 'package:ansaap_app/core/models/json_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_content_model.g.dart';

@JsonSerializable()
class UserContentModel extends JsonModel<UserContentModel> {
  @JsonKey(name: 'fullName', defaultValue: '')
  final String? fullName;
  @JsonKey(name: 'userName', defaultValue: '')
  final String? userName;
  @JsonKey(name: 'email', defaultValue: '')
  final String? userEmail;

  @JsonKey(name: 'phoneNumber', defaultValue: '')
  final String? phoneNumber;


  UserContentModel({
    this.fullName,
    this.userEmail,
    this.phoneNumber,
    this.userName,
  });

  factory UserContentModel.fromJson(Map<String, dynamic> json) =>
      _$UserContentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserContentModelToJson(this);

  @override
  UserContentModel fromJson(Map<String, dynamic> json) =>
      UserContentModel.fromJson(json);

  @override
  List<Object?> get props =>
      [userEmail, fullName,  phoneNumber,userName];
}
