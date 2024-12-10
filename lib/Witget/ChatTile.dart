import 'package:flutter/material.dart';
//import 'package:project_app3/Witget/ChatList.dart';
//import 'package:project_app3/Config/images.dart';

class ChatTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String lastChat;
  final String lastTime;
  const ChatTile({super.key, required this.imageUrl, required this.name, required this.lastChat, required this.lastTime});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 247, 210, 223)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // จัดตำแหน่งให้อยู่เริ่มต้น
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:AssetImage(imageUrl),
                radius: 30,
              ),
              // Image.asset(
              //   'assets/images/girl1_pic.webp',
              //   width: 70,
              // ),
              const SizedBox(width: 15), // ลดระยะห่างระหว่างรูปภาพและข้อความ
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 1), // เพิ่มช่องว่างเล็กน้อยระหว่างชื่อและข้อความ
                  Text(
                    lastChat,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const Spacer(), // ดันข้อความเวลาไปทางขวาสุด
              Text(
                lastTime,
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        );
  }
}