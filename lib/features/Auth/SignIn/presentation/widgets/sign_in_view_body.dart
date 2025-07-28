import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:starter_template/core/functions/show_snack_bar.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/widgets/custom_button.dart';
import 'package:starter_template/core/widgets/custom_email_and_password_text_form_field.dart';
import 'package:starter_template/features/auth/SignIn/presentation/manager/Sign_In_cubit/sign_in_cubit.dart';
import 'package:starter_template/features/auth/SignIn/presentation/widgets/custom_header_text.dart';
import 'package:starter_template/features/auth/SignIn/presentation/widgets/custom_redirect_button.dart';
import 'package:starter_template/features/auth/SignIn/presentation/widgets/custom_redirect_text.dart';
import 'package:starter_template/features/profile/presentation/manager/user_data/user_data_cubit.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  bool isLoading = false; // This is a default value
  bool isPasswordVisible = false;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  // dispose role is to free the memory of the controller when the widget is disposed
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  void clearFields() {
    _emailController.clear();
    _passwordController.clear();
    _userNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // Suggested question => Is it true to use the bloc consumer here or not? yes it is true
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) async {
        setState(() {
          isLoading = state
              is SignInLoading; // If the state is SignInLoading => isLoading will be true else it will be false.
        });

        if (state is SignInSuccess) {
          await context.read<UserDataCubit>().getUser(
              // userName: state.user.displayName ?? 'No User Name Available',
              // email: state.user.email ?? 'No Email Available',
              );
          showSnackBar(context, message: 'Sign In Successfully!');
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is SignInFailure) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
              backgroundColor: ColorsManager.kBlackColor,
              color: ColorsManager.kPrimaryColor),
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      const CustomHeaderText(
                        text: 'Hello,',
                      ),
                      const CustomHeaderText(
                        text: 'Welcome Back!',
                        fontSize: 24,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomEmailAndPasswordTextFormField(
                        labelText: 'Enter your email',
                        controller: _emailController,
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomEmailAndPasswordTextFormField(
                        controller: _passwordController,
                        suffixIcon: IconButton(
                          color: ColorsManager.kPrimaryColor,
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: isPasswordVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        labelText: 'Enter your password',
                        obscuredText:
                            !isPasswordVisible, // changing the value of the obscureText to true
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      CustomButton(
                        onTap: () async {
                          // Checks if all form fields (email and password) pass their validation rules.
                          if (formKey.currentState!.validate()) {
                            await BlocProvider.of<SignInCubit>(context)
                                .signIn(email: email!, password: password!);
                            clearFields();
                          }
                        },
                        buttonTitle: 'Sign In',
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomRedirectText(
                            redirectText: 'don\'t have an account? ',
                          ),
                          CustomRedirectButton(
                            onTap: () {
                              GoRouter.of(context).push(AppRouter.kSignUpView);
                            },
                            redirectText: 'Sign Up',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
