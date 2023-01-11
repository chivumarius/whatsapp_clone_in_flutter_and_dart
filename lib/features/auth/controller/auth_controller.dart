import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/features/auth/repository/auth_repository.dart';

// ♦ "Riverpod" Library
//   → for Providing the "Instance" of the "Class":
final authControllerProvider = Provider((ref) {
  // ♦ "ref" → it Allows Us to "Interact" with "Other Providers":
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});


class AuthController {
  // ♦ Properties:
  final AuthRepository authRepository;

  // ♦ "ProviderRef":
  final ProviderRef ref;

  // ♦ Constructor:
  AuthController({
    required this.authRepository,
    required this.ref,
  });


  // ♦ The "signInWithPhone()" Function:
  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }

  // ♦ The "verifyOTP()" Function:
  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepository.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }

  // ♦ The "saveUserDataToFirebase()" Function:
  void saveUserDataToFirebase(
      BuildContext context, String name, File? profilePic) {
    authRepository.saveUserDataToFirebase(
      name: name,
      profilePic: profilePic,
      ref: ref,
      context: context,
    );
  }
}
