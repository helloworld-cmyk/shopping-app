import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

import 'bloc/addressBloc/bloc.dart';
import 'bloc/authBloc/bloc.dart';
import 'bloc/authBloc/state.dart';
import 'bloc/cardBloc/bloc.dart';
import 'bloc/cartBloc/bloc.dart';
import 'bloc/myorderBloc/bloc.dart';
import 'bloc/profileBloc/bloc.dart';
import 'bloc/wishlistBloc/bloc.dart';
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
        BlocProvider<AddressBloc>(create: (_) => AddressBloc()),
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
        BlocProvider<CardBloc>(create: (_) => CardBloc()),
        BlocProvider<CartBloc>(create: (_) => CartBloc()),
        BlocProvider<MyOrderBloc>(create: (_) => MyOrderBloc()),
        BlocProvider<ProfileBloc>(create: (_) => ProfileBloc()),
        BlocProvider<WishlistBloc>(create: (_) => WishlistBloc()),
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
