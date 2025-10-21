import 'package:starter_template/features/auth/sign_up/models/sign_up_api_error_model.dart';
import 'package:starter_template/features/auth/sign_up/models/sign_up_request_body.dart';
import 'package:starter_template/features/auth/sign_up/models/sign_up_response_model.dart';

import 'sign_up_repo.dart';
import '../../service/sign_up_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignUpRepoImplement implements SignUpRepo {
  final SignUpService signUpService;

  SignUpRepoImplement(this.signUpService);

  @override
  Future<Either<SignUpErrorModel, SignUpResponseModel>> signUp(
      {required SignUpRequestBody signUpRequestBody}) async {
    try {
      final response = await signUpService.signUp(signUpRequestBody);
      return Right(response);
    } on DioException catch (e) {
      return Left(
        SignUpErrorModel.fromJson(e.response?.data as Map<String, dynamic>),
      );
    }
  }
}
