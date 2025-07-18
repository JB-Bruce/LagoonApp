import 'package:flutter/material.dart';

import 'package:lagoon_app/Main/app_pallette.dart';

class ValidateButton extends StatelessWidget {

  final String text;
  final Function()? event;
  final IconData? icon;
  final double additivePadding;

  const ValidateButton({
    super.key,
    required this.text,
    required this.event,
    this.icon,
    this.additivePadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (25 + additivePadding)),
      child: InkWell(
        onTap: event,
        borderRadius: BorderRadius.circular(15),
        focusColor: appColor.gradiant2,
        child: Ink(
          padding: const EdgeInsets.all(15),
          //margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: appColor.gradiant1,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
            child: Stack(
              children: [
                if(icon != null) Row(children: [Icon(icon!),],),

                Center(
                  child: Text(text,
                    style: TextStyle(
                      color: appColor.textColor1,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
