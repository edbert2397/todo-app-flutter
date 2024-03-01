import 'package:flutter/material.dart';
import 'package:todoapp/screen/home_screen.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeScreen(),
    );
  }
}