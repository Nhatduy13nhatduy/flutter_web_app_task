import 'package:flutter/material.dart';
import 'package:flutter_web_app_task/features/home/screen/home_screen.dart';
import 'package:flutter_web_app_task/features/intro/intro_screen.dart';
import 'package:flutter_web_app_task/features/intro/intro_screen_2.dart';

class AppRouter {
  static const String intro = '/';
  static const String intro2 = '/intro2';
  static const String home = '/home';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case intro:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const IntroScreen(),
        );
      case intro2:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const IntroScreen2(),
        );
      case home:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const _UnknownRouteScreen(),
        );
    }
  }
}

class _UnknownRouteScreen extends StatelessWidget {
  const _UnknownRouteScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Route not found')));
  }
}
