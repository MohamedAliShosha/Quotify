import 'package:json_annotation/json_annotation.dart';

part 'login_api_error_model.g.dart';

@JsonSerializable()
class LoginApiErrorModel {
  final String message;
  LoginApiErrorModel({required this.message});

  factory LoginApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$LoginApiErrorModelFromJson(json);
}
