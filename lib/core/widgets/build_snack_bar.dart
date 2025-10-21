import 'package:flutter/material.dart';

SnackBar buildSnackBar({required String message}) {
  return SnackBar(
    duration: const Duration(milliseconds: 500),
    backgroundColor: Colors.black87,
    content: Center(
      child: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}
