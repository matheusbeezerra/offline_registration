import 'package:app_offline/custom/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget suffix;
  final bool obscureText; 
  final TextEditingController controller; 

  const CustomTextField({
    super.key, 
    required this.hintText, 
    required this.suffix, 
    required this.obscureText, 
    required this.controller, 
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, 
      obscureText: obscureText,
      style: const TextStyle(color: kGreyColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kGreyColor,
        ),
        fillColor: kWhiteColor,
        filled: true,
        suffixIcon: suffix,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: kTextFieldBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
    );
  }
}
