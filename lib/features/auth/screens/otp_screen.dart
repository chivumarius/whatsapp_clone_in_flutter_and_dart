import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/colors.dart';
import 'package:whatsapp_flutter/features/auth/controller/auth_controller.dart';

class OTPScreen extends ConsumerWidget {

  // ♦ "Route Name":
  static const String routeName = '/otp-screen';

  // ♦ Variable:
  final String verificationId;

  // ♦ Constructor:
  const OTPScreen({Key? key, required this.verificationId}) : super(key: key);



  // ♦ The "verifyOTP()" Method:
  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    // ♦♦ Provider "ref" → makes "Provider" to "Interact" with a "Provider".
    // ♦♦ Widget "ref" → makes "Widget" to "Interact" with "Provider".
    ref.read(authControllerProvider).verifyOTP(
      context,
      verificationId,
      userOTP,
    );
  }

  // ♦ The "build()" Method:
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ♦ "Media Query":
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // ♦ "APP BAR":
      appBar: AppBar(
        title: const Text('Verifying your number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),

      // ♦ "BODY":
      body: Center(
        child: Column(
          children: [
            // ♦ Vertical Spacing
            const SizedBox(height: 20),

            // ♦ Title:
            const Text('We have sent an SMS with a code.'),

            // ♦ "Hint Text":
            SizedBox(
              // ♦ Using "Media Query":
              width: size.width * 0.5,

              // ♦ "Input Text Field"::
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: '- - - - - -',
                  hintStyle: TextStyle(
                    fontSize: 30,
                  ),
                ),

                // ♦ "Number Keyboard":
                keyboardType: TextInputType.number,

                // ♦ Functionality on Changed:
                onChanged: (val) {
                  // ♦ Checking:
                  if (val.length == 6) {
                    // ♦ Calling the Function:
                    verifyOTP(ref, context, val.trim());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
