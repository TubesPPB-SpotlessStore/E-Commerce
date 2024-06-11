import 'package:flutter/material.dart';
import 'package:spotless_store/screens/home_screen.dart';
import 'package:spotless_store/screens/login/login_screen.dart';
import 'package:spotless_store/screens/register/register_screen.dart';
import 'package:spotless_store/screens/splash/splash_screen.dart';
import 'package:spotless_store/screens/splash/splash2_screen.dart';

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
    case rHome:
      _route = _pageRoute(body: HomeScreen(), settings: settings);
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
