// ignore_for_file: constant_identifier_names
import 'package:flutter_e_commers/Logic/bindings/auth_biniding.dart';
import 'package:flutter_e_commers/Logic/bindings/main_binding.dart';
import 'package:flutter_e_commers/Logic/bindings/product_binding.dart';
import 'package:flutter_e_commers/view/Screens/auth/forgot_password_screen.dart';
import 'package:flutter_e_commers/view/Screens/auth/login_screen.dart';
import 'package:flutter_e_commers/view/Screens/auth/signup_screen.dart';
import 'package:flutter_e_commers/view/Screens/cart_screen.dart';
import 'package:flutter_e_commers/view/Screens/main_screen.dart';
import 'package:flutter_e_commers/view/Screens/welcome_screen.dart';
import 'package:get/get.dart';

class Approutes {
  //initialRoute
  static const welcome = Routes.WelcomeScreen;
  static const mainscreen = Routes.MainScreen;

  //get Pages

  static final routes = [
    GetPage(
      name: Routes.WelcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.LoginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SignupScreen,
      page: () => SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.ForgetpasswordScreen,
      page: () => ForgetpasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MainScreen,
      page: () => MainScreen(),
      bindings: [AuthBinding(), MainBininding(), ProductBinding()],
    ),
    GetPage(
      name: Routes.cardScreen,
      page: () =>  CardScreen(),
      bindings: [AuthBinding(), ProductBinding()],
    ),
  ];
}

class Routes {
  static const WelcomeScreen = "/WelcomeScreen";
  static const LoginScreen = "/LoginScreen";
  static const SignupScreen = "/SignupScreen";
  static const ForgetpasswordScreen = "/ForgetpasswordScreen";
  static const MainScreen = '/MainScreen';
  static const cardScreen = '/CardScreen';
}
