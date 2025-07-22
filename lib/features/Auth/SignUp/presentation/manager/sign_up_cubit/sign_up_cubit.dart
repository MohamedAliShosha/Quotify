import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/features/auth/SignUp/data/repos/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpLoading());

  final SignUpRepo signUpRepo;

  Future<void> signUp({required String email, required String password}) async {
    emit(SignUpLoading());

    final result = await signUpRepo.signUp(email: email, password: password);
    result.fold((failure) {
      emit(SignUpFailure(errorMessage: failure.errorMessage));
    }, (user) {
      emit(SignUpSuccess(user: user));
    });
  }
}
