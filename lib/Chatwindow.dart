import 'package:flutter/material.dart';

class Chatwindow extends StatelessWidget {
  final String name;

  const Chatwindow({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF234294),
          title: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Centers content
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/profile_pic.png') // Placeholder image path
                    ),
                    const SizedBox(width: 10),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight:
                            FontWeight.w400, // Increased font size and weight
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.call, size: 25), // Larger icon size
                  onPressed: () {
                    // Call functionality
                  },
                ),
              ],
            ),
          ),
        ),
      

      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              // Initially empty, no messages yet
              children: const [],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                const SizedBox(width: 10), // Space between icon and text field
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF234294)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1,vertical: 1),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type a message...",
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF234294), // Icon color for camera
                          ),
                          suffixIcon: Icon(
                            Icons.send,
                            color: Color(0xFF234294), // Icon color for send
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                    width: 10), // Space between text field and send button
              ],
            ),
          ),
        ],
      ),
    );
  }
}
