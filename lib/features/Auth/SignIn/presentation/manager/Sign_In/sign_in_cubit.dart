import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/features/Auth/SignIn/data/repos/sign_in_repo.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInRepo) : super(SignInLoading());

  /*
  "Programming to an interface, not an implementation. So I used SignInRepo not SignInRepoImplemet"
  The cubit doesn't need to know the internal details of the implementation.
  It only needs to know the available functions through the interface (like signIn).
  So, if you later switch from Firebase to an external API, or want to create a mock for testing, you won’t need to change anything in the cubit.

  Here, you're passing the actual implementation to the interface, but the cubit itself doesn't care who is executing it.
  BlocProvider(
  create: (_) => SignInCubit(SignInRepoImplement()),
),
  */
  final SignInRepo signInRepo;

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());

    final result = await signInRepo.signIn(email: email, password: password);
    result.fold((failure) {
      emit(SignInFailure(failure.errorMessage));
    }, (user) {
      emit(SignInSuccess(user: user));
    });
  }
}
