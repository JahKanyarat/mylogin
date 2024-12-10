// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:login_app/Model/UserMode.dart';
// import 'package:login_app/services/handle_firebase_exception.dart';


// class Profilecontroller extends GetxController {
//   final auth = FirebaseAuth.instance;
//   final db = FirebaseFirestore.instance;
//   RxBool isLoading = false.obs;
//   Rx<UserModel> currentUser = UserModel().obs;

//   void onInit()async{
//     super.onInit();
//     await getUserDetails();
//   }

//   Future<void>getUserDetails() async{
//     await db
//     .collection("users")
//     .doc(auth.currentUser!.uid)
//     .get()
//     .then((value)=>
//       {
//       currentUser.value = UserModel.fromJson(value.data()!)
//       }
//     );
//   }

//   Future<void>ubdateProfile(
//     String imageURL,
//     String name,
//     String about,
//     String number
//   )async{
//     isLoading.value = true;
//      try {
//       var newUser = UserModel(
//           imagePath: imageURL,
//           name: name,
//           about: about,
//           id: FirebaseAuth.instance.currentUser!.uid); // ส่ง name ไปด้วย
//       // บันทึกข้อมูลใน Firestore
//       await FirebaseFirestore.instance
//           .collection("users")
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .set(newUser.toJson());
//     } catch (ex) {
//       print(ex); // พิมพ์ข้อผิดพลาด
//       //_status = AuthStatus.failed; // 
//     }
//   }
  
// }



import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/Model/UserMode.dart';


class Profilecontroller extends GetxController {
  Rx<UserModel> currentUser = UserModel().obs;

  Future<void> fetchCurrentUser() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (userDoc.exists) {
        currentUser.value = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }
}
