import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {

  // ♦ "Route Name":
  static const String routeName = '/otp-screen';

  // ♦ Variable:
  final String verificationId;

  // ♦ Constructor:
  const OTPScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  // ♦ The "build()" Method:
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
