import 'package:flutter/material.dart';

class FlutterStarterTemplate extends StatelessWidget {
  const FlutterStarterTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }
}

void main() {
  runApp(const FlutterStarterTemplate());
}
