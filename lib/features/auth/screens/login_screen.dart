import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/colors.dart';
import 'package:whatsapp_flutter/common/widgets/custom_button.dart';


class LoginScreen extends StatefulWidget {
  // ♦ Constant:
  static const routeName = '/login-screen';

  // ♦ Constructor:
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // ♦ Controller:
  final phoneController = TextEditingController();

  // ♦ Variable:
  Country? country;

  // ♦ The "dispose()" Method:
  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  // ♦ The "pickCountry()" Method
  //   → in which we Use the "country_picker" Package:
  void pickCountry() {
    // ♦ Calling the Function:
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  // ♦ The "build()" Method:
  @override
  Widget build(BuildContext context) {
    // ♦ MediaQuery Variable:
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your phone number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // ♦ Screen Title:
              const Text('WhatsApp will need to verify your phone number.'),

              // ♦ Vertical "Spacing":
              const SizedBox(height: 10),

              // ♦ "Pick Country" Button:
              TextButton(
                onPressed: pickCountry,
                child: const Text('Pick Country'),
              ),

              // ♦ Vertical "Spacing":
              const SizedBox(height: 5),

              // ♦ "Phone Number":
              Row(
                children: [

                  // ♦ "Country Code":
                  if (country != null) Text('+${country!.phoneCode}'),


                  // ♦ Horizontal "Spacing":
                  const SizedBox(width: 10),

                  // ♦ "Phone Number":
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: 'phone number',
                      ),
                    ),
                  ),
                ],
              ),

              // ♦ Vertical "Spacing":
              SizedBox(height: size.height * 0.6),

              // ♦ "Next" Button:
              SizedBox(
                width: 90,
                child: CustomButton(
                  onPressed: (){},
                  text: 'NEXT',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
