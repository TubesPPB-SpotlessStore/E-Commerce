import 'package:flutter/material.dart';
import 'package:spotless_store/screens/home_screen.dart';
import 'package:spotless_store/screens/login/login_screen.dart';
import 'package:spotless_store/screens/register/register_screen.dart';
import 'package:spotless_store/screens/products/detail_product_screen.dart';
import 'package:spotless_store/screens/splash/splash_screen.dart';
import 'package:spotless_store/screens/splash/splash2_screen.dart';
import 'package:spotless_store/screens/cart/cart_screen.dart';
import 'package:spotless_store/screens/payment/payment_screen.dart';

MaterialPageRoute _pageRoute(
        {required Widget body, required RouteSettings settings}) =>
    MaterialPageRoute(builder: (_) => body, settings: settings);
Route? generateRoute(RouteSettings settings) {
  Route? _route;
  final _args = settings.arguments;
  switch (settings.name) {
    case rLogin:
      _route = _pageRoute(body: LoginScreen(), settings: settings);
      break;
    case rRegister:
      _route = _pageRoute(body: RegisterScreen(), settings: settings);
      break;
    case rHome:
      _route = _pageRoute(body: HomeScreen(), settings: settings);
      break;
    case rSplash:
      _route = _pageRoute(body: SplashScreen(), settings: settings);
      break;
    case rSplash2:
      _route = _pageRoute(body: SplashScreen2(), settings: settings);
      break;
    case rCart:
      _route = _pageRoute(body: CartScreen(), settings: settings);
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
    case rPayment:
      _route = _pageRoute(body: PaymentPage(), settings: settings);
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
const String rCart = '/cart';
const String rProductDetail = '/product-detail';
const String rPayment = '/payment';
