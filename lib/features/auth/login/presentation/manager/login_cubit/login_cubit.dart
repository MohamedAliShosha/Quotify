import 'package:starter_template/core/utils/shared_pref_helper.dart';
import 'package:starter_template/core/utils/shared_pref_keys.dart';
import 'package:starter_template/features/auth/login/data/models/login_api_error_model.dart';

import '../../../data/models/login_request_body.dart';
import '../../../data/models/login_response.dart';
import '../../../data/repos/login_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final LoginRepo loginRepo;
  Future<void> login(LoginRequestBody loginRequestBody) async {
    emit(LoginLoading());

    final result = await loginRepo.login(loginRequestBody: loginRequestBody);
    result.fold(
      (loginApiErrorModel) {
        emit(
          LoginFailure(
            loginApiErrorModel: loginApiErrorModel,
          ),
        );
      },
      (loginResponse) {
        emit(
          LoginSuccess(loginResponse),
        );
        saveUserAccessToken(loginResponse.data.token);
        saveUserName(loginResponse.data.username);
        saveUserEmail(loginRequestBody.email);
      },
    );
  }
}

/// Method that saves user access token
Future<void> saveUserAccessToken(String? accessToken) async {
  // Assuming you have a method to save the token in shared preferences
  await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userToken, accessToken!); // save userToken

  debugPrint('User access token saved: $accessToken');
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
