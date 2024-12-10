// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:login_app/components/custom_button.dart';
// import 'package:login_app/services/imagePicker.dart';
// import 'package:login_app/services/profileController.dart';
// import 'package:login_app/utils/snackbar_service.dart';

// class Updateprofile extends StatelessWidget {
//   static const String id = '/update';

//   const Updateprofile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     RxBool isEdit = false.obs;
//     Profilecontroller profilecontroller = Get.put(Profilecontroller());
//     TextEditingController name = TextEditingController(text: profilecontroller.currentUser.value.name);
//     TextEditingController phoneNumber = TextEditingController(text: profilecontroller.currentUser.value.phoneNumber);
//     ImagepickerController imagepickerController = Get.put(ImagepickerController());
//     RxString imagePath = "".obs;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Update Profile")
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primaryContainer
//               ),
//               child: Row(children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                     // Container(
//                     //   width: 200,
//                     //   height: 200,
//                     //   child:  Center(child: Icon(Icons.photo,size: 40,),),
//                     //   decoration: BoxDecoration(
//                     //     // color: Theme.of(context).colorScheme.background,
//                     //     borderRadius: BorderRadius.circular(10,
//                     //   ),
//                     //   ),
//                     // ),
//                     const SizedBox(
//                         height: 20,
//                       ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // GestureDetector(
//                         //     onTap: () async{
//                         //       imagePath.value = await imagepickerController.pickImage();
//                         //       print("image piced: "+imagePath.value);
//                         //     },
//                         //     child: Container(
//                         //       height: 200,
//                         //       width: 200,
//                         //       decoration: BoxDecoration(
//                         //         color: Colors.deepPurple[200],
//                         //         borderRadius: BorderRadius.circular(100)
//                         //       ),
//                         //       child: imagePath.value == ""
//                         //             ? const Icon(
//                         //                 Icons.add,
//                         //                 size: 30,
//                         //                 color: Colors.white,
//                         //               )
//                         //             : ClipRRect(
//                         //               borderRadius: BorderRadius.circular(100),
//                         //               child: Image.file(File(imagePath.value),fit: BoxFit.fill,)) ,
//                         //     )
//                         //   ),
//                         GestureDetector(
//                             onTap: () async {
//                               imagePath.value =
//                                   await imagepickerController.pickImage();
//                               print("Image picked: " + imagePath.value);
//                             },
//                             child: Container(
//                               height: 200,
//                               width: 200,
//                               decoration: BoxDecoration(
//                                 color: Colors.deepPurple[200],
//                                 borderRadius: BorderRadius.circular(100),
//                               ),
//                               child: Obx(() => imagePath.value == ""
//                                   ? const Icon(
//                                       Icons.add,
//                                       size: 30,
//                                       color: Colors.white,
//                                     )
//                                   : ClipRRect(
//                                       borderRadius: BorderRadius.circular(100),
//                                       child: Image.file(
//                                         File(imagePath.value),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     )
//                                   ),
//                             ),
//                           ),

//                       ],
//                     ),
//                     const SizedBox(height: 20,),
//                     Row(children: [
//                       Text("Personal Info",
//                       style: Theme.of(context).textTheme.labelMedium,)
//                     ],
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       children: [
//                         Text("Name",style: Theme.of(context).textTheme.labelMedium,)
//                       ],
//                     ),
//                     const SizedBox(height: 10,),
//                     TextField(
//                       controller: name,
//                       enabled: true,
//                       textInputAction: TextInputAction.next,
//                       decoration: InputDecoration(
//                         hintText: "Your Name",
//                         filled: isEdit.value,
//                         prefixIcon:const Icon(Icons.person)
//                       ),
//                     ),
//                     const SizedBox(height: 20,),
//                     Row(
//                       children: [
//                         Text(
//                           // profilecontroller.currentUser.value.email!,
//                           "email",
//                           style: Theme.of(context).textTheme.bodyMedium,)
//                       ],
//                     ),
//                     const SizedBox(height: 10,),
//                     // const TextField(
//                     //   textInputAction: TextInputAction.next,
//                     //   decoration: InputDecoration(
//                     //     labelText: "Example@gmail.com",
//                     //     prefixIcon: Icon(Icons.alternate_email_rounded)
//                     //   ),

//                     // ),
//                     Row(
//                       children: [
//                         const Icon(Icons.alternate_email_rounded),
//                         const SizedBox(width: 8),
//                         Text(
//                             profilecontroller.currentUser.value.email!,
//                           ),

//                       ],
//                     ),
//                     const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             Text("Phone number",
//                             style: Theme.of(context).textTheme.bodyMedium,)
//                           ],
//                         ),
//                        TextField(
//                         controller: phoneNumber,
//                         enabled: true,
//                         textInputAction: TextInputAction.next,
//                         decoration: const InputDecoration(
//                             hintText: "Phone number",
//                             prefixIcon: Icon(Icons.phone
//                             ),
//                             ),
//                       ),
//                       const SizedBox(height: 40,),
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                         //   PrimaryButton(
//                         //     btnName: "save",
//                         //     Icon(Icons.save),
//                         //     OnTap(){},
//                         //   )
//                          ],
//                       ),
//                       // const SizedBox(height: 10,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CustomButton3( onTap: () async{
//                             profilecontroller.currentUser.update((user) {
//                               user?.name = name.text;
//                               user?.phoneNumber = phoneNumber.text;
//                               });
//                               await FirebaseFirestore.instance
//                                   .collection('users')
//                                   .doc(FirebaseAuth.instance.currentUser!.uid)
//                                   .update({
//                                 'name': name.text,
//                                 'phoneNumber': phoneNumber.text,
//                               }).then((_) {
//                                 print("ข้อมูลอัปเดตสำเร็จใน Firestore");
//                               }).catchError((error) {
//                                 print("เกิดข้อผิดพลาด: $error");
//                               });

//                               },
//                               txt: "Save",
//                               width: 150,
//                               height: 60,
//                               icon: Icons.save,)
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       )

//                   ],
//                 ))
//               ],),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/components/custom_button.dart';
import 'package:login_app/pages/Profile/ProfilePage.dart';
import 'package:login_app/pages/Profile/Widgets/UserInfo.dart';
import 'package:login_app/pages/homePage.dart';
import 'package:login_app/services/imagePicker.dart';
import 'package:login_app/services/profileController.dart';

class Updateprofile extends StatelessWidget {
  static const String id = '/update';
  const Updateprofile({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
    Profilecontroller profilecontroller = Get.put(Profilecontroller());
    TextEditingController name =
        TextEditingController(text: profilecontroller.currentUser.value.name);
    TextEditingController email =
        TextEditingController(text: profilecontroller.currentUser.value.email);
    TextEditingController phone = TextEditingController(
        text: profilecontroller.currentUser.value.phoneNumber);
    TextEditingController about =
        TextEditingController(text: profilecontroller.currentUser.value.about);
    ImagepickerController imagepickerController =
        Get.put(ImagepickerController());
    RxString imagePath = "".obs;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // ปุ่ม Back
          onPressed: () {
            // กลับไปยังหน้า Home
            Navigator.pushNamed(context, Profilepage.id);
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF234294),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              // height: 300,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 210, 223),
                  borderRadius: BorderRadius.circular(20)),
              child: Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => isEdit.value
                              ? InkWell(
                                  onTap: () async {
                                    imagePath.value =
                                        await imagepickerController.pickImage();
                                    // await profilecontroller.ubdateProfile(imagePath.value,name.text,about.text,phone.text);
                                    debugPrint(
                                        "Image picked: " + imagePath.value);
                                  },
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.pink[200],
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Obx(() => imagePath.value == ""
                                        ? const Icon(
                                            Icons.add,
                                            size: 30,
                                            color: Colors.white,
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.file(
                                              File(imagePath.value),
                                              fit: BoxFit.fill,
                                            ),
                                          )),
                                  ),
                                )
                              : Container(
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
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.file(
                                            File(imagePath.value),
                                            fit: BoxFit.fill,
                                          ),
                                        )),
                                ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextField(
                        controller: name,
                        enabled: isEdit.value,
                        decoration: InputDecoration(
                            filled: isEdit.value,
                            // hintText: "Name",
                            labelText: "Name",
                            prefixIcon: const Icon(Icons.person)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextField(
                        controller: about,
                        enabled: isEdit.value,
                        decoration: InputDecoration(
                            filled: isEdit.value,
                            // hintText: "Name",
                            labelText: "About",
                            prefixIcon: const Icon(Icons.info)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    TextField(
                      controller: email,
                      enabled: false,
                      decoration: InputDecoration(
                          filled: isEdit.value,
                          // hintText: "Name",
                          labelText: "Email",
                          prefixIcon: const Icon(Icons.alternate_email)),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextField(
                        controller: phone,
                        enabled: isEdit.value,
                        decoration: InputDecoration(
                            filled: isEdit.value,
                            // hintText: "Name",
                            labelText: "Number",
                            prefixIcon: const Icon(Icons.phone)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => isEdit.value
                            ? CustomButton3(
                                onTap: () async {
                                  profilecontroller.currentUser.update((user) {
                                    user?.name = name.text;
                                    user?.phoneNumber = phone.text;
                                    user?.about = about.text;
                                    user?.imagePath = imagePath.value;
                                  });
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .update({
                                    'name': name.text,
                                    'phoneNumber': phone.text,
                                    'about': about.text,
                                    'imagePath': imagePath.value
                                  }).then((_) {
                                    print("ข้อมูลอัปเดตสำเร็จใน Firestore");
                                  }).catchError((error) {
                                    print("เกิดข้อผิดพลาด: $error");
                                  });
                                  isEdit.value = false;
                                },
                                txt: "Save",
                                width: 150,
                                height: 60,
                                icon: Icons.save,
                              )
                            : CustomButton3(
                                onTap: () {
                                  isEdit.value = true;
                                },
                                txt: "Edit",
                                icon: Icons.edit,
                                height: 60,
                                width: 150,
                              ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: TextField(
                    //         enabled: isEdit.value,
                    //         decoration:  InputDecoration(
                    //           filled: isEdit.value,
                    //           hintText: "Name",
                    //           prefixIcon: Icon(Icons.person)
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
