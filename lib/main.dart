import 'package:flutter/material.dart';
//import 'package:spotless_store/bloc/login/login_cubit.dart';
import 'package:spotless_store/screens/splash/splash_screen.dart';
import 'package:spotless_store/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Praktikum 6",
      debugShowCheckedModeBanner: false,
      navigatorKey: NAV_KEY,
      onGenerateRoute: generateRoute,
      home: SplashScreen(),
    );
  }
}
