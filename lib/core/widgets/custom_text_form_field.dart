

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  const CustomTextFormField(
      {super.key,
        required this.hintText,
        this.suffixIcon,
        this.keyboardType,
        this.obscureText = false,
        this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      cursorColor: Color(0xffBFA054),
      decoration: InputDecoration(
        hintStyle:
        TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Color(0xff8391A1))
        ,
        hintText: hintText,
        filled: true,
        fillColor: Color(0xffF7F8F9),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xffE8ECF4))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xffBFA054))),
      ),
    );
  }
}
