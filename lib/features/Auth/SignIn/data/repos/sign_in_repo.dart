import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:starter_template/core/errors/failures.dart';

abstract class SignInRepo 
{
  /*
    Since we are already using Either to represent success or failure,
    if we reach the Right side, we must be confident that there is a valid User.
    so I used "User" not "User?" here => Either<Failures,User>
    Returning Right(null) would mean "the operation succeeded but there's no user,"
    which doesn't make sense.
  */
  Future<Either<Failures,User>> signIn({required String email , required String password});
}