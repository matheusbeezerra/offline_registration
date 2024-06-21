import 'package:app_offline/custom/constants.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String title;
  void Function()? onTap;

  CustomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: onTap,
    child: Container(
      height:55, 
      width:double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(55, 79, 92, 1),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Center(
        child: Text(title, style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: kWhiteColor,
        ),),
      ),
    ),
    );
  }
}
