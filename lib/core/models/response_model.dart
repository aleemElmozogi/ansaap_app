import 'package:json_annotation/json_annotation.dart';
import 'package:ansaap_app/core/models/json_model.dart';

@JsonSerializable(genericArgumentFactories: true)
abstract class ResponseModel<T, D extends Object> extends JsonModel<T> {
  // @JsonKey(name: 'statusCode')
  // int? statusCode;

  @JsonKey(name: 'data')
  late final D? data;
}
