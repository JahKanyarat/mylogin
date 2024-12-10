import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String imageUrl;
  final bool isComming; // true: ผู้ส่งอยู่ซ้าย, false: ผู้รับอยู่ขวา
  final String time;
  final String status;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.imageUrl,
    required this.isComming,
    required this.status,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment:
            isComming ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width / 1.4,
            ),
            decoration: BoxDecoration(
              color:
                  isComming ? Colors.blue[100] : Colors.grey[200], // สีสลับกัน
              border: Border.all(color: Colors.blue),
              borderRadius: isComming
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
            ),
            child: imageUrl.isEmpty
                ? Text(message)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(imageUrl),
                      ),
                      const SizedBox(height: 10),
                      Text(message),
                    ],
                  ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment:
                isComming ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isComming) // ผู้รับอยู่ขวา
                Text(
                  time,
                  style: Theme.of(context).textTheme.labelMedium,
                )
              else // ผู้ส่งอยู่ซ้าย
                Row(
                  children: [
                    Text(
                      time,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.done_all,
                      size: 16,
                      color: Colors.blue,
                    ),
                  ],
                )
            ],
          ),
        ],
      ),
    );
  }
}


// class ChatBubble extends StatelessWidget {
//   final String message;
//   final String imageUrl;
//   final bool
//       isComming; // true สำหรับข้อความที่มาจากผู้รับ, false สำหรับข้อความของผู้ส่ง
//   final String time;
//   final String status;

//   const ChatBubble({
//     Key? key,
//     required this.message,
//     required this.imageUrl,
//     required this.isComming,
//     required this.status,
//     required this.time,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Column(
//         crossAxisAlignment:
//             isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             constraints: BoxConstraints(
//               maxWidth: MediaQuery.sizeOf(context).width / 1.4,
//             ),
//             decoration: BoxDecoration(
//               color:
//                   isComming ? Colors.grey[200] : Colors.blue[100], // สีต่างกัน
//               border: Border.all(color: Colors.blue),
//               borderRadius: isComming
//                   ? const BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10),
//                       bottomRight: Radius.circular(10),
//                     )
//                   : const BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10),
//                       bottomLeft: Radius.circular(10),
//                     ),
//             ),
//             child: imageUrl.isEmpty
//                 ? Text(message)
//                 : Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.network(imageUrl),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(message),
//                     ],
//                   ),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment:
//                 isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
//             children: [
//               if (isComming)
//                 Text(
//                   time,
//                   style: Theme.of(context).textTheme.labelMedium,
//                 )
//               else
//                 Row(
//                   children: [
//                     Text(
//                       time,
//                       style: Theme.of(context).textTheme.labelMedium,
//                     ),
//                     const SizedBox(width: 5),
//                     Icon(
//                       Icons.done_all,
//                       size: 16,
//                       color: Colors.blue,
//                     ),
//                   ],
//                 )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatBubble extends StatelessWidget {
//   final String message;
//   final String imageUrl;
//   final bool isComming; // true: รับข้อความ, false: ส่งข้อความ
//   final String time;
//   final String status; // เช่น "read", "sent", "delivered"

//   const ChatBubble({
//     Key? key,
//     required this.message,
//     required this.imageUrl,
//     required this.isComming,
//     required this.time,
//     required this.status,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       child: Row(
//         mainAxisAlignment:
//             isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
//         children: [
//           // รูปโปรไฟล์แสดงเฉพาะด้านซ้าย
//           if (isComming)
//             CircleAvatar(
//               radius: 18,
//               backgroundImage: imageUrl.isNotEmpty
//                   ? NetworkImage(imageUrl)
//                   : AssetImage('assets/default_avatar.png') as ImageProvider,
//             ),
//           if (isComming) const SizedBox(width: 10),
//           // กล่องข้อความ
//           Flexible(
//             child: Column(
//               crossAxisAlignment:
//                   isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   constraints: BoxConstraints(
//                     maxWidth: MediaQuery.of(context).size.width * 0.7,
//                   ),
//                   decoration: BoxDecoration(
//                     color: isComming
//                         ? Colors.grey.shade300
//                         : const Color(0xFF234294),
//                     borderRadius: BorderRadius.only(
//                       topLeft: const Radius.circular(15),
//                       topRight: const Radius.circular(15),
//                       bottomLeft: Radius.circular(isComming ? 0 : 15),
//                       bottomRight: Radius.circular(isComming ? 15 : 0),
//                     ),
//                   ),
//                   child: Text(
//                     message,
//                     style: TextStyle(
//                       color: isComming ? Colors.black : Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 // เวลาส่งและสถานะ
//                 Row(
//                   mainAxisAlignment: isComming
//                       ? MainAxisAlignment.start
//                       : MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       time,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                     if (!isComming) ...[
//                       const SizedBox(width: 5),
//                       Icon(
//                         status == "read"
//                             ? Icons.done_all
//                             : Icons.check_circle_outline,
//                         size: 16,
//                         color: status == "read" ? Colors.blue : Colors.grey,
//                       ),
//                     ],
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           // เผื่อเพิ่มการแสดงโปรไฟล์ในข้อความที่ส่ง (ถ้าจำเป็น)
//         ],
//       ),
//     );
//   }
// }



// class ChatBubble extends StatelessWidget {
//   final String message;
//   final String imageUrl;
//   final bool isComming;
//   final String time;
//   final String status;
//   //const ChatBubble({super.key, required this.massage, required this.isComming, required this.time, required this.status, required this.imageUrl});
//   const ChatBubble({
//     Key? key,
//     required this.message,
//     required this.imageUrl,
//     required this.isComming,
//     required this.status,
//     required this.time,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Column(
//         crossAxisAlignment: 
//           isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//               constraints: BoxConstraints(
//               //minWidth: 100,
//               maxWidth: MediaQuery.sizeOf(context).width / 1.4,
//               ),
//               decoration: BoxDecoration(
//               border: Border.all(color: const Color(0xFF234294)),
//               borderRadius: isComming 
//               ? const BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//                 bottomLeft: Radius.circular(0),
//                 bottomRight: Radius.circular(10),
//               )
//               : const BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(0),
//               )
//             ), 
//             child: imageUrl == ""
//               ? Text(message)
//               :Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.network(imageUrl),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(message)],
//             )
//           ),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
//             children: [
//               isComming ? Text(
//               time,
//               style: Theme.of(context).textTheme.labelMedium)
//               :Row( 
//                 children: 
//                 [
//                   Text(
//                     time,
//                     style: Theme.of(context).textTheme.labelMedium,
//                   ),
//                   const SizedBox(width: 5),
//                   // Image.asset(
//                   //   AssetImage.chatStatusPNG,
//                   //   width: 13,
//                   // )
//                 ]
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }