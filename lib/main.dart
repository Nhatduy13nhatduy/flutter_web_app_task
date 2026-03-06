import 'package:flutter/material.dart';
import 'package:flutter_web_app_task/core/app_theme.dart';
import 'package:flutter_web_app_task/features/intro/intro_screen.dart';
import 'package:flutter_web_app_task/responsive_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guide App',
      theme: AppTheme.lightTheme,
      home: const ResponsiveWrapper(child: IntroScreen()),
    );
  }
}
