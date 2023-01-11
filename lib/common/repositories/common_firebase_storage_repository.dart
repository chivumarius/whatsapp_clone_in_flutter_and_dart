import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ♦ Using "flutter_riverpod" (Provider):
final commonFirebaseStorageRepositoryProvider = Provider(
  (ref) => CommonFirebaseStorageRepository(
    // ♦ Instantiation:
    firebaseStorage: FirebaseStorage.instance,
  ),
);

class CommonFirebaseStorageRepository {
  // ♦ Property:
  final FirebaseStorage firebaseStorage;

  // ♦ Constructor:
  CommonFirebaseStorageRepository({
    required this.firebaseStorage,
  });

  // ♦ The "storeFileToFirebase()" Function:
  Future<String> storeFileToFirebase(String ref, File file) async {
    // ♦ "Upload Task":
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snap = await uploadTask;

    // ♦ "Download Url":
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
