import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/widgets/error.dart';
import 'package:whatsapp_flutter/features/auth/screens/login_screen.dart';

// ♦ The "generateRoute()" Function:
Route<dynamic> generateRoute(RouteSettings settings) {

  // ♦ Cases:
  switch (settings.name) {

    // (1)  "LoginScreen" Case:
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );

    // (2)  "Error Screen" Default Case:
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist'),
        ),
      );
  }
}
