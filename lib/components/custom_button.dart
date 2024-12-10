import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {

  final void Function()? onTap;
  final String  txt;
  const CustomButton1({super.key,required this.onTap,required this.txt});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: const Color(0xFF234294),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(txt,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final void Function()? onTap;
  final String txt;
  const CustomButton2(
      {super.key,
      required this.onTap,
      required this.txt,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF39DAA),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            txt,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class CustomButton3 extends StatelessWidget {
  final void Function()? onTap;
  final String txt;
  final IconData? icon;
  final double width;
  final double height;

  const CustomButton3({
    super.key,
    required this.onTap,
    required this.txt,
    this.icon,
    this.width = 200, 
    this.height = 80, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF234294),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min, // ให้ขนาดพอดีกับเนื้อหา
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              if (icon != null)
                const SizedBox(width: 10), // เว้นระยะห่างระหว่าง Icon และ Text
              Text(
                txt,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton4 extends StatelessWidget {
  final void Function()? onTap;
  final String txt;
  final IconData? icon;
  final double width;
  final double height;
  final String email;

  const CustomButton4({
    super.key,
    required this.onTap,
    required this.txt,
    this.icon,
    this.width = 500, 
    this.height = 80, 
    required this.email
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF234294),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max, // ให้ขนาดพอดีกับเนื้อหา
            children: [
              Container(
                width: 60,
                height: 60,
                child: Icon(icon,size: 30,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(255, 20, 39, 92) 
                ),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    txt,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}




class ChatTile1 extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String lastChat;
  final String lastTime;
  const ChatTile1(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.lastChat,
      required this.lastTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // จัดตำแหน่งให้อยู่เริ่มต้น
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(imageUrl),
            radius: 30,
          ),
          const SizedBox(width: 15), // ลดระยะห่างระหว่างรูปภาพและข้อความ
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                  height: 1), // เพิ่มช่องว่างเล็กน้อยระหว่างชื่อและข้อความ
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
