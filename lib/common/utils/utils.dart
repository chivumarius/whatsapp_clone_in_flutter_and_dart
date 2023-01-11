import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ♦ The "showSnackBar()" Function:
void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

// ♦ The "pickImageFromGallery()" Function:
Future<File?> pickImageFromGallery(BuildContext context) async {
  // ♦ Variable:
  File? image;

  try {
    // ♦ "Picked Image" from "Gallery":
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    // ♦ Checking:
    if (pickedImage != null) {
      // ♦ Creating a "File" with the "Path" of the "File":
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context: context, content: e.toString());
  }
  return image;
}
