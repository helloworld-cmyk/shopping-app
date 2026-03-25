import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

import 'bloc/bloc.dart';
import 'bloc/state.dart';
import 'router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) => previous.isAuth != current.isAuth,
        listener: (context, state) {
          if (state.isAuth) {
            _appRouter.replaceAll([const HomeRoute()]);
            return;
          }

          _appRouter.replaceAll([const SplashRoute()]);
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(),
          ),
        ),
      ),
    );
  }
}
