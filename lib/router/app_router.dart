import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'auth_routes.dart';
import '../screens/catagories/main.dart';
import '../screens/checkout/main.dart';
import '../screens/detailCatagories/main.dart';
import '../screens/home/main.dart';
import '../screens/login/main.dart';
import '../screens/onboard/main.dart';
import '../screens/product/main.dart';
import '../screens/register/main.dart';
import '../screens/cart/main.dart';
import '../screens/success/main.dart';
import '../screens/address/main.dart';
import '../screens/addaddress/main.dart';
import '../screens/addcard/main.dart';
import '../screens/card/main.dart';
import '../screens/splash/main.dart';
import '../screens/profile/main.dart';
import '../screens/notification/main.dart';
import '../screens/search/main.dart';
import 'user_routes.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [...authRoutes, ...userRoutes];
}
