import '../models/login_api_error_model.dart';

import '../models/login_request_body.dart';
import '../models/login_response.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<LoginApiErrorModel, LoginResponseModel>> login(
      {required LoginRequestBody loginRequestBody});
}
