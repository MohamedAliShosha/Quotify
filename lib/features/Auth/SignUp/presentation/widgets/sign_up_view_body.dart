import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/widgets/custom_button.dart';
import 'package:starter_template/core/widgets/custom_email_and_password_text_form_field.dart';
import 'package:starter_template/features/Auth/SignIn/presentation/widgets/custom_header_text.dart';
import 'package:starter_template/features/Auth/SignIn/presentation/widgets/custom_redirect_button.dart';
import 'package:starter_template/features/Auth/SignIn/presentation/widgets/custom_redirect_text.dart';

// ignore: must_be_immutable
class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  String? email;

  String? password;

  bool isLoading = false;

  bool isPasswordVisible =
      false; // A default value that makes the password Invisible

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: ColorsManager.kPrimaryColor,
        backgroundColor: ColorsManager.kBlackColor,
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
                      if (formKey.currentState!.validate()) {}
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
