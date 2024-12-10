// class ChatModel {
//   String? id;
//   String? message;
//   String? senderName;
//   String? senderId;
//   String? receiverId;
//   String? timestamp;
//   String? readStatus;
//   String? imageURL;
//   String? videoUrl;
//   String? audioUrl;
//   String? documentUrl;
//   List<String>? reactions;
//   List<String>? replies;

//   ChatModel({
//     this.id,
//     this.message,
//     this.senderName,
//     this.senderId,
//     this.receiverId,
//     this.timestamp,
//     this.readStatus,
//     this.imageURL,
//     this.videoUrl,
//     this.audioUrl,
//     this.documentUrl,
//     this.reactions,
//     this.replies,
//   });

//   // Deserialize from JSON
//   ChatModel.fromJson(Map<String, dynamic> json) {
//     id = json["id"] as String?;
//     message = json["message"] as String?;
//     senderName = json["senderName"] as String?;
//     senderId = json["senderId"] as String?;
//     receiverId = json["receiverId"] as String?;
//     timestamp = json["timestamp"] as String?;
//     readStatus = json["readStatus"] as String?;
//     imageURL = json["imageURL"] as String?;
//     videoUrl = json["videoUrl"] as String?;
//     audioUrl = json["audioUrl"] as String?;
//     documentUrl = json["documentUrl"] as String?;
//     if( json["reactions"]is List){
//       reactions = json["reaction"] == null ? null : List<String>.from(json["reactions"]);
//     }
//     if(json["replies"] is List){
//       replies = json["replies"] ?? [];
//     }
//   }

//   // Serialize to JSON
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String,dynamic>{};
    
//     _data["id"] = id;
//     _data["message"] = message;
//     _data["senderName"] = senderName;
//     _data["senderId"]= senderId;
//     _data["receiverId"]= receiverId;
//     _data["timestamp"]= timestamp;
//     _data["readStatus"]= readStatus;
//     _data["imageURL"]= imageURL;
//     _data["videoUrl"]= videoUrl;
//     _data["audioUrl"]= audioUrl;
//     _data["documentUrl"]= documentUrl;
//     if(reactions != null){
//       _data ["reactions"] = reactions;
//     }
//     if(replies != null){
//       _data ["replies"] = replies;
//     }
//     return _data;
//   }
// }
class ChatModel {
  String? id;
  String? message;
  String? senderName;
  String? senderId;
  String? receiverId;
  String? timestamp;
  String? readStatus;
  String? imageURL;
  String? videoUrl;
  String? audioUrl;
  String? documentUrl;
  List<String>? reactions;
  List<String>? replies;

  ChatModel({
    this.id,
    this.message,
    this.senderName,
    this.senderId,
    this.receiverId,
    this.timestamp,
    this.readStatus,
    this.imageURL,
    this.videoUrl,
    this.audioUrl,
    this.documentUrl,
    this.reactions,
    this.replies,
  });

  // Deserialize from JSON
  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] as String?;
    message = json["message"] as String?;
    senderName = json["senderName"] as String?;
    senderId = json["senderId"] as String?;
    receiverId = json["receiverId"] as String?;
    timestamp = json["timestamp"] as String?;
    readStatus = json["readStatus"] as String?;
    imageURL = json["imageURL"] as String?;
    videoUrl = json["videoUrl"] as String?;
    audioUrl = json["audioUrl"] as String?;
    documentUrl = json["documentUrl"] as String?;
    reactions =
        json["reactions"] is List ? List<String>.from(json["reactions"]) : null;
    replies =
        json["replies"] is List ? List<String>.from(json["replies"]) : null;
  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = {};

    if (id != null) _data["id"] = id;
    if (message != null) _data["message"] = message;
    if (senderName != null) _data["senderName"] = senderName;
    if (senderId != null) _data["senderId"] = senderId;
    if (receiverId != null) _data["receiverId"] = receiverId;
    if (timestamp != null) _data["timestamp"] = timestamp;
    if (readStatus != null) _data["readStatus"] = readStatus;
    if (imageURL != null) _data["imageURL"] = imageURL;
    if (videoUrl != null) _data["videoUrl"] = videoUrl;
    if (audioUrl != null) _data["audioUrl"] = audioUrl;
    if (documentUrl != null) _data["documentUrl"] = documentUrl;
    if (reactions != null) _data["reactions"] = reactions;
    if (replies != null) _data["replies"] = replies;

    return _data;
  }
}
