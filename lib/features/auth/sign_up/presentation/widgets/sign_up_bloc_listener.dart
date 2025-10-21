import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/core/widgets/build_snack_bar.dart';
import 'package:starter_template/features/auth/sign_up/presentation/manager/sign_up_cubit/sign_up_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(
              message: state.apiErrorModel.data != null &&
                      state.apiErrorModel.data!.entries.isNotEmpty
                  ? state.apiErrorModel.data!.entries.first.value.first
                  : 'An unknown error occurred.',
            ),
          );
        } else if (state is SignUpSuccess) {
          // go => Navigates to the new screen and remove the current screen from the stack better with go_router than pushReplacement as it keeps the state of the current screen if I exist the app and return back the last opened screen will be displayed
          // GoRouter.of(context).go(AppRouter.kHomeView);
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(message: state.signUpResponseModel.message),
          );
          GoRouter.of(context).go(AppRouter.kHomeView);
        }
      },
    );
  }
}
