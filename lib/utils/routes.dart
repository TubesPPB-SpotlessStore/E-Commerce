import 'package:flutter/material.dart';
import 'package:spotless_store/screens/home_screen.dart';
import 'package:spotless_store/screens/login/login_screen.dart';
import 'package:spotless_store/screens/register/register_screen.dart';
<<<<<<< HEAD
import 'package:spotless_store/screens/products/detail_product_screen.dart';
=======
// import 'package:spotless_store/screens/login/login_screen.dart';
// import 'package:spotless_store/screens/register.dart';
import 'package:spotless_store/screens/login.dart';
import 'package:spotless_store/screens/register.dart';
import 'package:spotless_store/screens/splash.dart';
import 'package:spotless_store/screens/splash2.dart';
>>>>>>> 1e9f157d6b8487d452c0a1ba58af2f5f66e24374

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
    case rProductDetail:
      if (_args is Map<String, dynamic>) {
        _route = _pageRoute(
          body: ProductDetailScreen(
            imagePath: _args['imagePath'],
            title: _args['title'],
            price: _args['price'],
          ),
          settings: settings,
        );
      }
      break;
  }
  return _route;
}

final NAV_KEY = GlobalKey<NavigatorState>();
const String rLogin = '/login';
const String rRegister = '/register';
const String rHome = '/home';
<<<<<<< HEAD
const String rProductDetail = '/product-detail';
=======
const String rSplash = '/splash';
const String rSplash2 = '/splash2';
>>>>>>> 1e9f157d6b8487d452c0a1ba58af2f5f66e24374
