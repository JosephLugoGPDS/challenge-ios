import 'package:challenge/features/auth/presentation/view/login_screen.dart';
import 'package:challenge/features/auth/presentation/view/splash_screen.dart';
import 'package:challenge/features/home/presentation/view/home_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String homeScreen = '/home';
  static const String loginScreen = '/login';

  static Map<String, WidgetBuilder> get routes {
    return {
      splashScreen: (BuildContext context) => const SplashScreen(),
      homeScreen: (BuildContext context) => const HomeScreen(),
      loginScreen: (BuildContext context) => const LoginScreen(),
    };
  }
}
