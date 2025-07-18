import 'package:flutter/material.dart';
import 'package:lagoon_app/Main/app_pallette.dart';

class InputFieldAccountWidget extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final bool editable;
  final IconData? icon;

  final void Function(String) changedFunc;

  const InputFieldAccountWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    this.editable = true,
    this.icon,
    this.changedFunc = emptyFunc,
  });

  static void emptyFunc(String) {}

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: editable,
      onChanged: changedFunc,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColor.borderColor2, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: appColor.borderColor, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColor.gradiant1, width: 3.0),
          borderRadius: BorderRadius.circular(20),
        ),
        hintStyle: TextStyle(
          color: editable ? appColor.textColor3 : appColor.textColor3,
        ),
        labelStyle: TextStyle(
          color: appColor.textColor2,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        label: Text(title),
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: editable ? Icon(Icons.edit_outlined) : null,
        prefixIcon: icon != null ? Icon(icon) : null,
        prefixIconColor: appColor.textColor3,

      ),
      style: TextStyle(color: appColor.textColor3),
    );
  }
}
