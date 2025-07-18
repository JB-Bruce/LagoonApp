import 'package:flutter/material.dart';
import 'package:lagoon_app/Main/app_pallette.dart' show appColor;

class SettingsSubpageButton extends StatelessWidget {

  final String text;
  final Function()? event;
  final IconData? icon;
  final double additivePadding;

  const SettingsSubpageButton({
    super.key,
    required this.text,
    required this.event,
    this.icon,
    this.additivePadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (10 + additivePadding)),
      child: InkWell(
        onTap: event,
        borderRadius: BorderRadius.circular(15),
        focusColor: appColor.backgroundColor,
        splashColor: appColor.borderColor4,
        child: Ink(
          padding: const EdgeInsets.all(15),
          //margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: event != null ?  appColor.borderColor5 : appColor.backgroundColor,
              borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                style: TextStyle(
                  color: appColor.textColor1,
                  fontWeight: event != null ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 15,
                ),
              ),

              if(icon != null) Row(children: [Icon(icon!, color: appColor.textColor1,),],),
            ],
          ),
        ),
      ),
    );
  }
}
