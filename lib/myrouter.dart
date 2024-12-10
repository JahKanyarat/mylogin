import 'package:flutter/material.dart';
import 'package:login_app/Chat/ChatPage.dart';
import 'package:login_app/Model/UserMode.dart';
import 'package:login_app/pages/Profile/ProfilePage.dart';
import 'package:login_app/pages/Profile/Widgets/UpdateProfile.dart';
import 'package:login_app/pages/Profile/Widgets/UserInfo.dart';
import 'package:login_app/pages/contact.dart';
import 'package:login_app/pages/forgotpasswordPage.dart';
import 'package:login_app/pages/homePage.dart';
import 'package:login_app/pages/loginPage.dart';
import 'package:login_app/pages/profileP.dart';
import 'package:login_app/pages/registerPage.dart';
import 'package:login_app/pages/welcome.dart';
class Myrouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Loginpage.id:
        return MaterialPageRoute(builder: (_) => const Loginpage());
      case Registerpage.id:
        return MaterialPageRoute(builder: (_) => const Registerpage());
      case Forgotpasswordpage.id:
        return MaterialPageRoute(builder: (_) => const Forgotpasswordpage());
      case Homepage.id:
        return MaterialPageRoute(builder: (_) => Homepage());
      case Welcome.id:
        return MaterialPageRoute(builder: (_) => const Welcome());
      case Updateprofile.id:
        return MaterialPageRoute(builder: (_) => const Updateprofile());
      case Profilepage.id:
        return MaterialPageRoute(builder: (_) => const Profilepage());
      // case Chatpage.id:
      //    return MaterialPageRoute(builder: (_) => Chatpage());
      case Chatpage.id:
        // รับ arguments ที่ส่งมาจาก Contact Page
        final userModel = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => Chatpage(userModel: userModel),
        );
      case LoginUserInfo.id:
        return MaterialPageRoute(builder: (_) => const LoginUserInfo());
      case Profilep.id:
        return MaterialPageRoute(builder: (_) => const Profilep());
      case Contact.id:
        return MaterialPageRoute(builder: (_) => const Contact());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Page NOT found"),
            ),
          ),
        );
    }
  }
}
