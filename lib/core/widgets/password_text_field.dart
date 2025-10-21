import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/widgets/app_text_form_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.labelText,
    required this.hintText,
  });

  final TextEditingController passwordController;

  final String labelText;
  final String hintText;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      isObscureText: obscureText,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(
                Icons.visibility_off,
                color: ColorsManager.kWhiteColor,
              )
            : const Icon(
                Icons.visibility,
                color: ColorsManager.kWhiteColor,
              ),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'This field is required';
        }
        if (data.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      controller: widget.passwordController,
      labelText: widget.labelText,
      hintText: widget.hintText,
    );
  }
}
