import 'package:flutter/material.dart';
import 'package:lagoon_app/Main/app_pallette.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.backgroundColor,
      body: Center(
        child: CircularProgressIndicator(
          color: appColor.gradiant1,
        ),
      ),
    );
  }
}
