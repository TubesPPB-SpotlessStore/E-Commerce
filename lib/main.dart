import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotless_store/bloc/login/login_cubit.dart';
//import 'package:spotless_store/bloc/login/login_cubit.dart';
// import 'package:spotless_store/screens/splash/splash_screen.dart';
import 'package:spotless_store/screens/splash.dart';
import 'package:spotless_store/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        // BlocProvider(create: (context) => RegisterCubit())
      ],
      child: MaterialApp(
        title: "Spotless Store",
        debugShowCheckedModeBanner: false,
        navigatorKey: NAV_KEY,
        onGenerateRoute: generateRoute,
        home: SplashScreen(),
      ),
    );
  }
}

class RegisterCubit {}
