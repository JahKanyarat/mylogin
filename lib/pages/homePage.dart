// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:login_app/pages/loginPage.dart';
// import 'package:login_app/services/authentication_service.dart';
// import 'package:login_app/utils/load_spinner.dart';

// class Homepage extends StatelessWidget {
//   static const String id = 'homeP';
//   final user = FirebaseAuth.instance.currentUser;
//   Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         actions:[IconButton(
//           onPressed: ()async{DisplaySpinner.show(context);
//           await AuthenticationService.signOut().then((value) {
//             DisplaySpinner.hide();
//             Navigator.pushNamedAndRemoveUntil(context, Loginpage.id, (routr)=> false);
//           });
//           },
//           icon: const Icon(Icons.logout)
//       )]
//     ),
//       body:
//       Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(foregroundImage: NetworkImage(user!.photoURL ?? 'https://randomuser.me/portraits/thumb/men/65.jpg'),),
//             const SizedBox(height: 10,),
//             Text("Logged in as : ${user!.displayName?? user!.email}"),
//           ],
//         ),
//       ),
//     );
//   }
// }





// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:login_app/Witget/ChatList.dart';
// import 'package:login_app/Witget/TabBar.dart';


// class Homepage extends StatefulWidget {
//   static const String id = 'homeP';
//   final user = FirebaseAuth.instance.currentUser;
//   Homepage({super.key});

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Homepage> with SingleTickerProviderStateMixin {
//   late TabController tabController;

//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 3, vsync: this); // For 3 tabs
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: const Text(
//           "Chat",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: const Color(0xFF234294),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               // Search functionality here
//             },
//             color: Colors.white,
//           ),
//           IconButton(
//             icon: const Icon(Icons.more_vert),
//             onPressed: () {
//               // Add more options here
//             },
//             color: Colors.white,
//           ),
//         ],
//         bottom: myTabBar(
//           tabController,
//           context,
//           tabs: const [
//             Tab(child: Text("Chat")),
//             Tab(child: Text("Group")),
//             Tab(child: Text("Calls")),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Add new chat functionality here
//         },
//         child: const Icon(Icons.add, color: Colors.white),
//         backgroundColor: const Color(0xFF234294),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: TabBarView(
//           controller: tabController,
//           children: const [
//             ChatList(), // Replace with your chat list widget
//             Center(child: Text("Group")), // Group tab placeholder
//             Center(child: Text("Calls")), // Calls tab placeholder
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/Chat/ChatPage.dart';
import 'package:login_app/Config/images.dart';
import 'package:login_app/Witget/ChatList.dart';
import 'package:login_app/Witget/TabBar.dart';
import 'package:login_app/components/custom_button.dart';
import 'package:login_app/pages/Profile/ProfilePage.dart';
import 'package:login_app/pages/contact.dart';
import 'package:login_app/pages/profileP.dart';
import 'package:login_app/services/ContactController.dart';
import 'package:login_app/services/imagePicker.dart';
import 'package:login_app/services/profileController.dart';


class Homepage extends StatefulWidget {
  static const String id = 'homeP';

  Homepage({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Homepage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 3, vsync: this); // Initializes TabController
  }

  @override
  void dispose() {
    tabController.dispose(); // Properly dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ContactController contactcontroller = Get.put(ContactController());
    Profilecontroller profilecontroller = Get.put(Profilecontroller());
    ImagepickerController imagepickerController = Get.put(ImagepickerController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Chat",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF234294),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              imagepickerController.pickImage();
            },
            color: Colors.white,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () async {
              //await profilecontroller.getUserDetails();
              Navigator.pushNamed(context, Profilepage.id);
              // Navigator.pushNamed(context, Profilep.id);
            },
            color: Colors.white,
          ),
        ],
        // bottom: myTabBar(tabController, context),
        bottom: myTabBar(tabController, context),

        // bottom: myTabBar(
        //   tabController,
        //   context,
        //   tabs: const [
        //     Tab(child: Text("Chat")),
        //     Tab(child: Text("Group")),
        //     Tab(child: Text("Calls")),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Contact.id);
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: const Color(0xFF234294),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(
          controller: tabController,
          children:  [
            //พี่ลองใส่เฉยๆ ไม่ได้ตามคลิปนาจา
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
                          e.email == profilecontroller.currentUser.value.email
                              ? "YOU"
                              : "",
                    ),
                  );
                }).toList(),
              );
            }),

            // ChatList(), // Custom Chat List Widget
            Center(child: Text("Group")), // Placeholder for Group Tab
            Center(child: Text("Calls")), // Placeholder for Calls Tab
          ],
        ),
      ),
    );
  }
}



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:login_app/Witget/ChatList.dart';
// import 'package:login_app/Witget/TabBar.dart'; // Ensure this is correct


// class Homepage extends StatefulWidget {
//   static const String id = 'homeP';

//   Homepage({super.key});

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Homepage> with SingleTickerProviderStateMixin {
//   late TabController tabController;

//   @override
//   void initState() {
//     super.initState();
//     tabController =
//         TabController(length: 3, vsync: this); // Initializes TabController
//   }

//   @override
//   void dispose() {
//     tabController.dispose(); // Properly dispose the controller
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: const Text(
//           "Chat",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: const Color(0xFF234294),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               // Implement search functionality
//             },
//             color: Colors.white,
//           ),
//           IconButton(
//             icon: const Icon(Icons.more_vert),
//             onPressed: () {
//               // Implement more options functionality
//             },
//             color: Colors.white,
//           ),
//         ],
//         // bottom: myTabBar(tabController, context),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Implement new chat functionality
//         },
//         child: const Icon(Icons.add, color: Colors.white),
//         backgroundColor: const Color(0xFF234294),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: TabBarView(
//           controller: tabController,
//           children: const [
//             ChatList(), // Custom Chat List Widget
//             Center(child: Text("Group")), // Placeholder for Group Tab
//             Center(child: Text("Calls")), // Placeholder for Calls Tab
//           ],
//         ),
//       ),
//     );
//   }
// }
