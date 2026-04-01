import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

import 'bloc/authBloc/bloc.dart';
import 'bloc/authBloc/state.dart';
import 'bloc/cartBloc/bloc.dart';
import 'router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
        BlocProvider<CartBloc>(create: (_) => CartBloc()),
      ],
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
