import 'package:flutter/material.dart';
class CustomTextFiled extends StatelessWidget {
  final String hintText;
  const CustomTextFiled({super.key,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,

      ),
    );
  }
}
