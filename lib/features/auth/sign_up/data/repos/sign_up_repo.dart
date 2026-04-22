import '../models/sign_up_api_error_model.dart';
import '../models/sign_up_request_body.dart';
import '../models/sign_up_response_model.dart';

import 'package:dartz/dartz.dart';

abstract class SignUpRepo {
  Future<Either<SignUpErrorModel, SignUpResponseModel>> signUp(
      {required SignUpRequestBody signUpRequestBody});
}
