import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vigilcn/services/auth.dart';

enum AuthState { login, signup, forgotPassword }

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup>
    with TickerProviderStateMixin {
  String? errorMessage = '';
  bool isLogin = true;
  AuthState _authState = AuthState.login;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await auth().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await auth().createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Lottie.asset(
            'lib/assets/vigilcn_animation_2.json', // Replace with the path to your Lottie animation file
            fit: BoxFit.cover,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'lib/assets/Vigilcn_logo_login.png',
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(
                    height: 73,
                  ),
                  _buildAuthFields(),
                  const SizedBox(height: 20),
                  _buildSwitchAuthText(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthFields() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: const Offset(1, 1),
                    color: Colors.grey.withOpacity(0.3))
              ]),
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
                hintText: "Email",
                prefixIcon:
                    const Icon(Icons.email, color: Colors.deepPurpleAccent),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Visibility(
          visible:
              _authState == AuthState.signup || _authState == AuthState.login,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.3))
                ]),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon:
                      const Icon(Icons.key, color: Colors.deepPurpleAccent),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Visibility(
          visible: _authState == AuthState.signup,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.3))
                ]),
            child: TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                  hintText: "Confirm Password",
                  prefixIcon:
                      const Icon(Icons.email, color: Colors.deepPurpleAccent),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity, // <-- match_parent
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 91, 47, 212),
                foregroundColor: Colors.white, // text color
                elevation: 5,
                visualDensity: VisualDensity.compact),
            onPressed: _getButtonLabel() == 'Login'
                ? signInWithEmailAndPassword
                : createUserWithEmailAndPassword,
            child: Text(_getButtonLabel()),
          ),
        ),
      ],
    );
  }

  Widget _buildSwitchAuthText() {
    String switchText;
    String switchTextTwo;
    String message;
    AuthState switchToState;
    AuthState switchToStateTwo;

    if (_authState == AuthState.login) {
      switchText = 'Sign Up';
      switchTextTwo = 'Forgot Password?';
      message = ', or did you ';
      switchToState = AuthState.signup;
      switchToStateTwo = AuthState.forgotPassword;
    } else if (_authState == AuthState.signup) {
      switchText = 'Login';
      switchTextTwo = 'Forgot Password?';
      message = ', or did you ';
      switchToState = AuthState.login;
      switchToStateTwo = AuthState.forgotPassword;
    } else {
      switchText = 'Login';
      switchTextTwo = 'SignUp';
      message = ', maybe you should ';
      switchToState = AuthState.login;
      switchToStateTwo = AuthState.signup;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _authState = switchToState;
            });
          },
          child: Text(
            switchText,
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _authState = switchToState;
            });
          },
          child: Text(
            message,
            style: const TextStyle(),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _authState = switchToStateTwo;
            });
          },
          child: Text(
            switchTextTwo,
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  String _getButtonLabel() {
    if (_authState == AuthState.login) {
      return 'Login';
    } else if (_authState == AuthState.signup) {
      return 'Sign Up';
    } else {
      return 'Reset Password';
    }
  }
}
