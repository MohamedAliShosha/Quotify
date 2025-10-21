import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/core/widgets/app_text_form_field.dart';
import 'package:starter_template/core/widgets/app_button.dart';
import 'package:starter_template/core/widgets/password_text_field.dart';
import 'package:starter_template/features/auth/login/data/models/login_request_body.dart';
import 'package:starter_template/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:starter_template/features/auth/login/presentation/widgets/login_bloc_listener.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordVisible = false; // hide the password
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              if (!EmailValidator.validate(data)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            labelText: 'Enter your email',
            hintText: 'Email',
          ),
          const SizedBox(height: 20),
          PasswordTextField(
            passwordController: passwordController,
            hintText: 'Password',
            labelText: 'Enter your password',
          ),
          const SizedBox(height: 100),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return AppButton(
                isLoading: state is LoginLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                          LoginRequestBody(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  }
                },
                buttonTitle: 'Sign In',
              );
            },
          ),
          const SizedBox(height: 10),
          const LoginBlocListener(),
        ],
      ),
    );
  }
}
