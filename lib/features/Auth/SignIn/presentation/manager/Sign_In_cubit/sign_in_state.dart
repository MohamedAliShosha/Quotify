part of 'sign_in_cubit.dart';

abstract class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final User user; // Holds user data like "email and user name"

  SignInSuccess({required this.user});
}

final class SignInFailure extends SignInState {
  final String errorMessage;
  SignInFailure(this.errorMessage);
}
