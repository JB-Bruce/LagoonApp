import 'package:flutter/material.dart';

import 'package:lagoon_app/Main/app_pallette.dart';

class InputField extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: AppPallette.borderColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(15)
          ),
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(
                color: AppPallette.gradiant1,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(20)
          ),
          hintText: hintText,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
