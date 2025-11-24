import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/theme.dart';
//import 'package:movie_app/features/auth/presentation/pages/sign_in_page.dart';
//import 'package:movie_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:movie_app/features/movie/presentation/splash/splash_screen.dart';
//import 'features/auth/presentation/pages/sign_in_page.dart';

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

      home:  SplashScreen(),
    );
  }
}

