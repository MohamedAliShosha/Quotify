import 'package:json_annotation/json_annotation.dart';

part 'sign_up_api_error_model.g.dart';

@JsonSerializable()
class SignUpErrorModel {
  final String message;
  final Map<String, List<String>>? data;
  final bool status;
  final int code;

  SignUpErrorModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory SignUpErrorModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpErrorModelFromJson(json);
}
