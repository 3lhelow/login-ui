import 'package:flutter/material.dart';
import 'package:login_ui/components/my_button.dart';
import 'package:login_ui/components/my_text_field.dart';
import 'package:login_ui/components/square_tile.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),

                  // logo
                  Icon(Icons.lock, size: 100),

                  // welcome back
                  Text(
                    "Welcome back you've been missed!",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),

                  SizedBox(height: 25),

                  // text fields wrapped in a single Form
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // username text field
                        MyTextField(
                          controller: usernameController,
                          hintText: HintText.username,
                          obscureText: false,
                        ),

                        SizedBox(height: 25),

                        // password text field
                        MyTextField(
                          controller: passwordController,
                          hintText: HintText.password,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "forgot password?",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  // sign in button
                  MyButton(onTap: () => signIn()),

                  SizedBox(height: 25),

                  // or continue with
                  continueWith(),

                  SizedBox(height: 50),

                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                        imagePath: "images/Google_logo.svg.webp",
                        onPressed: signInWithGoogle,
                      ),

                      SizedBox(width: 25),

                      SquareTile(
                        imagePath: "images/Apple_logo_black.svg.webp",
                        onPressed: signInWithApple,
                      ),
                    ],
                  ),

                  SizedBox(height: 50),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),

                      SizedBox(width: 4),

                      Text(
                        "Register now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn() {
    if (formKey.currentState!.validate()) {
      debugPrint("username: ${usernameController.text}");
      debugPrint("password: ${passwordController.text}");
    }
  }

  void signInWithGoogle() {
    debugPrint("signInWithGoogle");
  }

  void signInWithApple() {
    debugPrint("signInWithApple");
  }

  Widget continueWith() {
    return Row(
      children: [
        Expanded(child: Divider(thickness: .5, color: Colors.grey[400])),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "Or Continue with",
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),

        Expanded(child: Divider(thickness: .5, color: Colors.grey[400])),
      ],
    );
  }
}
