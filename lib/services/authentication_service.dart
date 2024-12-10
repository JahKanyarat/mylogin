import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:login_app/Model/UserMode.dart'; // อย่าลืมตรวจสอบการใช้งาน UserModel
import 'package:login_app/pages/loginPage.dart';
import 'package:login_app/services/handle_firebase_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_app/services/profileController.dart';

class AuthenticationService {
  static late AuthStatus _status;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  // ฟังก์ชันการสร้างบัญชีผู้ใช้ใหม่
  static Future<AuthStatus> createNewAccount(
      {required String email,
      required String password,
      required String name}) async {
    try {
      // สร้างผู้ใช้ใหม่ใน Firebase Auth โดยใช้ email ที่ผู้ใช้กรอก
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      _status = AuthStatus.successful;

      // เมื่อผู้ใช้ถูกสร้างแล้ว, เราจะเรียกฟังก์ชัน initUser เพื่อบันทึกข้อมูลผู้ใช้ใน Firestore
      await initUser(
          email, name
          ); // ส่ง email (username) และ name ไปยัง initUser
    } on FirebaseAuthException catch (e) {
      _status = HandleFirebaseException.HandleAuthException(e);
    }
    return _status;
  }

  // ฟังก์ชันการบันทึกข้อมูลผู้ใช้ใน Firestore
  static Future<AuthStatus> initUser(String email, String name) async {
    try {
      var newUser = UserModel(email: email, name: name,id: FirebaseAuth.instance.currentUser!.uid); // ส่ง name ไปด้วย
      // บันทึกข้อมูลใน Firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(newUser.toJson());

      _status = AuthStatus.successful;
    } catch (ex) {
      print(ex); // พิมพ์ข้อผิดพลาด
      //_status = AuthStatus.failed; // กำหนดสถานะล้มเหลว
    }
    return _status;
  }

  // ฟังก์ชันล็อกอินและฟังก์ชันอื่น ๆ ตามเดิม...
  static Future<AuthStatus> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Initialize Profilecontroller with the logged-in user's data
      Profilecontroller profilecontroller = Get.find<Profilecontroller>();
      await profilecontroller.fetchCurrentUser();

      _status = AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      _status = HandleFirebaseException.HandleAuthException(e);
    }
    return _status;
  }


  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(Loginpage.id);
    } catch (e) {
      print("Error during sign out: $e");
      Get.snackbar("Error", "Failed to sign out");
    }
    //await FirebaseAuth.instance.signOut();
    //Get.offAllNamed(Loginpage.id);
  }

  static Future<AuthStatus> loginWithUsername({
    required String username,
    required String password,
  }) async {
    try {
      // ค้นหา email จาก username ใน Firestore
      final QuerySnapshot userQuery = await FirebaseFirestore.instance
          .collection('users')
          .where('name', isEqualTo: username)
          .limit(1)
          .get();

      if (userQuery.docs.isEmpty) {
        return AuthStatus.userNotFouund; // ถ้าไม่พบ username
      }

      // ดึง email จาก Firestore
      final email = userQuery.docs.first.get('email');

      // ใช้ email และ password เพื่อเข้าสู่ระบบ
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      return HandleFirebaseException.HandleAuthException(e);
    } catch (e) {
      return AuthStatus.unknow;
    }
  }

  static Future<AuthStatus> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      _status = AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      _status = HandleFirebaseException.HandleAuthException(e);
    }
    return _status;
  }

  static Future<AuthStatus> resetPassword({required String Username}) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: Username)
        .then((value) => _status = AuthStatus.successful)
        .catchError((onError) =>
            _status = HandleFirebaseException.HandleAuthException(onError));
    return _status;
  }

  // static Future<AuthStatus>createNewUser({
  //   required String email,
  //   required String password,
  //   required String name})async{
  //   try {
  //     await AuthStatus
  //   } catch (e) {
      
  //   }
  // }
}

// // UserModel class with name field added
// class UserModel {
//   final String email;
//   final String name; // เพิ่มฟิลด์ name
//   final String profileImage;


//   UserModel({required this.email, required this.name,required this.profileImage});

//   // ฟังก์ชันแปลงข้อมูล UserModel เป็น Map
//   Map<String, dynamic> toJson() {
//     return {
//       'email': email,
//       'name': name, 
//       'profileImage':profileImage// เพิ่มชื่อผู้ใช้ลงไป
//     };
//   }

//   // ฟังก์ชันสำหรับแปลงข้อมูลจาก Firestore เป็น UserModel
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       email: json['email'] ?? '',
//       name: json['name'] ?? '', 
//       profileImage:json['profileImage']??''// เพิ่มการดึงชื่อจาก Firestore
//     );
//   }
// }


