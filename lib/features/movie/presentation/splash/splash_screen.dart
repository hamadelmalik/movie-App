import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/core/theme/app_palette.dart';
import 'package:movie_app/features/home/presentation/layout/layout_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    /// بعد 2 ثانية → افتح صفحة SignInPage
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement (
        context,
        MaterialPageRoute(builder: (_) => const LayoutView()),
      );
    });
  }

  static const colorizeColors = [
    AppPalette.gradient2,
    AppPalette.gradient3,
    AppPalette.transparentColor,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    color: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logoApp, width: 400, height: 400),

            SizedBox(
              width: 250,
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Movie App',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                    speed: const Duration(milliseconds: 700),
                  ),
                ],
                isRepeatingAnimation: true,
              ),
            ),

            const SizedBox(height: 10),

            Image.asset(AppAssets.route, width: 200, height: 200),
            const SizedBox(height: 10),

            const Text('Supervised by Hamad Elmalik',
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
