
import 'package:coffee_shop/config/routs_location/routs_location.dart';
import 'package:coffee_shop/data/models/coffee_model.dart';
import 'package:coffee_shop/screens/tab_box/screens/coffee_detail_screen.dart';
import 'package:coffee_shop/screens/tab_box/tab_box_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutsLocation.detail:
        return MaterialPageRoute(
            builder: (context) => CoffeeDetailScreen(coffee: settings.arguments as Coffee));
      case RoutsLocation.tabBox:
        return MaterialPageRoute(builder: (context) => const TabBoxScreen());
    }
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text("Route not found"),
        ),
      ),
    );
  }
}
