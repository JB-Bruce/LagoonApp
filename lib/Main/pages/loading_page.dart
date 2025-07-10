import 'package:flutter/material.dart';
import 'package:lagoon_app/Main/app_pallette.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallette.backgroundColor,
      body: Center(
        child: CircularProgressIndicator(
          color: AppPallette.gradiant1,
        ),
      ),
    );
  }
}
