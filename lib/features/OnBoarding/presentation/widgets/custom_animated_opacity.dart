import 'package:flutter/material.dart';

class CustomAnimatedOpacity extends StatelessWidget {
  const CustomAnimatedOpacity(
      {super.key,
      required this.isVisible,
      required this.durationInSeconds,
      required this.child});

  final bool isVisible;
  final Widget child;
  final int durationInSeconds;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: Duration(
        seconds: durationInSeconds,
      ),
      child: child, // GestureDetector for the last one
    );
  }
}
