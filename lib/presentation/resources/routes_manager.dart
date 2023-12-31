import 'package:flutter/material.dart';
import 'package:plants_shop_app/presentation/features/onboarding/view/onboarding_view.dart';
import 'package:plants_shop_app/presentation/features/searchProducts/search_products_view.dart';
import 'package:plants_shop_app/presentation/features/splash/splash_view.dart';
import 'package:plants_shop_app/presentation/features/viewProduct/viewproduct_view.dart';
import 'package:plants_shop_app/presentation/resources/strings_manager.dart';

class Routes {
  static const splashRoute = "/splashroute";
  static const onboarding = "/onboarding";
  static const searchProducts = "/searchProducts";
  static const viewProduct = "/viewProduct";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.searchProducts:
        return MaterialPageRoute(builder: (_) => SearchProductsView());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingView());

      case Routes.viewProduct:
        final arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => ViewProductView(
                  imageUrl: arg["image"],
                  price: arg["price"],
                  productname: arg["productname"],
                ));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
