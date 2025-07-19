import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:starter_template/core/errors/failures.dart';
import 'package:starter_template/features/Auth/SignUp/data/repos/sign_up_repo.dart';

class SignUpRepoImplement implements SignUpRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failures, User>> signUp(
      {required String email, required String password}) async {
    if (email.isEmpty) {
      return Left(ServerFailure('Email cannot be empty'));
    }
    if (password.isEmpty) {
      return Left(ServerFailure('Password cannot be empty'));
    }

    try {
      final credentials = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      final user = credentials
          .user; // save the user object that has been returned by firebase while signing In in a variable called user.

      if (user == null) {
        return Left(ServerFailure('User doesn\'t exists after sign-up.'));
      }
      return Right(user);
    } on FirebaseAuthException catch (error) {
      return Left(ServerFailure.fromAuth(error));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error: ${e.toString()}'));
    }
  }
}
