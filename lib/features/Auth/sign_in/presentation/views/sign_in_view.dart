import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/features/auth/sign_in/data/repos/sign_in_repo_implement.dart';
import 'package:starter_template/features/auth/sign_in/presentation/manager/Sign_In_cubit/sign_in_cubit.dart';
import 'package:starter_template/features/auth/sign_in/presentation/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // to avoid the keyboard from overlapping the text fields
      // Move the bloc provider from here to the SignInView that exists in AppRouter for better arch
      body: BlocProvider(
        create: (context) => SignInCubit(
          SignInRepoImplement(),
        ),
        child: const SignInViewBody(),
      ),
    );
  }
}
