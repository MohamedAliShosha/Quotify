import 'package:flutter/material.dart';
import 'package:starter_template/core/functions/build_enabled_border.dart';
import 'package:starter_template/core/functions/build_focused_border.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

// ignore: must_be_immutable
class CustomEmailAndPasswordTextFormField extends StatelessWidget {
  CustomEmailAndPasswordTextFormField(
      {super.key,
      this.onChanged,
      this.onSaved,
      this.hintText,
      this.obscuredText = false,
      required this.labelText,
      this.controller,
      this.suffixIcon});

  final String labelText;
  Function(String)? onChanged;
  String? hintText;
  bool? obscuredText; // I gave  it a default value of false
  final Widget? suffixIcon;
  void Function(String?)? onSaved;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        style: const TextStyle(
          color: ColorsManager.kWhiteColor,
        ),
        cursorColor: ColorsManager.kWhiteColor,
        obscureText: obscuredText!,
        // Text form field contains validator that used to validate inputs
        validator: (data) {
          if (data!.isEmpty) {
            return 'this field is required';
          } else {
            return null;
          }
        },
        onChanged: onChanged,
        onSaved: onSaved,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle:
              const TextStyle(fontSize: 16, color: ColorsManager.kGreyColor),
          hintText: hintText,
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
