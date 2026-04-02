// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddAddressScreen]
class AddAddressRoute extends PageRouteInfo<void> {
  const AddAddressRoute({List<PageRouteInfo>? children})
    : super(AddAddressRoute.name, initialChildren: children);

  static const String name = 'AddAddressRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddAddressScreen();
    },
  );
}

/// generated route for
/// [AddCardScreen]
class AddCardRoute extends PageRouteInfo<void> {
  const AddCardRoute({List<PageRouteInfo>? children})
    : super(AddCardRoute.name, initialChildren: children);

  static const String name = 'AddCardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddCardScreen();
    },
  );
}

/// generated route for
/// [AddressScreen]
class AddressRoute extends PageRouteInfo<void> {
  const AddressRoute({List<PageRouteInfo>? children})
    : super(AddressRoute.name, initialChildren: children);

  static const String name = 'AddressRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddressScreen();
    },
  );
}

/// generated route for
/// [CardScreen]
class CardRoute extends PageRouteInfo<void> {
  const CardRoute({List<PageRouteInfo>? children})
    : super(CardRoute.name, initialChildren: children);

  static const String name = 'CardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CardScreen();
    },
  );
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CartScreen();
    },
  );
}

/// generated route for
/// [CategoriesScreen]
class CategoriesRoute extends PageRouteInfo<void> {
  const CategoriesRoute({List<PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CategoriesScreen();
    },
  );
}

/// generated route for
/// [ChangeProfileScreen]
class ChangeProfileRoute extends PageRouteInfo<void> {
  const ChangeProfileRoute({List<PageRouteInfo>? children})
    : super(ChangeProfileRoute.name, initialChildren: children);

  static const String name = 'ChangeProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangeProfileScreen();
    },
  );
}

/// generated route for
/// [CheckoutScreen]
class CheckoutRoute extends PageRouteInfo<void> {
  const CheckoutRoute({List<PageRouteInfo>? children})
    : super(CheckoutRoute.name, initialChildren: children);

  static const String name = 'CheckoutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CheckoutScreen();
    },
  );
}

/// generated route for
/// [DetailCatagoriesScreen]
class DetailCatagoriesRoute extends PageRouteInfo<DetailCatagoriesRouteArgs> {
  DetailCatagoriesRoute({
    Key? key,
    required String categoryTitle,
    List<PageRouteInfo>? children,
  }) : super(
         DetailCatagoriesRoute.name,
         args: DetailCatagoriesRouteArgs(
           key: key,
           categoryTitle: categoryTitle,
         ),
         initialChildren: children,
       );

  static const String name = 'DetailCatagoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailCatagoriesRouteArgs>();
      return DetailCatagoriesScreen(
        key: args.key,
        categoryTitle: args.categoryTitle,
      );
    },
  );
}

class DetailCatagoriesRouteArgs {
  const DetailCatagoriesRouteArgs({this.key, required this.categoryTitle});

  final Key? key;

  final String categoryTitle;

  @override
  String toString() {
    return 'DetailCatagoriesRouteArgs{key: $key, categoryTitle: $categoryTitle}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailCatagoriesRouteArgs) return false;
    return key == other.key && categoryTitle == other.categoryTitle;
  }

  @override
  int get hashCode => key.hashCode ^ categoryTitle.hashCode;
}

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
/// [MyOrderScreen]
class MyOrderRoute extends PageRouteInfo<void> {
  const MyOrderRoute({List<PageRouteInfo>? children})
    : super(MyOrderRoute.name, initialChildren: children);

  static const String name = 'MyOrderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyOrderScreen();
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
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationScreen();
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
/// [ProductScreen]
class ProductRoute extends PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    Key? key,
    String? image,
    String? title,
    double? price,
    List<PageRouteInfo>? children,
  }) : super(
         ProductRoute.name,
         args: ProductRouteArgs(
           key: key,
           image: image,
           title: title,
           price: price,
         ),
         initialChildren: children,
       );

  static const String name = 'ProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteArgs>(
        orElse: () => const ProductRouteArgs(),
      );
      return ProductScreen(
        key: args.key,
        image: args.image,
        title: args.title,
        price: args.price,
      );
    },
  );
}

class ProductRouteArgs {
  const ProductRouteArgs({this.key, this.image, this.title, this.price});

  final Key? key;

  final String? image;

  final String? title;

  final double? price;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, image: $image, title: $title, price: $price}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductRouteArgs) return false;
    return key == other.key &&
        image == other.image &&
        title == other.title &&
        price == other.price;
  }

  @override
  int get hashCode =>
      key.hashCode ^ image.hashCode ^ title.hashCode ^ price.hashCode;
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
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
/// [SearchFilterScreen]
class SearchFilterRoute extends PageRouteInfo<void> {
  const SearchFilterRoute({List<PageRouteInfo>? children})
    : super(SearchFilterRoute.name, initialChildren: children);

  static const String name = 'SearchFilterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchFilterScreen();
    },
  );
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchScreen();
    },
  );
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

/// generated route for
/// [SuccessScreen]
class SuccessRoute extends PageRouteInfo<void> {
  const SuccessRoute({List<PageRouteInfo>? children})
    : super(SuccessRoute.name, initialChildren: children);

  static const String name = 'SuccessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SuccessScreen();
    },
  );
}

/// generated route for
/// [WishlistScreen]
class WishlistRoute extends PageRouteInfo<void> {
  const WishlistRoute({List<PageRouteInfo>? children})
    : super(WishlistRoute.name, initialChildren: children);

  static const String name = 'WishlistRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WishlistScreen();
    },
  );
}
