import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app/pages/homePage.dart';
import 'package:login_app/pages/loginPage.dart';

class Splacecontroller extends GetxController {
  final auth = FirebaseAuth.instance;

  void onInit() async {
    // Use onInit provided by GetxController
    super.onInit();
    await splaceHandle();
  }

  Future<void> splaceHandle() async {
    Future.delayed(
      const Duration(seconds: 3),
    );
    if(auth.currentUser==null)
    {
       Get.off(() => Loginpage());
    } else{
      Get.off(() => Homepage());
      print(auth.currentUser!.email);
    }
    print("hello");
  }
}
