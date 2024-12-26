import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable(createFactory: false)
class SignupRequest {
  final String email;
  final String password;
  @JsonKey(name: 'firstname')
  final String firstName;
  @JsonKey(name: 'lastname')
  final String lastName;
  final String? phoneNumber;

  SignupRequest({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
