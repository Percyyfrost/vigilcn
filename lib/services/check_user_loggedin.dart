import 'package:flutter/material.dart';
import 'package:vigilcn/screens/home_screen.dart';
import 'package:vigilcn/screens/login_signup_screen.dart';
import 'package:vigilcn/services/auth.dart';

class UserCheck extends StatefulWidget {
  const UserCheck({super.key});

  @override
  State<UserCheck> createState() => _UserCheckState();
}

class _UserCheckState extends State<UserCheck> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginSignup();
          }
        });
  }
}
