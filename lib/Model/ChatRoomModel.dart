import 'package:login_app/Model/ChatModel.dart';
import 'package:login_app/Model/UserMode.dart';

class ChatRoomModel {
  String? id;
  UserModel? sender;
  UserModel? receiver;
  List<ChatModel>? messages;
  int? unReadMessNo;
  String? lastMessage;
  String? lastMessageTimestamp;
  String? timestamp;

  ChatRoomModel({
    this.id,
    this.sender,
    this.receiver,
    this.messages,
    this.unReadMessNo,
    this.lastMessage,
    this.lastMessageTimestamp,
    this.timestamp});
  
  ChatRoomModel.fromJson(Map<String, dynamic>json) {
    if(json["id"]is String){
      id = json["id"];
    }
    if(json["sender"]is Map){
      sender = json["sender"] == null ? null : UserModel.fromJson(json["sender"]);
    }
    if(json["receiver"]is Map){
      receiver = json["receiver"] == null ? null : UserModel.fromJson(json["receiver"]);
    }
    if(json["messages"]is List){
      messages = json["messages"] ?? [];
    }
    if(json["lastMessage"] is String){
      lastMessage = json["lastMessage"];
    }
    if(json["lastMessageTimestamp"] is String) {
      lastMessageTimestamp = json["lastMessageTimestamp"];
    }
    if(json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
    if(json["unReadMessNo"] is int){
      unReadMessNo = json["unReadMessNo"];
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["lastMessage"] = lastMessage;
    _data["lastMessageTimestamp"] = lastMessageTimestamp;
    if (receiver != null){
      _data["receiver"] = receiver?.toJson();
    }
    if (sender != null) {
      _data["sender"] = sender?.toJson();
    }
    _data["timestamp"] = timestamp;
    _data["unReadMessNo"] = unReadMessNo;
    if (messages != null) {
      _data["messages"] = messages;
    }
    return _data;
  }
}