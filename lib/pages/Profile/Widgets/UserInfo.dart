import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/services/imagePicker.dart';
import 'package:login_app/services/profileController.dart';

class LoginUserInfo extends StatelessWidget {
  static const String id = '/userInfo';
  const LoginUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Profilecontroller profilecontroller = Get.find<Profilecontroller>();
    ImagepickerController imagepickerController =
        Get.put(ImagepickerController());
    RxString imagePath = "".obs;

    // Fetch the current user's data
    return FutureBuilder(
      future: profilecontroller.fetchCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        return Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 247, 210, 223),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.pink[200],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Obx(() => imagePath.value == ""
                              ? const Icon(
                                  Icons.image,
                                  size: 30,
                                  color: Colors.white,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    File(imagePath.value),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => Text(
                              profilecontroller.currentUser.value.name ?? "",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => Text(
                              profilecontroller.currentUser.value.about ?? "",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.email_outlined),
                        const SizedBox(width: 10),
                        Obx(() => Text(
                              profilecontroller.currentUser.value.email ?? "",
                              style: Theme.of(context).textTheme.labelLarge,
                            )),
                      ],
                    ),
                    const SizedBox(height: 20),
                        Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          spacing: 7.5, // ระยะห่างระหว่าง widgets
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.background,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.phone, color: Colors.green[800]),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Call",
                                    style: TextStyle(
                                        color: Colors.green[800], fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.background,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.video_call,
                                      color: Colors.yellow[800]),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Video",
                                    style: TextStyle(
                                        color: Colors.yellow[800],
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.background,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.chat, color: Colors.blue[700]),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Chat",
                                    style: TextStyle(
                                        color: Colors.blue[700], fontSize: 20),
                                  )
                                ],
                              ),
                            ),

                           
                          ],
                        ),
                      ],
                    )
                    // Additional Widgets
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



// class LoginUserInfo extends StatelessWidget {
//   static const String id = '/userInfo';
//   const LoginUserInfo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Profilecontroller profilecontroller = Get.find<Profilecontroller>();
//     ImagepickerController imagepickerController =
//         Get.put(ImagepickerController());
//     RxString imagePath = "".obs;
//     return Container(
//               padding: const EdgeInsets.all(25),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: const Color.fromARGB(255, 247, 210, 223)),//Theme.of(context).colorScheme.primaryContainer),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 20,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [ Container(
//                       height: 200,
//                       width: 200,
//                       decoration: BoxDecoration(
//                         color: Colors.pink[200],
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                       child: Obx(() => imagePath.value == ""
//                           ? const Icon(
//                               Icons.image,
//                               size: 30,
//                               color: Colors.white,
//                             )
//                           : ClipRRect(
//                               borderRadius: BorderRadius.circular(100),
//                               child: Image.file(
//                                 File(imagePath.value),
//                                 fit: BoxFit.fill,
//                               ),
//                             )
//                           ),
//                     ),
//                     //         Container(
//                     //   height: 200,
//                     //   width: 200,
//                     //   decoration: BoxDecoration(
//                     //     color: Colors.deepPurple[200],
//                     //     borderRadius: BorderRadius.circular(100),
//                     //   ),

//                     //   child: Obx(() => imagePath.value == ""
//                     //       ? const Icon(
//                     //           Icons.image,
//                     //           size: 30,
//                     //           color: Colors.white,
//                     //         )
//                     //       : ClipRRect(
//                     //           borderRadius: BorderRadius.circular(100),
//                     //           child: Image.file(
//                     //             File(imagePath.value),
//                     //             fit: BoxFit.fill,
//                     //           ),
//                     //         )),
//                     // ),
//                         ],
//                         ),
//                         const SizedBox(height: 20,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Obx(()=> Text(
//                               profilecontroller.currentUser.value.name!,
//                               style: Theme.of(context).textTheme.bodyLarge,
//                               )
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Obx(() => Text(
//                                  profilecontroller.currentUser.value.about!,
//                                  style: Theme.of(context).textTheme.bodyLarge,
//                                  ))
//                                   ],
//                             ),
//                         const SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.email_outlined),
//                             SizedBox(width: 10),
//                             Obx(()=>Text(
//                               profilecontroller.currentUser.value.email!,
//                               style: Theme.of(context).textTheme.labelLarge,)
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 30,),

//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Wrap(
//                               spacing: 7.5, // ระยะห่างระหว่าง widgets
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(15),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     color: Theme.of(context).colorScheme.background,
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Icon(Icons.phone, color: Colors.green[800]),
//                                       const SizedBox(width: 10),
//                                       Text(
//                                         "Call",
//                                         style: TextStyle(
//                                           color: Colors.green[800],
//                                           fontSize: 20),
//                                           )
//                                     ],
//                                     ),
//                                   ),
//                                   Container(
//                                   padding: const EdgeInsets.all(15),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     color: Theme.of(context).colorScheme.background,
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Icon(Icons.video_call, color: Colors.yellow[800]),
//                                       const SizedBox(width: 10),
//                                       Text(
//                                         "Video",
//                                         style: TextStyle(
//                                           color: Colors.yellow[800],
//                                           fontSize: 20),
//                                           )
//                                     ],
//                                     ),
//                                   ),
//                                   Container(
//                                   padding: const EdgeInsets.all(15),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     color: Theme.of(context).colorScheme.background,
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Icon(Icons.chat, color: Colors.blue[700]),
//                                       const SizedBox(width: 10),
//                                       Text(
//                                         "Chat",
//                                         style: TextStyle(
//                                           color: Colors.blue[700],
//                                           fontSize: 20),
//                                           )
//                                     ],
//                                     ),
//                                   ),

//                             //                     Container(
//                             //                       padding: const EdgeInsets.all(15),
//                             //                       decoration: BoxDecoration(
//                             // borderRadius: BorderRadius.circular(20),
//                             // color: Theme.of(context).colorScheme.background,
//                             //                       ),
//                             //                       child: Row(
//                             // children: [
//                             //   Icon(Icons.chat, color: Colors.blue[700]),
//                             //   const SizedBox(width: 10),
//                             //   Text(
//                             //     "Chat",
//                             //     style: TextStyle(color: Colors.blue[700],fontSize: 20),
//                             //   )
//                             // ],
//                             //                       ),
//                             //                     ),
//                             ],
//                             ),
//                           ],
//                         )

//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             );
//   }
// }