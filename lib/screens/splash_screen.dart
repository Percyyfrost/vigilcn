import 'package:flutter/material.dart';
import 'package:vigilcn/screens/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:vigilcn/screens/login_signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (6)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lottie Animation
          Lottie.asset(
            'lib/assets/vigilcn_animation.json',
            controller: _controller,
            height: MediaQuery.of(context).size.height * 0.8,
            animate: true,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward().whenComplete(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginSignup()),
                  );
                });
            },
          ), // Text Widget
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'VigilCn.',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent),
            ),
          ),
        ],
      ),
    );
  }
}
