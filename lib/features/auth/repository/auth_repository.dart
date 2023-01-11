import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/utils/utils.dart';
import 'package:whatsapp_flutter/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_flutter/features/auth/screens/user_information_screen.dart';


// ♦ "Riverpod" Library
//   → for Providing the "Instance" of the "Class":
final authRepositoryProvider = Provider(
      (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  // ♦ Properties:
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  // ♦ Constructor:
  AuthRepository({
    required this.auth,
    required this.firestore,
  });


  // The "signInWithPhone()" Function:
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,

        // ♦ "Sign In With Credential":
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },

        // ♦ Redirect to the "OTP Screen":
        codeSent: ((String verificationId, int? resendToken) async {
          Navigator.pushNamed(
            context,
            OTPScreen.routeName,
            arguments: verificationId,
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  // The "verifyOTP()" Function:
  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      // ♦ "Sign in" by "Phone Auth Credential":
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );

      // ♦ "sign In With Credential":
      await auth.signInWithCredential(credential);


      // ♦ Redirection to "User Information Screen":
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserInformationScreen.routeName,
            (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }
}
