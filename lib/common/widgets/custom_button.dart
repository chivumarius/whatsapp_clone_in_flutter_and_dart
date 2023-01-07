import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/colors.dart';

class CustomButton extends StatelessWidget {
  // ♦ Property:
  final String text;

  // ♦ "VoidCallback" (Instead of the Old "Function()")
  final VoidCallback onPressed;

  // ♦ Constructor:
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  // ♦ The "build()" Method:
  @override
  Widget build(BuildContext context) {
    // ♦ Button:
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: tabColor,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: blackColor,
        ),
      ),
    );
  }
}
