import 'package:finance_app/screens/home/home_screen.dart';
import 'package:finance_app/screens/splash/splash_screen.dart';
import 'package:finance_app/theme/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.fromSeed(seedColor: blueColor),
        primaryColor: blueColor,
        useMaterial3: true,
        fontFamily: 'Dana',
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Dana',
              displayColor: textColor,
            ),
      ),
      home: const SplashScreen(),
    );
  }
}
