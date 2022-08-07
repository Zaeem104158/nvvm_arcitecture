import 'package:flutter/material.dart';
import 'package:practice_mvvm/utilits/routes/routes_name.dart';
import 'package:practice_mvvm/view/home_screen.dart';
import 'package:practice_mvvm/view/login/login_view.dart';
import 'package:practice_mvvm/view/register/signUp_view.dart';
import 'package:practice_mvvm/view/splash/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("No route is defined")),
          );
        });
    }
  }
}
