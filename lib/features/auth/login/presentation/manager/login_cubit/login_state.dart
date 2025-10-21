part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponseModel loginResponseModel;

  LoginSuccess(this.loginResponseModel);
}

final class LoginFailure extends LoginState {
  final LoginApiErrorModel loginApiErrorModel;

  LoginFailure({required this.loginApiErrorModel});
}
