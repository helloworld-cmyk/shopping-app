// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [OnboardScreen]
class OnboardRoute extends PageRouteInfo<void> {
  const OnboardRoute({List<PageRouteInfo>? children})
    : super(OnboardRoute.name, initialChildren: children);

  static const String name = 'OnboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardScreen();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    Key? key,
    VoidCallback? onBack,
    VoidCallback? onSignedUp,
    List<PageRouteInfo>? children,
  }) : super(
         RegisterRoute.name,
         args: RegisterRouteArgs(
           key: key,
           onBack: onBack,
           onSignedUp: onSignedUp,
         ),
         initialChildren: children,
       );

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>(
        orElse: () => const RegisterRouteArgs(),
      );
      return RegisterScreen(
        key: args.key,
        onBack: args.onBack,
        onSignedUp: args.onSignedUp,
      );
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, this.onBack, this.onSignedUp});

  final Key? key;

  final VoidCallback? onBack;

  final VoidCallback? onSignedUp;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, onBack: $onBack, onSignedUp: $onSignedUp}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RegisterRouteArgs) return false;
    return key == other.key &&
        onBack == other.onBack &&
        onSignedUp == other.onSignedUp;
  }

  @override
  int get hashCode => key.hashCode ^ onBack.hashCode ^ onSignedUp.hashCode;
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}
