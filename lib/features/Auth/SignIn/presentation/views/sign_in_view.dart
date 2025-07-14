import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:starter_template/core/functions/show_snack_bar.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/widgets/custom_button.dart';
import 'package:starter_template/core/widgets/custom_email_and_password_text_form_field.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});


  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isLoading = false;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: ColorsManager.kPrimaryColor
      ),
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: ColorsManager.kBlackColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'Hello,',
                    style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 24, fontFamily: 'Lato'),
                  ),
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
                  labelText: 'Enter your password',
                  obscuredText: true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          // ignore: use_build_context_synchronously
                          // Navigator.pushNamed(context, HomeView.id,
                          //     arguments:
                          //         email); // Arguments are data passed to the next page
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
                          print(e);
                          showSnackBar(
                              context, 'there was an error: ${e.toString()}');
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    buttonTitle: 'Login',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don\'t have an account ? ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
