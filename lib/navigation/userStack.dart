import '../screens/home/main.dart';
import 'package:flutter/material.dart';
class UserNavigator extends StatelessWidget {
  const UserNavigator({super.key});
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case'/home':
            return MaterialPageRoute(
              builder: (_) => const HomeScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => const HomeScreen(),
            );
        }
      },
    );
  }
}