import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/firebase_options.dart';
import 'package:login_app/myrouter.dart';
import 'package:login_app/pages/Profile/ProfilePage.dart';
import 'package:login_app/pages/Profile/Widgets/UpdateProfile.dart';
import 'package:login_app/pages/SplacePage/SplacePage.dart';
import 'package:login_app/pages/homePage.dart';
import 'package:login_app/pages/loginPage.dart';
import 'package:login_app/pages/profileP.dart';
import 'package:login_app/pages/welcome.dart';
import 'package:login_app/services/profileController.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Get.put(Profilecontroller());
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();

  // เพิ่มการตั้งค่า Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // ตั้งค่า offline persistence (ถ้าต้องการปิด)
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: false);

  // กำหนด Controller
  Get.put(Profilecontroller());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static ButtonStyle btnSty = TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      fixedSize: const Size(100, 50));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
      initialRoute: Welcome.id,
      onGenerateRoute: Myrouter.generateRoute,
    );
  }

  static ButtonStyle btnStyPink = TextButton.styleFrom(
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    backgroundColor: const Color(0xFFF39DAA),
    fixedSize: const Size(195, 65),
    // textStyle: const TextStyle(fontSize: 30),
    textStyle: const TextStyle(
        fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.w500),
  );
}

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:login_app/firebase_options.dart';
// import 'package:login_app/myrouter.dart';
// import 'package:login_app/pages/loginPage.dart';
// import 'package:login_app/pages/welcome.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform);
//   } catch (e) {
//     debugPrint("Firebase initialization failed: $e");
//   }
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   static ButtonStyle btnSty = TextButton.styleFrom(
//     foregroundColor: Colors.white,
//     backgroundColor: Colors.black,
//     fixedSize: const Size(100, 50),
//   );

//   static ButtonStyle btnStyPink = TextButton.styleFrom(
//     foregroundColor: Colors.white,
//     padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//     backgroundColor: const Color(0xFFF39DAA),
//     fixedSize: const Size(195, 65),
//     textStyle: const TextStyle(
//         fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.w500),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: Welcome.id, // หรือ Loginpage.id
//       onGenerateRoute: Myrouter.generateRoute,
//     );
//   }
// }
