import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  final String message;
  final RegisterData data;
  final bool status;
  final int code;
  SignUpResponseModel(
    this.data,
    this.status,
    this.code, {
    required this.message,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);
}

@JsonSerializable()
class RegisterData {
  final String token;
  final String username;

  RegisterData({
    required this.token,
    required this.username,
  });
  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);
}
