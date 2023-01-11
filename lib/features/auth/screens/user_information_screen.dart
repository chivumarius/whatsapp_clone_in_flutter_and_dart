import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/utils/utils.dart';
import 'package:whatsapp_flutter/features/auth/controller/auth_controller.dart';


class UserInformationScreen extends ConsumerStatefulWidget {
  // ♦ "Route Name":
  static const String routeName = '/user-information';

  // ♦ Constructor:
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  // ♦ Controller
  final TextEditingController nameController = TextEditingController();

  // ♦ Variable:
  File? image;

  // ♦ The "dispose()" Method → for "nameController":
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }


  // ♦ The "selectImage()" Method:
  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  // ♦ The "storeUserData()" Method:
  void storeUserData() async {
    // ♦ Variable:
    String name = nameController.text.trim();

    // ♦ Checking:
    if (name.isNotEmpty) {
      // ♦ "Save User Data To Firebase":
      ref.read(authControllerProvider).saveUserDataToFirebase(
        context,
        name,
        image,
      );
    }
  }


  // ♦ The "build()" Method:
  @override
  Widget build(BuildContext context) {

    // ♦ "Media Query" Property:
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

              // ♦ Rounded Profile Image with a "Selection Image Icon"
              Stack(
                children: [
                  // ♦ If the "User" → "Has Not" yet "Selected" the "Image":
                  image == null
                      ?
                        // ♦ Circular Avatar:
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                          ),
                          radius: 64,
                        )
                      :
                        // ♦ Circular Avatar:
                        CircleAvatar(
                            backgroundImage: FileImage(
                              image!,
                            ),
                          radius: 64,
                        ),

                  // ♦ "Add a Photo" Icon Button:
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),

              // ♦
              Row(
                children: [

                  // ♦ "Hint Text":
                  Container(
                    // ♦ Using "Media Query":
                    width: size.width * 0.85,
                    padding: const EdgeInsets.all(20),

                    // ♦ "Input Text Field"
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                      ),
                    ),
                  ),

                  // ♦ "Done" Icon Button:
                  IconButton(
                    onPressed: storeUserData,
                    icon: const Icon(
                      Icons.done,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
