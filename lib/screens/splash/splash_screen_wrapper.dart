import 'package:flutter/material.dart';
import 'package:spotless_store/screens/splash/splash_screen.dart';
import 'package:spotless_store/screens/auth/auth_state_handler.dart';

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3)); // Splash screen delay
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AuthStateHandler(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
