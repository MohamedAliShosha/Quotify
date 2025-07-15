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

// ignore: must_be_immutable
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email;

  String? password;

  bool isLoading = false;

  bool isPasswordVisible =
      false; // A default value that makes the password unvisible

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: ColorsManager.kPrimaryColor,
      ),
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key:
                formKey, // Is a key for the Form widget enable me to access whatever inside the Form widgwt
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
                    text: 'Welcome to Quote!',
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
                      onPressed: () {
                        setState(() {
                          // if the isPasswordVisible was "false" it will be "true" and vice versa
                          isPasswordVisible = !isPasswordVisible; 
                        });
                      },
                      // Check if the isPasswordVisible is true display Icons.visibility else display Icons.visibility_off
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: ColorsManager.kPrimaryColor,
                      ),
                    ),
                    labelText: 'Enter your password',
                    obscuredText:
                        !isPasswordVisible, // If the isPasswordVisible is true it will be false and the password is hidden 
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
                          await AuthServices.signUpUser(
                              context: context,
                              email: email,
                              password: password);
                          GoRouter.of(context).push(AppRouter.kHomeView);
                          // ignore: use_build_context_synchronously
                        } on FirebaseAuthException catch (e) {
                          // ScaffoldMessenger => used to display a message that express the registeration result fail or success
                          if (e.code == 'weak-password') {
                            showSnackBar(
                                // ignore: use_build_context_synchronously
                                context,
                                'Weak password');
                          } else if (e.code == 'email-already-in-use') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context, 'email already in use.');
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
                    buttonTitle: 'Sign Up',
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomRedirectText(
                        redirectText: 'Already have an account? ',
                      ),
                      CustomRedirectButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        redirectText: 'Sign In',
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
