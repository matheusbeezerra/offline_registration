import 'package:app_offline/custom/constants.dart';
import 'package:app_offline/custom/custom_button.dart';
import 'package:app_offline/custom/custom_input.dart';
import 'package:app_offline/custom/custom_text_field.dart';
import 'package:app_offline/ui/pages/database_offline_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    void signUserIn(BuildContext context) {
      String password = passwordController.text.trim();
      String email = emailController.text.trim();
      if (email == 'admin' && password == '123qwe') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OfflineDados()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    "Credenciais Incorretas",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            backgroundColor: Color.fromARGB(255, 238, 34, 19),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }

    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            const SizedBox(height: 40),
            const Text(
              "E-mail",
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(55, 79, 92, 1),
                  fontWeight: FontWeight.bold),
            ),
            CustomTextField(
              controller: emailController,
              hintText: "Type your e-mail",
              obscureText: false,
              suffix: CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.mail,
                    color: Color.fromRGBO(55, 79, 92, 1),
                  )),
            ),
            const SizedBox(height: 20),
            const Text(
              "Password",
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(55, 79, 92, 1),
                  fontWeight: FontWeight.bold),
            ),
            CustomTextField(
                controller: passwordController,
                hintText: "Type your password",
                obscureText: obscureText,
                suffix: CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: obscureText
                        ? const Icon(
                            Icons.key,
                            color: Color.fromRGBO(55, 79, 92, 1),
                          )
                        : const Icon(
                            Icons.key,
                            color: kWhiteColor,
                          ))),
            const SizedBox(height: 30),
            Center(
              child: CustomButton(
                onTap: () => signUserIn(context),
                title: 'To connect',
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
