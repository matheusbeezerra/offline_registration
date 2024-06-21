import 'package:flutter/material.dart';

const kWhiteColor = Colors.white;
const kGreyColor = Colors.grey;
const kGreenColor = Color.fromARGB(255, 115, 160, 85);
const kPrimaryColor = Color.fromARGB(255, 235, 87, 7);
const kSecondaryColor = Color(0xffab8671);
const kTertiaryColor = Color(0xff1b1b1b);
const kTextFieldBorderColor = Color(0xff6e6e6e);
const kTextFieldBgColor = Color(0xff2e2e2e);



final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  // Adicione mais customizações aqui
);