import 'package:flutter/material.dart';

import 'package:lagoon_app/Main/app_pallette.dart';

class ValidateButton extends StatelessWidget {

  final String text;
  final Function()? event;
  final IconData? icon;

  const ValidateButton({
    super.key,
    required this.text,
    required this.event,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: InkWell(
        onTap: event,
        borderRadius: BorderRadius.circular(15),
        focusColor: AppPallette.gradiant2,
        child: Ink(
          padding: const EdgeInsets.all(15),
          //margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: AppPallette.gradiant1,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
            child: Text(text,
              style: TextStyle(
                color: AppPallette.textColor1,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
