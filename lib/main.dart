import 'package:flutter/material.dart';
import 'package:vigilcn/firebase_options.dart';
import 'package:vigilcn/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VigilCn.',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const SplashScreen(),
    );
  }
}
