import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spotless_store/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context,
            rSplash2); // Navigasi ke halaman splash2 setelah beberapa detik
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.png',
          width: 500,
          height: 500,
        ),
      ),
    );
  }
}
