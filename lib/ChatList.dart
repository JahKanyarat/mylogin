import 'package:flutter/material.dart';
import 'package:login_app/Config/images.dart';
import 'package:login_app/Witget/ChatTile.dart';

class ChatList extends StatelessWidget {
  static const String id = '/chat'; // Add route name

  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/chatP");
          },
          child: const ChatTile(
            imageUrl: AssetsImage.girlPic, 
            name: "Ping", 
            lastChat: "I'm so sorry", 
            lastTime: "09:23",
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/chatP");
          },
          child: const ChatTile(
            imageUrl: AssetsImage.boyPic, 
            name: "Tiga", 
            lastChat: "I'm so sorry", 
            lastTime: "09:23",
          ),
        ),
      ],
    );
  }
}
