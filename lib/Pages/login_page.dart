import 'package:chat_app/Components/my_button.dart';
import 'package:chat_app/Components/my_text_field.dart';
import 'package:chat_app/Services/Auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  final void Function()? onTap;
  const Loginpage({super.key, required this.onTap});

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  //text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signIn() async {
//get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInwithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo
                Icon(
                  Icons.message,
                  size: 100,
                  color: Colors.grey[800],
                ),

                //welcome back page
                const SizedBox(height: 50),
                Text(
                  "Welcome back you have been missed",
                  style: TextStyle(),
                ),

                const SizedBox(height: 25),
                //email textfiled
                MyTextFiled(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),

                const SizedBox(height: 10),
                //pasword textfield
                MyTextFiled(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),

                //sign in button
                const SizedBox(height: 25),
                Mybutton(onTap: signIn, text: 'Sign In'),

                const SizedBox(height: 50),
                //not a member?register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member'),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register Now',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
