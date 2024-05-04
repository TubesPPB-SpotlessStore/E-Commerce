import 'package:flutter/material.dart';
import 'package:spotless_store/screens/login.dart';
import 'package:spotless_store/screens/register.dart';
import 'package:spotless_store/screens/splash.dart';
import 'package:spotless_store/screens/splash2.dart';

MaterialPageRoute _pageRoute(
        {required Widget body, required RouteSettings settings}) =>
    MaterialPageRoute(builder: (_) => body, settings: settings);
Route? generateRoute(RouteSettings settings) {
  Route? _route;
  switch (settings.name) {
    case rSplash:
      _route = _pageRoute(body: SplashScreen(), settings: settings);
      break;
    case rSplash2:
      _route = _pageRoute(body: SplashScreen2(), settings: settings);
      break;
    case rLogin:
      _route = _pageRoute(body: LoginScreen(), settings: settings);
      break;
    case rRegister:
      _route = _pageRoute(body: RegisterScreen(), settings: settings);
      break;
  }
  return _route;
}

final NAV_KEY = GlobalKey<NavigatorState>();
const String rLogin = '/login';
const String rRegister = '/register';
const String rHome = '/home';
const String rSplash = '/splash';
const String rSplash2 = '/splash2';
