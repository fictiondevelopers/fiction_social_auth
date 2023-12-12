// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  String? email;
  String? profilePic;
  String? name;
  String? id;

  UserData({
    this.email,
    this.profilePic,
    this.name,
    this.id,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        email: json["email"],
        profilePic: json["profile_pic"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "profile_pic": profilePic,
        "name": name,
        "id": id,
      };
}
