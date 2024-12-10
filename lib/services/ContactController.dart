// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:login_app/Model/UserMode.dart';

// class Contactcontroller extends GetxController {
//   final db = FirebaseFirestore.instance;
//   final auth = FirebaseAuth.instance;
//   RxBool isLoading = false.obs;

//   RxList<UserModel> userList = <UserModel>[].obs;

//   void onInit() async {
//     super.onInit();
//     await getUserList();
//   }

//   Future<void> getUserList() async {
//     isLoading.value = true;
//     try {
//       userList.clear();
//       await db.collection("users").snapshots().listen((snapshot) {
//         userList.value =
//             snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
//         isLoading.value = false;
//       });
//       // await db.collection("users").get().then((value) => {
//       //       userList.value =
//       //           value.docs.map((e) => UserModel.fromJson(e.data())).toList(),
//       //     });
//     } catch (e) {}
//     isLoading.value = false;
//   }

//   // Future<void> getUserList() async {
//   //   isLoading.value = true;
//   //   try {
//   //     userList.clear();
//   //     final value = await db.collection("users").get();
//   //     userList.value =
//   //         value.docs.map((e) => UserModel.fromJson(e.data())).toList();
//   //   } catch (e) {
//   //     print("Error fetching user list: $e");
//   //   } finally {
//   //     isLoading.value = false;
//   //   }
//   // }

// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:login_app/Model/UserMode.dart';

// class ContactController extends GetxController {
//   final db = FirebaseFirestore.instance;
//   final auth = FirebaseAuth.instance;
//   RxBool isLoading = false.obs;

//   RxList<UserModel> userList = <UserModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     getUserList();
//   }

//   void getUserList() {
//     isLoading.value = true;
//     try {
//       // ตั้ง Listener แบบเรียลไทม์สำหรับ Firestore
//       db.collection("users").snapshots().listen((snapshot) {
//         userList.value =
//             snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
//         isLoading.value = false;
//       }, onError: (error) {
//         // จัดการข้อผิดพลาดขณะฟังข้อมูล
//         print("เกิดข้อผิดพลาดขณะอัปเดตรายชื่อผู้ใช้: $error");
//         isLoading.value = false;
//       });
//     } catch (e) {
//       print("เกิดข้อผิดพลาดระหว่างการดึงข้อมูล: $e");
//       isLoading.value = false;
//     }
//   }
// }
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app/Model/UserMode.dart';

class ContactController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;

  StreamSubscription? userListSubscription;

  @override
  void onInit() {
    super.onInit();
    getUserList();
  }

  @override
  void onClose() {
    userListSubscription?.cancel(); // ยกเลิก Listener เมื่อ Controller ถูกทำลาย
    super.onClose();
  }

  void getUserList() {
    isLoading.value = true;
    try {
      db
          .collection("users")
          .orderBy('createdAt', descending: true)
          .snapshots()
          .listen((snapshot) {
        userList.value =
            snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
        isLoading.value = false;
      }

      // db.collection("users").snapshots().listen((snapshot) {
      // userList.value = snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
      // isLoading.value = false;
      // }
      // db.collection("users").snapshots().listen((snapshot) {
      //   // อัปเดต userList ทุกครั้งที่มีการเปลี่ยนแปลง
      //   userList.value =
      //       snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
      //   isLoading.value = false;
      // }
      , onError: (error) {
        print("เกิดข้อผิดพลาดขณะอัปเดตรายชื่อผู้ใช้: $error");
        isLoading.value = false;
      });
    } catch (e) {
      print("เกิดข้อผิดพลาดระหว่างการดึงข้อมูล: $e");
      isLoading.value = false;
    }
  }


  // void getUserList() {
  //   isLoading.value = true;

  //   // ตรวจสอบว่า User ได้ล็อกอินแล้ว
  //   final currentUser = auth.currentUser;
  //   if (currentUser == null) {
  //     print("ผู้ใช้ไม่ได้ล็อกอิน");
  //     isLoading.value = false;
  //     return;
  //   }

  //   try {
  //     // ยกเลิก Listener ก่อนหน้าหากมี
  //     userListSubscription?.cancel();

  //     // สร้าง Listener ใหม่
  //     userListSubscription = db.collection("users").snapshots().listen(
  //       (snapshot) {
  //         userList.value =
  //             snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
  //         isLoading.value = false;
  //       },
  //       onError: (error) {
  //         // จัดการข้อผิดพลาด
  //         print("เกิดข้อผิดพลาดขณะอัปเดตรายชื่อผู้ใช้: $error");
  //         isLoading.value = false;
  //       },
  //     );
  //   } catch (e) {
  //     print("เกิดข้อผิดพลาดระหว่างการดึงข้อมูล: $e");
  //     isLoading.value = false;
  //   }
  // }
}

