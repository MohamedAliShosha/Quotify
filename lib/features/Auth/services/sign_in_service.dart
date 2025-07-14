import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:starter_template/core/functions/show_snack_bar.dart';

Future<UserCredential?> loginUser({required BuildContext context, required String? email, required String? password}) async {
    if (email == null) {
      showSnackBar(context, 'Empty Email');
    } else if (password == null) {
      showSnackBar(context, 'Empty Password');
    }

    // This function returns a UserCredentials opbject that holds email and password
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }