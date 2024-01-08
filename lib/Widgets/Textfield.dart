import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  String labelText;
  String hintText;
  Widget? suffixText;
  TextEditingController controller;
  TextInputAction textInputAction;
  TextInputType keyboardType;
  FocusNode focusNode;
  void Function(String)? onFieldSubmitted;
  void Function(String?)? onSaved;
  bool obscureText;
  String? Function(String?)? validator;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String obscuringCharacter;

  Textfield(
      {super.key,
      required this.labelText,
      required this.hintText,
       this.suffixText,
      required this.controller,
      required this.textInputAction,
      required this.keyboardType,
      required this.focusNode,
      this.onFieldSubmitted,
      this.obscureText = false,
      required this.onSaved,
      required this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.obscuringCharacter = '*'});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: obscuringCharacter,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(style: BorderStyle.solid)),
        filled: true,
        fillColor: Colors.white,
        suffix: suffixText,
        // suffixStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        label: Text(
          labelText,
          textScaleFactor: 1.2,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        hintText: hintText,
      ),
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
