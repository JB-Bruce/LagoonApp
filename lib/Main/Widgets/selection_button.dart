import 'package:flutter/material.dart';
import 'package:lagoon_app/Main/app_pallette.dart';

class SelectionButton extends StatefulWidget {
  final String label;
  final bool elevated;
  final IconData icon;
  final Function() event;

  const SelectionButton({
    super.key,
    required this.label,
    required this.elevated,
    required this.icon,
    required this.event,
  });

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.event,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: appColor.backgroundColor2,
          borderRadius: BorderRadius.circular(30),
          boxShadow: widget.elevated
              ? [
            BoxShadow(
              color: appColor.shadowColor1,
              offset: Offset(1, 5),
              blurRadius: 2,
            ),
          ]
              : [
            BoxShadow(
              color: appColor.shadowColor1,
              offset: Offset(0.3, 1),
              blurRadius: 1,
            ),
          ],
        ),
        child: Icon(
          widget.icon,
          color: !widget.elevated
              ? appColor.gradiant1
              : appColor.borderColor4,
        ),
      ),
    );
  }
}