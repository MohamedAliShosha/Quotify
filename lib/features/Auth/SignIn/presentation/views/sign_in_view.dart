import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:starter_template/core/functions/show_snack_bar.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/widgets/custom_button.dart';
import 'package:starter_template/core/widgets/custom_email_and_password_text_form_field.dart';
import 'package:starter_template/features/Auth/SignIn/presentation/widgets/custom_header_text.dart';
import 'package:starter_template/features/Auth/SignIn/presentation/widgets/custom_redirect_button.dart';
import 'package:starter_template/features/Auth/SignIn/presentation/widgets/custom_redirect_text.dart';
import 'package:starter_template/features/Auth/services/sign_in_service.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isLoading = false; // This is a default value
  bool isPasswordVisible = false;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator:
          const CircularProgressIndicator(color: ColorsManager.kPrimaryColor),
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
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomEmailAndPasswordTextFormField(
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
                        !isPasswordVisible, // changing the value of the obsecureText to true
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
                        isLoading =
                            true; // Shows a loading indicator while processing the login request.
                        setState(() {});
                        try {
                          await AuthServices.signIn(
                              context: context,
                              email: email,
                              password: password);
                          GoRouter.of(context).push(AppRouter.kHomeView);
                          // ignore: use_build_context_synchronously
                        } on FirebaseAuthException catch (e) {
                          // ScaffoldMessenger => used to display a message that express the registeration result fail or success
                          if (e.code == 'user-not-found') {
                            showSnackBar(
                                // ignore: use_build_context_synchronously
                                context,
                                'No user found for that email.');
                          } else if (e.code == '-wrong-password') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context,
                                'wrong password provided for that user.');
                          }
                        } catch (e) {
                          showSnackBar(
                              context, 'there was an error: ${e.toString()}');
                        }
                        isLoading =
                            false; // Hides the loading indicator after the login attempt completes (whether successful or not).
                        setState(() {});
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
  }
}
