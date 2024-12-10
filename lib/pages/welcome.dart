import 'package:flutter/material.dart';
import 'package:login_app/main.dart';
import 'package:login_app/pages/loginPage.dart';
import 'package:login_app/pages/registerPage.dart';

class Welcome extends StatelessWidget {
  static const String id = 'welcome_page'; // เพิ่ม id สำหรับ routing

  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF39DAA), Color(0xFF234294)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "WELCOME",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10), // เพิ่มช่องว่างระหว่างข้อความ
                const Text(
                  "Chat App",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 300), // ปรับระยะห่างให้เหมาะสม
                ElevatedButton(
                  style: MyApp.btnStyPink,
                  onPressed: () {
                    Navigator.pushNamed(
                        context, Loginpage.id); // เปลี่ยนเป็น id ถ้ากำหนด
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
                  ),
                ),
                const SizedBox(height: 20), // ปรับช่องว่างระหว่างปุ่ม
                ElevatedButton(
                  style: MyApp.btnStyPink,
                  onPressed: () {
                    Navigator.pushNamed(
                        context, Registerpage.id); // เปลี่ยนเป็น id ถ้ากำหนด
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
