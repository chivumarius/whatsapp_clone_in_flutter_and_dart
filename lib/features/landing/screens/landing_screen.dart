import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/colors.dart';
import 'package:whatsapp_flutter/common/widgets/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // ♦ Variable "MediaQuery":
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // ♦ Spacing:
            const SizedBox(height: 50),

            // ♦ Screen Title:
            const Text(
              'Welcome to WhatsApp',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),

            // ♦ Spacing:
            SizedBox(height: size.height / 9),

            // ♦ "Image":
            Image.asset(
              'assets/bg.png',
              height: 340,
              width: 340,
              color: tabColor,
            ),

            // ♦ Spacing:
            SizedBox(height: size.height / 9),

            // ♦ "Policy":
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                style: TextStyle(color: greyColor),
                textAlign: TextAlign.center,
              ),
            ),

            // ♦ Spacing:
            const SizedBox(height: 10),

            // ♦ "AGREE AND CONTINUE" Button:
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                text: 'AGREE AND CONTINUE',
                onPressed: () => {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
