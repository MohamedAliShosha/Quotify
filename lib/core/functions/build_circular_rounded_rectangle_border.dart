import 'package:flutter/material.dart';

RoundedRectangleBorder buildCircularRoundedRectangleBorder({required double raduis}) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(raduis),
      );
  }