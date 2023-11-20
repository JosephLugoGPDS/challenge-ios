import 'package:challenge/features/auth/presentation/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String homeScreen = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      splashScreen: (BuildContext context) => const SplashScreen(),
    };
  }
}