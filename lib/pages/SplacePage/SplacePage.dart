import 'package:flutter/material.dart';
import 'package:login_app/services/SplaceController.dart';
import 'package:get/get.dart';

class Splacepage extends StatelessWidget {
  const Splacepage({super.key});

  @override
  Widget build(BuildContext context) {
    Splacecontroller splacecontroller = Get.put(Splacecontroller());
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.chat, // Use the desired icon
          size: 100.0, // Adjust the size of the icon
          color: Colors.blue, // Customize the color
        ),
      ),
    );
  }
}
