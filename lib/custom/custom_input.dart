import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomScaffold extends StatelessWidget {
  Widget child;

  CustomScaffold({super.key, required this.child});

  Future<void> _precacheImage(BuildContext context) async {
    await precacheImage(const AssetImage('assets/images/blue.jpg'), context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _precacheImage(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/blue.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: customContainer(context),
                )
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget customContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100),
          topRight: Radius.circular(100),
        ),
      ),
      child: child,
    );
  }
}
