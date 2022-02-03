import 'package:flutter/material.dart';







//Custom Text Field
class CustomAuthTextFormField extends StatelessWidget {
  const CustomAuthTextFormField(
      {Key? key,
        required this.hint,
        this.controller,
        this.obscureText = false,
        this.textInputAction = TextInputAction.done,
        this.suffixIcon,
        this.prefixIcon,
        this.maxlin=0,
        required this.labeltext,
        this.fillColor = Colors.white,
      })
      : super(key: key);
  final int maxlin;
  final String hint;
  final String labeltext;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      obscureText: obscureText,
      validator: (_) {
        if (_!.isEmpty && _.length <3) return "Please fill properly";
      },
      textInputAction: textInputAction,

      style: const TextStyle(fontSize: 16,color: Colors.black,),

      decoration:  InputDecoration(
        labelText: labeltext,
        prefixIcon: prefixIcon,
        hintText: hint,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
       // filled: true,
        border: const UnderlineInputBorder(),

      ),
    );
  }
}

class CustomMaxTextFormField extends StatelessWidget {
  const CustomMaxTextFormField(
      {Key? key,
        required this.hint,
        this.controller,
        this.obscureText = false,
        this.textInputAction = TextInputAction.done,
        this.suffixIcon,
        this.prefixIcon,
        required this.labeltext,
        this.fillColor = Colors.white,
      })
      : super(key: key);
  final String hint;
  final TextEditingController? controller;
  final bool obscureText;
  final String labeltext;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
maxLines: 3,
      controller: controller,
      obscureText: obscureText,

      validator: (_) {
        if (_!.isEmpty && _.length <3) return "Please fill properly";
      },
      textInputAction: textInputAction,

      style: const TextStyle(fontSize: 18,color: Colors.black),

      decoration:  InputDecoration(
        labelText: labeltext,
        prefixIcon: prefixIcon,
        hintText: hint,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
       // filled: true,
        border: UnderlineInputBorder(),

      ),
    );
  }
}