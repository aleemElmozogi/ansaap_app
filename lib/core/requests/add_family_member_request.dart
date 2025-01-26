import 'package:json_annotation/json_annotation.dart';

part 'add_family_member_request.g.dart';

@JsonSerializable(createFactory: false)
class AddFamilyMemberRequest {
  final int parentId;
  final int familyId;
  final String name;
  final DateTime? dateOfBirth;
  final DateTime? dateOfDeath;

  AddFamilyMemberRequest(
      {required this.parentId,
      required this.name,
      required this.familyId,
      this.dateOfDeath,
      this.dateOfBirth});

  Map<String, dynamic> toJson() => _$AddFamilyMemberRequestToJson(this);
}
