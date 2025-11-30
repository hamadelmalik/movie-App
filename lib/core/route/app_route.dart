import 'package:flutter/material.dart';
import 'package:movie_app/core/route/page_route_name.dart';
import 'package:movie_app/features/home/presentation/layout/layout_view.dart';
import 'package:movie_app/features/home/presentation/pages/home_view.dart';
import 'package:movie_app/features/movie/presentation/splash/splash_screen.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(builder: (context) => const SplashScreen(),settings: setting);
      case PageRouteName.homeView:
        return MaterialPageRoute(builder: (context) =>  HomeView(),settings: setting);

      case PageRouteName.layoutView:
        return MaterialPageRoute(builder: (context) => const LayoutView(),settings: setting);


      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
