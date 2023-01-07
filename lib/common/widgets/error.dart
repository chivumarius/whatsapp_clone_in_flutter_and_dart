import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  // ♦ Property:
  final String error;

  // ♦ Constructor:
  const ErrorScreen({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
