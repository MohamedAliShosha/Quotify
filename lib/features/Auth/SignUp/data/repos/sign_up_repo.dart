import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:starter_template/core/errors/failures.dart';

abstract class SignUpRepo {
  Future<Either<Failures, User>> signUp(
      {required String email,
      required String password,
      required String userName});
}
