import 'package:flutter/material.dart';

RoundedRectangleBorder buildCircularRoundedRectangleBorder(
    {required double radius}) {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(radius),
  );
}
