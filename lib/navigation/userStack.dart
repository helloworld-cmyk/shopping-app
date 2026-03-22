import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../bloc/state.dart';
import '../screens/home/main.dart';

class UserNavigator extends StatelessWidget {
  const UserNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (!state.isAuth) {
          return const SizedBox.shrink();
        }

        return Navigator(
          initialRoute: '/home',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/home':
                return MaterialPageRoute(builder: (_) => const HomeScreen());
              default:
                return MaterialPageRoute(builder: (_) => const HomeScreen());
            }
          },
        );
      },
    );
  }
}
