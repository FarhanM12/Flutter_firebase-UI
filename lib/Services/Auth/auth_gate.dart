import 'package:chat_app/Pages/home_page.dart';
import 'package:chat_app/Services/Auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Authgate extends StatelessWidget {
  const Authgate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return Homepage();
          }
          //user is not loggged in
          else {
            return LoginOrRegsiter();
          }
        },
      ),
    );
  }
}