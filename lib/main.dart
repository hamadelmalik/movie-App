import 'package:flutter/material.dart';
import 'package:movie_app/core/route/app_route.dart';
import 'package:movie_app/core/route/page_route_name.dart';
import 'package:movie_app/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: AppTheme.darkThemeMode,

      initialRoute: PageRouteName.layoutView,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
