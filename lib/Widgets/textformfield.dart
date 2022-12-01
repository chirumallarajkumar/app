import 'package:flutter/material.dart';
import 'package:hilo_bloc/Packages/CommonAssets/Colors.dart';
import '../Packages/CommonAssets/TextStyle.dart';

class textformfield extends StatelessWidget {
  final TextEditingController controller;
  final String HintText;
  final Icon prefixicon;
  final IconButton suffixicon;
  final double radius;
  TextInputType textInputType;
  final int maxlength;
  bool obscuretext;

  textformfield(
      {required this.HintText,
      required this.prefixicon,
      required this.suffixicon,
      required this.radius,
      required this.controller,
      required this.textInputType,
      required this.maxlength,
      required this.obscuretext
      
     });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext,
      maxLength: maxlength,
      controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
            counterText: "",
          hintText: HintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color.primary, width: 2),
            borderRadius: BorderRadius.circular(radius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color.Outline, width: 2),
            borderRadius: BorderRadius.circular(radius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.5),
            borderRadius: BorderRadius.circular(radius),
          ),
          hintStyle: Text_Style.SecondaryNormal,
          prefixIcon: prefixicon,
          suffixIcon: suffixicon,
          contentPadding: EdgeInsets.symmetric(horizontal: 5),
        ));
  }
}
