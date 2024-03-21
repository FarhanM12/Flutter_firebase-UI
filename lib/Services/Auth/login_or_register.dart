import 'package:chat_app/Pages/login_page.dart';
import 'package:chat_app/Pages/regsiter_page.dart';
import 'package:flutter/material.dart';
class LoginOrRegsiter extends StatefulWidget {
  LoginOrRegsiter({Key? key}) : super(key: key);

  @override
  _LoginOrReisterState createState() => _LoginOrReisterState();
}

class _LoginOrReisterState extends State<LoginOrRegsiter> {
  //initially show the login page
  bool showLoginPage=true;

  //toggle betweeen login and register page 
  void togglePages()
  {
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
  if(showLoginPage)
  {
    return Loginpage(onTap: togglePages);
  }
  else{
    return RegisterPage(onTap: togglePages);
  }
  
    
  }
}