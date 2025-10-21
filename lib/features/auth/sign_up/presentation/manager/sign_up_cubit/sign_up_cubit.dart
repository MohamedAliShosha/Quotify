import 'package:starter_template/features/auth/sign_up/models/sign_up_api_error_model.dart';
import 'package:starter_template/features/auth/sign_up/models/sign_up_request_body.dart';
import 'package:starter_template/features/auth/sign_up/models/sign_up_response_model.dart';

import '../../../../../../core/utils/shared_pref_helper.dart';
import '../../../../../../core/utils/shared_pref_keys.dart';

import '../../../data/repos/sign_up_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());

  final SignUpRepo signUpRepo;

  Future<void> signUp(SignUpRequestBody signUpRequestBody) async {
    emit(SignUpLoading());

    final result =
        await signUpRepo.signUp(signUpRequestBody: signUpRequestBody);
    result.fold(
      (apiErrorModel) {
        emit(
          SignUpFailure(
            apiErrorModel,
          ),
        );
      },
      (signUpResponseModel) {
        emit(
          SignUpSuccess(signUpResponseModel),
        );
        saveUserAccessToken(signUpResponseModel.data.token);
        saveUserName(signUpResponseModel.data.username);
        saveUserEmail(signUpRequestBody.email);
      },
    );
  }
}

/// Method that saves user access token
Future<void> saveUserAccessToken(String? accessToken) async {
  if (accessToken != null) {
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken, accessToken); // save userToken

    debugPrint('User access token saved: $accessToken');
  } else {
    debugPrint('Access token is null, not saved.');
  }
}

/// Method that saves user refresh token
Future<void> saveUserName(String? userName) async {
  // Assuming you have a method to save the token in shared preferences
  await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userName, userName!); // save userName

  debugPrint('User name saved: $userName');
}

/// Method that saves user email
Future<void> saveUserEmail(String? userEmail) async {
  // Assuming you have a method to save the token in shared preferences
  await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userEmail, userEmail!); // save userEmail

  debugPrint('User email saved: $userEmail');
}
