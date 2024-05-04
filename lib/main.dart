import 'package:flutter/material.dart';
import 'package:spotless_store/screens/splash.dart';
import 'package:spotless_store/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Spotless Store",
      debugShowCheckedModeBanner: false,
      navigatorKey: NAV_KEY,
      onGenerateRoute: generateRoute,
      home: SplashScreen(), // Menampilkan splash pertama kali
    );
  }
}
