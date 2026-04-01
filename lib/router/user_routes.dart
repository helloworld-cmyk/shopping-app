import 'package:auto_route/auto_route.dart';
import 'app_router.dart';

final List<AutoRoute> userRoutes = [
  AutoRoute(page: HomeRoute.page, path: '/home'),
  AutoRoute(page: CategoriesRoute.page, path: '/categories'),
  AutoRoute(page: DetailCatagoriesRoute.page, path: '/detail-catagories'),
  AutoRoute(page: ProductRoute.page, path: '/product'),
  AutoRoute(page: SuccessRoute.page, path: '/success'),
  AutoRoute(page: CheckoutRoute.page, path: '/checkout'),
  AutoRoute(page: CartRoute.page, path: '/cart'),
  AutoRoute(page: AddressRoute.page, path: '/address'),
  AutoRoute(page: AddAddressRoute.page, path: '/add-address'),
  AutoRoute(page: CardRoute.page, path: '/card'),
  AutoRoute(page: AddCardRoute.page, path: '/add-card'),
  AutoRoute(page: ProfileRoute.page, path: '/profile'),
  AutoRoute(page: NotificationRoute.page, path: '/notification'),
  AutoRoute(page: SearchRoute.page, path: '/search'),
];
