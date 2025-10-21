import 'package:starter_template/features/auth/sign_up/models/sign_up_request_body.dart';
import 'package:starter_template/features/auth/sign_up/models/sign_up_response_model.dart';

import '../../../../core/utils/constants.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class SignUpService {
  factory SignUpService(Dio dio, {String? baseUrl}) = _SignUpService;

  @POST('/auth/register')
  Future<SignUpResponseModel> signUp(
      @Body() SignUpRequestBody signUpRequestBody);
}
