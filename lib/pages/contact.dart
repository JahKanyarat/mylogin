import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:login_app/Chat/ChatPage.dart';
import 'package:login_app/Config/images.dart';
import 'package:login_app/components/custom_button.dart';
import 'package:login_app/components/custom_textfeild.dart';
import 'package:login_app/pages/homePage.dart';
import 'package:login_app/services/ChatController.dart';
import 'package:login_app/services/ContactController.dart';
import 'package:login_app/services/profileController.dart';

class Contact extends StatelessWidget {
  static const String id = '/contact';
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ContactController contactcontroller = Get.put(ContactController());
    ChatController chatController = Get.put(ChatController());
    Profilecontroller profileController = Get.put(Profilecontroller());

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title:
            const Text("Select Contact", style: TextStyle(color: Colors.white)),
        actions: [
          Obx(() => IconButton(
                onPressed: () {
                  isSearchEnable.value = !isSearchEnable.value;
                },
                icon: isSearchEnable.value
                    ? const Icon(Icons.close)
                    : const Icon(Icons.search),
              )),
        ],
        backgroundColor: const Color(0xFF234294),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, Homepage.id);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Obx(() => isSearchEnable.value
                ? const ContactSearch()
                : const SizedBox()),
            const SizedBox(height: 15),
            CustomButton3(
              onTap: () {},
              txt: "New Contact",
              icon: Icons.person_add_sharp,
              height: 80,
              width: 500,
            ),
            const SizedBox(height: 10),
            const Text("Contact on ChatApp"),
            const SizedBox(height: 10),
            Obx(() {
              return Column(
                children: contactcontroller.userList.map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Chatpage.id,
                        arguments: e, // Passing the UserModel as arguments
                      );
                    },
                    child: ChatTile1(
                      imageUrl: e.profileImage ?? AssetsImage.girlPic,
                      name: e.name ?? "User",
                      lastChat: e.about ?? "about",
                      lastTime:
                          e.email == profileController.currentUser.value.email
                              ? "YOU"
                              : "",
                    ),
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:login_app/ChatTile.dart';
// import 'package:login_app/Config/images.dart';
// import 'package:login_app/Model/UserMode.dart';
// import 'package:login_app/components/custom_button.dart';
// import 'package:login_app/components/custom_textfeild.dart';
// import 'package:login_app/pages/homePage.dart';
// import 'package:login_app/services/ChatController.dart';
// import 'package:login_app/services/ContactController.dart';
// import 'package:login_app/Chat/ChatPage.dart';

// class Contact extends StatelessWidget {
//   static const String id = '/contact';
//   const Contact({super.key});

//   @override
//   Widget build(BuildContext context) {
//     RxBool isSearchEnable = false.obs;
//     ContactController contactcontroller = Get.put(ContactController());

//     ChatController chatController = Get.put(ChatController());
//     final List<UserModel> contacts = [
//       // UserModel(id: '1', name: 'PingPong', email: 'pingpong@example.com'),
//       // UserModel(id: '2', name: 'Sunoo', email: 'sunoo@example.com'),
//     ];
    

//     return Scaffold(
//       appBar: AppBar(

//         iconTheme: const IconThemeData(color: Colors.white),
//         title: const Text(
//           "Select Contact",
//           style: TextStyle(color: Colors.white),
//         ),
//         actions: [
//           Obx(() => IconButton(
//                 onPressed: () {
//                   isSearchEnable.value = !isSearchEnable.value;
//                 },
//                 icon: isSearchEnable.value
//                     ? const Icon(Icons.close)
//                     : const Icon(Icons.search)))
//         ],
//         backgroundColor: const Color(0xFF234294),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushNamed(context, Homepage.id);
//           },
//         ),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(15),
//           child: ListView(
//             children: [
//               Obx(() => isSearchEnable.value
//                   ? const ContactSearch()
//                   : const SizedBox()),
//               const SizedBox(
//                 height: 15,
//               ),
//               CustomButton3(
//                 onTap: () {},
//                 txt: "New Contact",
//                 icon: Icons.person_add_sharp,
//                 height: 80,
//                 width: 500,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Row(
//                 children: [
//                   Text("Contact on ChatApp"),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),

//               // ใช้ Obx เพื่อรีเฟรช UI เมื่อข้อมูลใน userList เปลี่ยนแปลง
//               Obx(() {
//                 return Column(
//                   children: contactcontroller.userList.map((e) {
//                     return InkWell(
//                       onTap: () {
//                         //Get.to(Chatpage(userModel: e));
//                         //Get.toNamed("/chatPage");
//                         //Navigator.pushNamed(context, Chatpage.id);

//                         Navigator.pushNamed(
//                           context,
//                           Chatpage.id,
//                           arguments: user, // ส่ง UserModel เป็น arguments
//                         );
//                       },
//                       child: ChatTile1(
//                         imageUrl: e.profileImage ??
//                             AssetsImage
//                                 .girlPic, // ใช้ภาพโปรไฟล์จาก e.profileImage หรือค่า default
//                         name: e.name ?? "User", // ชื่อผู้ใช้
//                         lastChat: e.about ?? "about", // ข้อความแนะนำตัว
//                         lastTime: '', // เวลาล่าสุดที่มีการติดต่อ
//                       ),
//                     );
//                   }).toList(),
//                 );
//               }),
//             ],
//           ),
//         )

//       // body:
//       // Padding(
//       //   padding: const EdgeInsets.all(15),
//       //   child: ListView(
//       //     children: [
//       //       Obx(()=> isSearchEnable.value ? const ContactSearch() : const SizedBox()),
//       //       const SizedBox(height: 15,),
//       //       CustomButton3(
//       //           onTap: () {},
//       //           txt: "New Contact",
//       //           icon: Icons.person_add_sharp,
//       //           height: 80,
//       //           width: 500,
//       //         ),
//       //       const SizedBox(height: 10,),
//       //       const Row(
//       //         children: [
//       //           Text("Contact on ChatApp"),
//       //         ],
//       //       ),

//       //       const SizedBox(
//       //           height: 10,
//       //         ),

//       //       Obx(() => Column(
//       //         children: contactcontroller.userList.map(
//       //           (e) => InkWell(
//       //             onTap: () {
//       //               // Get.toNamed("/chatPage");
//       //               },
//       //               child: ChatTile1(
//       //               imageUrl: e.profileImage?? AssetsImage.girlPic,
//       //               name: e.name??"User",
//       //               lastChat: e.about?? "about",
//       //               lastTime: '',
//       //               ),
//       //           ),
//       //         ).toList(),
//       //       )

//       //           // ChatTile1(
//       //           //   imageUrl: 'imageUrl',
//       //           //   name: 'name',
//       //           //   lastChat: 'lastChat',
//       //           //   lastTime: 'lastTime'),
//       //           //  ChatTile1(
//       //           //       imageUrl: 'imageUrl',
//       //           //       name: 'name',
//       //           //       lastChat: 'lastChat',
//       //           //       lastTime: 'lastTime'),
//       //           //  ChatTile1(
//       //           //       imageUrl: 'imageUrl',
//       //           //       name: 'name',
//       //           //       lastChat: 'lastChat',
//       //           //       lastTime: 'lastTime'),
//       //           //  ChatTile1(
//       //           //       imageUrl: 'imageUrl',
//       //           //       name: 'name',
//       //           //       lastChat: 'lastChat',
//       //           //       lastTime: 'lastTime'),

//       //       )
//       //     ],
//       //   ),
//       // )

//     );
//   }
// }
// // class Contact extends StatelessWidget {
// //   static const String id = '/contact';
// //   const Contact({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     RxBool isSearchEnable = false.obs;
// //     ContactController contactcontroller = Get.put(ContactController());

// //     return Scaffold(
// //       appBar: AppBar(
// //         iconTheme: const IconThemeData(color: Colors.white),
// //         title: const Text(
// //           "Select Contact",
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         actions: [
// //           Obx(() => IconButton(
// //                 onPressed: () {
// //                   isSearchEnable.value = !isSearchEnable.value;
// //                 },
// //                 icon: isSearchEnable.value
// //                     ? const Icon(Icons.close)
// //                     : const Icon(Icons.search),
// //               )),
// //         ],
// //         backgroundColor: const Color(0xFF234294),
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back),
// //           onPressed: () {
// //             Navigator.pushNamed(context, Homepage.id);
// //           },
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(15),
// //         child: Obx(() {
// //           if (contactcontroller.isLoading.value) {
// //             return const Center(child: CircularProgressIndicator());
// //           }

// //           if (contactcontroller.userList.isEmpty) {
// //             return const Center(child: Text("No contacts found"));
// //           }

// //           return ListView(
// //             children: [
// //               // Search Bar
// //               if (isSearchEnable.value)
// //                 const ContactSearch(), // Implement the ContactSearch widget

// //               const SizedBox(height: 15),

// //               // "New Contact" Button
// //               CustomButton3(
// //                 onTap: () {
// //                   // Implement new contact functionality
// //                 },
// //                 txt: "New Contact",
// //                 icon: Icons.person_add_sharp,
// //                 height: 80,
// //                 width: double.infinity,
// //               ),

// //               const SizedBox(height: 10),

// //               // Contact List Header
// //               const Text("Contact on App chat",
// //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

// //               const SizedBox(height: 10),

// //               // Contact List
// //               Obx(() {
// //                 if (contactcontroller.isLoading.value) {
// //                   return const Center(child: CircularProgressIndicator());
// //                 }

// //                 if (contactcontroller.userList.isEmpty) {
// //                   return const Center(child: Text("No contacts found"));
// //                 }

// //                 return ListView(
// //                   children: contactcontroller.userList.map((e) {
// //                     return InkWell(
// //                       onTap: () {
// //                         // Navigate to chat page
// //                       },
// //                       child: ChatTile1(
// //                         imageUrl: e.profileImage ?? AssetsImage.girlPic,
// //                         name: e.name ?? "User",
// //                         lastChat: e.about ?? "about",
// //                         lastTime: '',
// //                       ),
// //                     );
// //                   }).toList(),
// //                 );
// //               })
// //             ],
// //           );
// //         }),
// //       ),
// //     );
// //   }
// // }
