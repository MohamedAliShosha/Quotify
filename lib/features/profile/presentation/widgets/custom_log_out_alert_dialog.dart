import 'package:flutter/material.dart';

class CustomLogOutAlertDialog extends StatelessWidget {
  const CustomLogOutAlertDialog({
    super.key,
    required this.titleText,
    required this.contentText,
    required this.cancelButtonText,
    required this.logoutButtonText,
    required this.dialogBackgroundColor,
    required this.titleTextColor,
    required this.contentTextColor,
    required this.cancelButtonColor,
    required this.logoutButtonColor,
  });

  final String titleText;
  final String contentText;
  final String cancelButtonText;
  final String logoutButtonText;
  final Color dialogBackgroundColor;
  final Color titleTextColor;
  final Color contentTextColor;
  final Color cancelButtonColor;
  final Color logoutButtonColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: dialogBackgroundColor,
      title: Text(
        titleText,
        style: TextStyle(
          color: titleTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        contentText,
        style: TextStyle(
          color: contentTextColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
          // return false if dialog is dismissed
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            cancelButtonText,
            style: TextStyle(
              color: cancelButtonColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          // return true if user clicks "Logout"
          onPressed: () => Navigator.pop(context, true),
          child: Text(
            logoutButtonText,
            style: TextStyle(
              color: logoutButtonColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
