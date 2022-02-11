import 'package:barnivore/features/company/company_screen.dart';
import 'package:barnivore/features/home/home_screen.dart';
import 'package:barnivore/features/products/products_screen.dart';
import 'package:barnivore/features/search_flow/search/search_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(BuildContext context, RouteSettings settings /*, UserDao userDao*/) {
/*    if (!userDao.isLoggedIn()) {
      return MaterialPageRoute(builder: (_) => const AuthScreen());
    }*/
    final args = settings.arguments;
    debugPrint('args: $args');
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case SearchScreen.routeName:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case CompanyScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CompanyScreen());
      case ProductsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());
    }
  }
}
