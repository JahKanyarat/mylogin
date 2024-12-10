// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:login_app/pages/Profile/Widgets/UpdateProfile.dart';
// import 'package:login_app/pages/Profile/Widgets/UserInfo.dart';
// import 'package:login_app/pages/homePage.dart';
// import 'package:login_app/pages/loginPage.dart';
// import 'package:login_app/pages/profileP.dart';
// import 'package:login_app/services/authentication_service.dart';
// import 'package:login_app/services/profileController.dart';
// import 'package:login_app/utils/load_spinner.dart';

// class Profilepage extends StatelessWidget {
//   static const String id = '/profile';

//   const Profilepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AuthenticationService authenticationService = Get.put(AuthenticationService());
//     Profilecontroller profilecontroller = Get.put(Profilecontroller());

//     //AuthenticationService authentication_service = Get.put(AuthenticationService());
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: const Text("Profile",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: const Color(0xFF234294),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),

//           onPressed: () {
//             // กลับไปยังหน้า Home
//             Navigator.pushNamed(context, Homepage.id);

//           },
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, Profilep.id);
//             },
//             icon: const Icon(Icons.edit),
//           ),
//         ],
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(30),
//         child: Column(
//           crossAxisAlignment:
//               CrossAxisAlignment.center, // Align items in the center
//           children: [
//             const LoginUserInfo(), // Custom widget
//             const Spacer(), // Adds flexible space
//             ElevatedButton(
//               onPressed: () async {
//                 // Display a confirmation dialog
//                 final bool? confirmLogout = await Get.dialog<bool>(
//                   showDialog(
//                     title: const Text("Confirm Logout"),
//                     content: const Text("Are you sure you want to log out?"),
//                     actions: [
//                       TextButton(
//                         onPressed: () =>
//                             Get.back(result: false), // Return false
//                         child: const Text("Cancel"),
//                       ),
//                       TextButton(
//                         onPressed: () => Get.back(result: true), // Return true
//                         child: const Text("Logout"),
//                       ),
//                     ],
//                   ),
//                 );

//                 // Perform logout if confirmed
//                 if (confirmLogout == true) {
//                   DisplaySpinner.show(context); // Show loading spinner
//                   await AuthenticationService.signOut().then((value) {
//                     DisplaySpinner.hide(); // Hide loading spinner
//                     Navigator.pushNamedAndRemoveUntil(
//                       context,
//                       Loginpage.id, // Navigate to login page
//                       (route) => false, // Clear back stack
//                     );
//                   });
//                 }
//               },
//               child: const Text("Logout"), // Button label
//             ),
//           ],
//         ),
//       ),

     
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/components/custom_button.dart';
import 'package:login_app/pages/Profile/Widgets/UpdateProfile.dart';
import 'package:login_app/pages/Profile/Widgets/UserInfo.dart';
import 'package:login_app/pages/homePage.dart';
import 'package:login_app/pages/loginPage.dart';
import 'package:login_app/pages/profileP.dart';
import 'package:login_app/services/authentication_service.dart';
import 'package:login_app/services/profileController.dart';
import 'package:login_app/utils/load_spinner.dart';

class Profilepage extends StatelessWidget {
  static const String id = '/profile';

  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationService authenticationService =
        Get.put(AuthenticationService());
    Profilecontroller profilecontroller = Get.put(Profilecontroller());

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF234294),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Go back to Home page
            Navigator.pushNamed(context, Homepage.id);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Profilep.id);
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Align items in the center
          children: [
            const LoginUserInfo(), 
            const Spacer(), 
            CustomButton3(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white, 
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), 
                      ),
                      title: const Center(
                        child: Text(
                          "Confirm Logout",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF234294), 
                          ),
                        ),
                      ),
                      content: const Text(
                        "Are you sure you want to log out?",
                        style: TextStyle(fontSize: 16),
                      ),
                      actions: [
                        // ปุ่ม Cancel
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); 
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.grey.shade300, 
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), 
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 25),
                          ),
                          child: const Text("Cancel"),
                        ),
                        // ปุ่ม Logout
                        TextButton(
                          onPressed: () async {
                            DisplaySpinner.show(context); 
                            await AuthenticationService.signOut().then((value) {
                              DisplaySpinner.hide(); 
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                Loginpage.id,
                                (route) => false, 
                              );
                            });
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Color(0xFF234294), 
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), 
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 25),
                          ),
                          child: const Text("Logout"),
                        ),
                      ],
                    );
                  },
                );
              },
              txt: "Logout", 
              icon: Icons.logout,
              width: 200,
              height: 60,
            )

          ],
        ),
      ),
    );
  }
}





 // body: Padding(
      //   padding: const EdgeInsets.all(30),
      //   child: Column(
      //     children: [
      //       const LoginUserInfo(),
      //       const Spacer(),
      //       ElevatedButton(
      //         onPressed: () async {
      //           final bool? confirmLogout = await Get.dialog<bool>(
      //             AlertDialog(
      //               title: const Text("Confirm Logout"),
      //               content: const Text("Are you sure you want to log out?"),
      //               actions: [
      //                 TextButton(
      //                   onPressed: () => Get.back(result: false),
      //                   child: const Text("Cancel"),
      //                 ),
      //                 TextButton(
      //                   onPressed: () => Get.back(result: true),
      //                   child: const Text("Logout"),
      //                 ),
      //               ],
      //             ),
      //           );

      //           if (confirmLogout == true) {
      //             await AuthenticationService.signOut();
      //           }
      //         },
      //         child: const Text("Logout"),
      //       ),
      //     ],
      //   ),
      // ),

