import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_palette.dart';
import 'package:movie_app/features/movie/presentation/pages/sign_up_page.dart';
import 'package:movie_app/features/movie/presentation/widgets/custom_bottom.dart';
import 'package:movie_app/features/movie/presentation/widgets/custom_text_filed.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
 // final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey=GlobalKey<FormState>();


  @override
  void dispose() {
    // TODO: implement dispose
   // nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios, color: AppPalette.gradient3),
        title: Center(
          child: Text(
            "LogIn",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: AppPalette.gradient3,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 10),
              CustomTextFiled(hintText: 'Email'),
              SizedBox(height: 10),
              CustomTextFiled(hintText: 'Password'),
              SizedBox(height: 33),
              CustomBottom(btnText: "Sign In"),

              SizedBox(height: 29),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SignUpPage(), // replace with your widget
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don’t Have Account ?  ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'create One',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppPalette.gradient3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
