import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/core/widgets/app_text_form_field.dart';
import 'package:starter_template/core/widgets/app_button.dart';
import 'package:starter_template/core/widgets/password_text_field.dart';
import 'package:starter_template/features/auth/sign_up/models/sign_up_request_body.dart';
import 'package:starter_template/features/auth/sign_up/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:starter_template/features/auth/sign_up/presentation/widgets/sign_up_bloc_listener.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          AppTextFormField(
            keyboardType: TextInputType.name,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              if (data.length < 3) {
                return 'Username must be at least 3 characters';
              }
              return null;
            },
            controller: nameController,
            labelText: 'Enter your username',
            hintText: 'Username',
          ),
          const SizedBox(height: 20),
          AppTextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              if (!EmailValidator.validate(data)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            controller: emailController,
            labelText: 'Enter your email',
            hintText: 'Email',
          ),
          const SizedBox(height: 20),
          AppTextFormField(
            keyboardType: TextInputType.phone,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            controller: phoneController,
            labelText: 'Enter your phone number',
            hintText: 'Phone Number',
          ),
          const SizedBox(height: 20),
          PasswordTextField(
            passwordController: passwordController,
            hintText: 'Password',
            labelText: 'Enter your password',
          ),
          const SizedBox(height: 20),
          PasswordTextField(
            passwordController: passwordConfirmationController,
            hintText: 'Password Confirmation',
            labelText: 'Confirm your password',
          ),
          const SizedBox(height: 30),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return AppButton(
                isLoading: state is SignUpLoading,
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    await context.read<SignUpCubit>().signUp(
                          SignUpRequestBody(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            gender: 0,
                            password: passwordController.text,
                            confirmPassword:
                                passwordConfirmationController.text,
                          ),
                        );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                buttonTitle: 'Sign Up',
              );
            },
          ),
          const SizedBox(height: 20),
          const SignUpBlocListener(),
        ],
      ),
    );
  }
}
