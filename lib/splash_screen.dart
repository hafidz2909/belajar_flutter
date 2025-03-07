import 'package:first/first.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class layarSplash extends StatefulWidget {
  const layarSplash({super.key});

  @override
  State<layarSplash> createState() => _layarSplashState();
}

class _layarSplashState extends State<layarSplash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FirstClass()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 123, 214),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'Assets/image/logo.apis.png',
              // width: 150,
              // height: 150,
              // fit: BoxFit.cover,
            ),
            Text(
              'Wellcome to My App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
