class UserModel{
  String? id;
  String? name;
  String? email;
  String? profileImage;
  String? phoneNumber;
  String? imagePath;
  String? about;
  String? createdAt;
  String? lastOnlineStatus;
  String? status;


  UserModel({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.phoneNumber,
    this.imagePath,
    this.about,
    this.createdAt,
    this.lastOnlineStatus,
    this.status
    });

  UserModel.fromJson(Map<String, dynamic> json)
  {
    id = json["id"];
    name = json["name"];
    email = json["username"];
    profileImage = json["profileImage"];
    phoneNumber = json["phoneNumber"];
    imagePath = json["imagePath"];
    about = json["about"];
    createdAt = json["createdAt"];
    lastOnlineStatus = json["lastOnlineStatus"];
    status = json["status"];
    
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["username"] = email;
    _data["profileImage"] = profileImage;
    _data["phoneNumber"] = phoneNumber;
    _data["imagePath"] = imagePath;
    _data["about"] = about;
    _data["createdAt"] = createdAt;
    _data["lastOnlineStatus"] = lastOnlineStatus;
    _data["status"] = status;
    return _data;
  }
}