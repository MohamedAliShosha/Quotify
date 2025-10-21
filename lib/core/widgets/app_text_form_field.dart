import 'package:flutter/material.dart';
import 'package:starter_template/core/functions/build_enabled_border.dart';
import 'package:starter_template/core/functions/build_focused_border.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatefulWidget {
  const AppTextFormField(
      {super.key,
      this.validator,
      required this.hintText,
      this.isObscureText = false,
      this.keyboardType = TextInputType.text, // default value
      required this.labelText,
      required this.controller,
      this.suffixIcon});

  final String hintText;
  final bool isObscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String labelText;

  final Widget? suffixIcon;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  // changing fields are written at State object part.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        onTapOutside: (event) {
          // make the text field inactive when user taps outside
          FocusScope.of(context).unfocus();
        },
        controller: widget.controller,
        style: const TextStyle(
          color: ColorsManager.kWhiteColor,
        ),
        cursorColor: ColorsManager.kWhiteColor,
        obscureText: widget.isObscureText,
        // Text form field contains validator that used to validate inputs
        validator: widget.validator,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          labelText: widget.labelText,
          labelStyle:
              const TextStyle(fontSize: 16, color: ColorsManager.kGreyColor),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: ColorsManager.kBlackColor,
          ),
          enabledBorder: buildEnabledBorder(color: ColorsManager.kPrimaryColor),
          focusedBorder: buildFocusedBorder(color: ColorsManager.kPrimaryColor),
        ),
      ),
    );
  }
}
