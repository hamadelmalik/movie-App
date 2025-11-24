import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_palette.dart';

class CustomBottom extends StatelessWidget {
  final String btnText;
  const CustomBottom({super.key,required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
          colors: [AppPalette.gradient1, AppPalette.borderColor],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: AppPalette.transparentColor,
          shadowColor: AppPalette.transparentColor,
        ),
        onPressed: () {},
        child: Text(
         btnText,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
