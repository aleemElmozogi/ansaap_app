import 'package:json_annotation/json_annotation.dart';

part 'post_request.g.dart';

@JsonSerializable(createFactory: false)
class PostRequest {
  final int? id;
  final num? pageNumber;

  PostRequest({required this.id, required this.pageNumber});

  Map<String, dynamic> toJson() => _$PostRequestToJson(this);
}
