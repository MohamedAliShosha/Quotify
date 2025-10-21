import '../../../../core/utils/constants.dart';

import '../data/models/login_request_body.dart';
import '../data/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class LoginService {
  factory LoginService(Dio dio, {String? baseUrl}) = _LoginService;

  @POST('/auth/login')
  Future<LoginResponseModel> login(@Body() LoginRequestBody loginRequestBody);
}
