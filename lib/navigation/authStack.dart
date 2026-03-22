import 'package:flutter/material.dart';

import '../screens/splash/main.dart';
import '../screens/onboard/main.dart';
import '../screens/register/main.dart';
import '../screens/login/main.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/onboard':
            return MaterialPageRoute(
              builder: (_) => const OnboardScreen(),
            );
          case '/splash':
            return MaterialPageRoute(
              builder: (_) => const SplashScreen(),
            );
          case '/login':
            return MaterialPageRoute(
              builder: (_) => const LoginScreen(),
            );

          case '/register':
            return MaterialPageRoute(
              builder: (_) => const RegisterScreen(),
            );

          default:
            return MaterialPageRoute(
              builder: (_) => const OnboardScreen(),
            );
        }
      },
    );
  }
}
