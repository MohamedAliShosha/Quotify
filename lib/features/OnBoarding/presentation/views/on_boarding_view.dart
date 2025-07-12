// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/core/widgets/custom_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  bool _isVisible = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.kPrimaryColor,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            CustomAnimatedOpacity(
              isVisible: _isVisible,
              durationInSeconds: 2,
              child: Image.asset(
                'assets/images/quote.png',
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            CustomAnimatedOpacity(
              isVisible: _isVisible,
              durationInSeconds: 2,
              child: const Text(
                'Get',
                style: TextStyle(
                  height: .5,
                  fontSize: 50,
                ),
              ),
            ),
            CustomAnimatedOpacity(
              isVisible: _isVisible,
              durationInSeconds: 3,
              child: const Text(
                'Inspired',
                style: TextStyle(
                  fontSize: 50, // responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            const SizedBox(
              width: double.infinity,
            ),
            CustomAnimatedOpacity(
              isVisible: _isVisible,
              durationInSeconds: 3,
              child: const CustomButton(),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAnimatedOpacity extends StatelessWidget {
  const CustomAnimatedOpacity(
      {super.key,
      required this.isVisible,
      required this.durationInSeconds,
      required this.child});

  final bool isVisible;
  final Widget? child;
  final int? durationInSeconds;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: Duration(
        seconds: durationInSeconds ?? 0,
      ),
      child: child, // GestureDetector for the last one
    );
  }
}
