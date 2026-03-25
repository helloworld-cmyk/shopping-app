import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'auth_routes.dart';
import '../screens/home/main.dart';
import '../screens/login/main.dart';
import '../screens/onboard/main.dart';
import '../screens/register/main.dart';
import '../screens/splash/main.dart';
import 'user_routes.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
	@override
	List<AutoRoute> get routes => [
				...authRoutes,
				...userRoutes,
			];
}
