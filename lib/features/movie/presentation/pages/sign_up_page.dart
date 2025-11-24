import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_palette.dart';
import 'package:movie_app/features/movie/presentation/pages/sign_in_page.dart';
import 'package:movie_app/features/movie/presentation/widgets/custom_bottom.dart';
import 'package:movie_app/features/movie/presentation/widgets/custom_text_filed.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey=GlobalKey<FormState>();

  @override
  void dispose() {
   nameController.dispose();
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
            "Register",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppPalette.gradient3,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 10),
              CustomTextFiled(hintText: 'Name'),
              SizedBox(height: 10),
              CustomTextFiled(hintText: 'Email'),
              SizedBox(height: 10),
              CustomTextFiled(hintText: 'Password'),
              SizedBox(height: 29),
              CustomBottom(btnText: "Create Account"),
              SizedBox(height: 29),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already Have Account ?   ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppPalette.gradient3,
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
