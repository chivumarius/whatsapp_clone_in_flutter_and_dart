import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/colors.dart';
import 'package:whatsapp_flutter/common/widgets/error.dart';
import 'package:whatsapp_flutter/common/widgets/loader.dart';
import 'package:whatsapp_flutter/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_flutter/features/landing/screens/landing_screen.dart';
import 'package:whatsapp_flutter/firebase_options.dart';
import 'package:whatsapp_flutter/router.dart';
import 'package:whatsapp_flutter/screens/mobile_layout_screen.dart';

void main() async {
  // ♦ Ensure Initialization of Flutter Widgets:
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // ♦ Initialize the "Web Application":
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyANXLFe0D4YMuKNt01qysaXV4SNDJBW2qA",
        authDomain: "whatsap-flutter-backend.firebaseapp.com",
        projectId: "whatsap-flutter-backend",
        storageBucket: "whatsap-flutter-backend.appspot.com",
        messagingSenderId: "177395710789",
        appId: "1:177395710789:web:610167951cc2556a861c2c"
      ),
    );
  } else {
    // ♦ Firebase Application Initialization:
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {

  // ♦ Constructor:
  const MyApp({Key? key}) : super(key: key);

  // ♦ The "build()" Method:
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          color: appBarColor,
        ),
      ),

      // ♦ "Named Routes":
      onGenerateRoute: (settings) => generateRoute(settings),

      home: ref.watch(userDataAuthProvider).when(
        data: (user) {
          // ♦ Checking:
          if (user == null) {
            return const LandingScreen();
          }
          return const MobileLayoutScreen();
        },
        error: (err, trace) {
          return ErrorScreen(
            error: err.toString(),
          );
        },
        loading: () => const Loader(),
      ),
    );
  }
}
