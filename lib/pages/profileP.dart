import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/components/custom_button.dart';
import 'package:login_app/pages/Profile/ProfilePage.dart';
import 'package:login_app/pages/homePage.dart';
import 'package:login_app/pages/loginPage.dart'; // Assuming this is your login page.
import 'package:login_app/services/authentication_service.dart';
import 'package:login_app/services/imagePicker.dart';
import 'package:login_app/services/profileController.dart';
import 'package:login_app/utils/load_spinner.dart';

class Profilep extends StatelessWidget {
  static const String id = '_profile2';
  const Profilep({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
    Profilecontroller profilecontroller = Get.find<Profilecontroller>();
    TextEditingController name =
        TextEditingController(text: profilecontroller.currentUser.value.name);
    TextEditingController email =
        TextEditingController(text: profilecontroller.currentUser.value.email);
    TextEditingController phone =
        TextEditingController(text: profilecontroller.currentUser.value.phoneNumber);
    TextEditingController about =
        TextEditingController(text: profilecontroller.currentUser.value.about);
    ImagepickerController imagepickerController =
        Get.put(ImagepickerController());
    RxString imagePath = "".obs;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button
          onPressed: () {
            Navigator.pushNamed(context, Profilepage.id);
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF234294),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              DisplaySpinner.show(context);
              await AuthenticationService.signOut().then((value) {
                DisplaySpinner.hide();
                Navigator.pushNamedAndRemoveUntil(
                    context, Loginpage.id, (routr) => false);
              });
            }, 
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => isEdit.value
                              ? InkWell(
                                  onTap: () async {
                                    imagePath.value = await imagepickerController.pickImage();
                                    debugPrint("Image picked: " + imagePath.value);
                                  },
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple[200],
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Obx(() => imagePath.value == ""
                                        ? const Icon(
                                            Icons.add,
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
                                )
                              : Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple[200],
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => TextField(
                        controller: name,
                        enabled: isEdit.value,
                        decoration: InputDecoration(
                          filled: isEdit.value,
                          labelText: "Name",
                          prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => TextField(
                        controller: about,
                        enabled: isEdit.value,
                        decoration: InputDecoration(
                          filled: isEdit.value,
                          labelText: "About",
                          prefixIcon: const Icon(Icons.info),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: email,
                      enabled: false,
                      decoration: InputDecoration(
                        filled: isEdit.value,
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.alternate_email),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => TextField(
                        controller: phone,
                        enabled: isEdit.value,
                        decoration: InputDecoration(
                          filled: isEdit.value,
                          labelText: "Number",
                          prefixIcon: const Icon(Icons.phone),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => isEdit.value
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
                                        .doc(FirebaseAuth.instance.currentUser!.uid)
                                        .update({
                                      'name': name.text,
                                      'phoneNumber': phone.text,
                                      'about': about.text,
                                      'imagePath': imagePath.value
                                    }).then((_) {
                                      print("Updated successfully in Firestore");
                                    }).catchError((error) {
                                      print("Error occurred: $error");
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
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
