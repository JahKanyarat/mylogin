import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/Chat/Widgets/ChatBubble.dart';
import 'package:login_app/Model/ChatModel.dart';
import 'package:login_app/Model/UserMode.dart';
import 'package:login_app/services/ChatController.dart';
import 'package:intl/intl.dart';
import 'package:login_app/services/profileController.dart';

class Chatpage extends StatelessWidget {
  static const String id = '/chatP';
  final UserModel userModel;

  const Chatpage({Key? key, required this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    Profilecontroller profilecontroller = Get.put(Profilecontroller());

    return Scaffold(
          backgroundColor: Colors.white,
      appBar:  AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF234294),
          title: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Centers content
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/boy4_pic.webp'
                      ) // Placeholder image path
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userModel.name ?? "User Name",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight:
                                FontWeight.w400, // Increased font size and weight
                          ),
                        ),
                        const Text("Online",
                        style: TextStyle(
                            color: Color.fromARGB(213, 255, 255, 255),
                            fontSize: 10,
                            fontWeight:
                                FontWeight.w700, // Increased font size and weight
                          ),

                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.call, size: 25), // Larger icon size
                      onPressed: () {
                        // Call functionality
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.video_call, size: 25), // Larger icon size
                      onPressed: () {
                        // Call functionality
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF234294)),
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // ทำให้ Row กะทัดรัด
            children: [
              IconButton(
                icon: const Icon(Icons.camera_alt_outlined, size: 25), 
                onPressed: () {
                  // ฟังก์ชันเรียกใช้
                },
              ),
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    filled: false,
                    hintText: "Type a message...",
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.image, size: 25),
                padding: EdgeInsets.zero, // ลด padding รอบไอคอน
                onPressed: () {
                  // ฟังก์ชันเรียกใช้
                },
              ),
              IconButton(
                icon: const Icon(Icons.send, size: 25),
                padding: EdgeInsets.zero, // ลด padding รอบไอคอน
                onPressed: () {

                  // var newChat = ChatModel(
                  //   id: DateTime.now().millisecondsSinceEpoch.toString(),
                  //   message : messageController.text,
                  //   senderId: chatController.auth.currentUser!.uid,
                  //   receiverId: userModel.id,
                  //   time: DateTime.now().millisecondsSinceEpoch.toString(),
                  // );
                  if (messageController.text.isNotEmpty){
                    chatController.sendMessage(userModel.id!, messageController.text,userModel);
                    messageController.clear();
                  }
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(bottom: 70,top: 10,left: 10,right: 10),
          child: StreamBuilder<List<ChatModel>>(
            stream: chatController.getMessages(userModel.id!),
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                  );
              }
              if (snapshot.data == null)
              {
                return Center(
                  child: Text("No Messages"),
                );
              } 
              else {
                return ListView.builder(
                reverse: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  DateTime timestamp =
                    DateTime.parse(snapshot.data![index].timestamp!);
                  String formattedTime = DateFormat('hh:mm a').format(timestamp);
                  return ChatBubble(
                    message: snapshot.data![index].message!,
                    imageUrl:snapshot.data![index].imageURL ?? "",
                    isComming: snapshot.data![index].receiverId != profilecontroller.currentUser.value.id,
                      status: "read",
                      time: formattedTime);
                  }
                );
              }
              // if (snapshot.hasData) {
              //   return ListView.builder(
              //     reverse: true,
              //     itemCount: snapshot.data!.length,
              //     itemBuilder: (context, index) {
              //       return ChatBubble(
              //         chatModel: snapshot.data![index],
              //         isMe: snapshot.data![index].senderId ==
              //         chatController.auth.currentUser!.uid,
              //         );
              //     },
              //   );
              // }
              return Container();
            }
            ),
        )
    );
  }
        
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       iconTheme: const IconThemeData(color: Colors.white),
  //       backgroundColor: const Color(0xFF234294),
  //       title: Padding(
  //         padding: const EdgeInsets.only(top: 0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Row(
  //               children: [
  //                 const CircleAvatar(
  //                   backgroundImage: AssetImage('assets/images/boy4_pic.webp'),
  //                 ),
  //                 const SizedBox(width: 10),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       "Arpo",
  //                       style: const TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.w400,
  //                       ),
  //                     ),
  //                     const Text(
  //                       "Online",
  //                       style: TextStyle(
  //                         color: Color.fromARGB(213, 255, 255, 255),
  //                         fontSize: 10,
  //                         fontWeight: FontWeight.w700,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 IconButton(
  //                   icon: const Icon(Icons.call, size: 25),
  //                   onPressed: () {},
  //                 ),
  //                 IconButton(
  //                   icon: const Icon(Icons.video_call, size: 25),
  //                   onPressed: () {},
  //                 ),
  //               ],
  //             ),
  //           ],
  //         )
  //       ),
  //     ),
  //     body: const Center(
  //       child: Text('Chat content will go here.'),
  //     ),
  //   );
  // }
}

// class Chatpage extends StatelessWidget {
//   static const String id = '/chatP';
//   final UserModel userModel;
//   const Chatpage({Key? key, required this.userModel}) : super(key: key);

//   //const Chatpage({super.key,required this.userModel});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           backgroundColor: Colors.white,
//       appBar:  AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//           backgroundColor: const Color(0xFF234294),
//           title: Padding(
//             padding: const EdgeInsets.only(top: 0),
//             child: Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.spaceBetween, // Centers content
//               children: [
//                 const Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: AssetImage(
//                           'assets/images/boy4_pic.webp'
//                       ) // Placeholder image path
//                     ),
//                     SizedBox(width: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "PingPong",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight:
//                                 FontWeight.w400, // Increased font size and weight
//                           ),
//                         ),
//                         Text("Online",
//                         style: TextStyle(
//                             color: Color.fromARGB(213, 255, 255, 255),
//                             fontSize: 10,
//                             fontWeight:
//                                 FontWeight.w700, // Increased font size and weight
//                           ),

//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.call, size: 25), // Larger icon size
//                       onPressed: () {
//                         // Call functionality
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.video_call, size: 25), // Larger icon size
//                       onPressed: () {
//                         // Call functionality
//                       },
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
      
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: Container(
//           margin: const EdgeInsets.all(10),
//           padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
//           decoration: BoxDecoration(
//             border: Border.all(color: const Color(0xFF234294)),
//             color: const Color.fromARGB(255, 255, 255, 255),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min, // ทำให้ Row กะทัดรัด
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.camera_alt_outlined, size: 25), 
//                 onPressed: () {
//                   // ฟังก์ชันเรียกใช้
//                 },
//               ),
//               const Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: "Type a message...",
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.image, size: 25),
//                 padding: EdgeInsets.zero, // ลด padding รอบไอคอน
//                 onPressed: () {
//                   // ฟังก์ชันเรียกใช้
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(Icons.send, size: 25),
//                 padding: EdgeInsets.zero, // ลด padding รอบไอคอน
//                 onPressed: () {
//                   // ฟังก์ชันเรียกใช้
//                 },
//               ),
//             ],
//           ),
//         ),

      
      
//       body: Padding(
//         padding: EdgeInsets.all(10),

//         child: ListView(
//           children: const [
//             ChatBubble(
//               massage: 'Hijjwrud', 
//               isComming: true, 
//               time: '10:10 AM', 
//               status: 'read', 
//               imageUrl: '', 
//             ),
//             ChatBubble(
//               massage: 'Hijjwrud', 
//               isComming: false, 
//               time: '10:10 AM', 
//               status: 'read', 
//               imageUrl: '', 
//             ),
//             ChatBubble(
//               massage: 'Hijjwrud', 
//               isComming: false, 
//               time: '10:10 AM', 
//               status: 'read', 
//               imageUrl: 'https://kpopping.com/documents/0a/1/2053/240911-ENHYPEN-Sunoo-Prada-Beauty-Event-documents-1.jpeg?v=c5692', 
//             ),
//             ChatBubble(
//               massage: 'Hijjwrud', 
//               isComming: true, 
//               time: '10:10 AM', 
//               status: 'read', 
//               imageUrl: 'https://kpopping.com/documents/0a/1/2053/240911-ENHYPEN-Sunoo-Prada-Beauty-Event-documents-1.jpeg?v=c5692', 
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Chatpage extends StatelessWidget {
//   const Chatpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Chatpage"),
//       ),
//       body: const Center(
//         child: Text("Welcome to the chat page!"),
//       ),
//     );
//   }
// }


