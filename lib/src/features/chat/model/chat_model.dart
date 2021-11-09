import 'dart:convert';

ChatModel chatModelFromMap(String str) => ChatModel.fromMap(json.decode(str));

String chatModelToMap(ChatModel data) => json.encode(data.toMap());

class ChatModel {
  ChatModel({
    this.name,
    this.message,
    this.time,
    this.hasUreadMessage,
    this.profilePicture,
  });

  String? name;
  String? message;
  String? time;
  bool? hasUreadMessage;
  String? profilePicture;

  ChatModel copyWith({
    String? name,
    String? message,
    String? time,
    bool? hasUreadMessage,
    String? profilePicture,
  }) =>
      ChatModel(
        name: name ?? this.name,
        message: message ?? this.message,
        time: time ?? this.time,
        hasUreadMessage: hasUreadMessage ?? this.hasUreadMessage,
        profilePicture: profilePicture ?? this.profilePicture,
      );

  factory ChatModel.fromMap(Map<String, dynamic> json) => ChatModel(
        name: json["name"],
        message: json["message"],
        time: json["time"],
        hasUreadMessage: json["hasUreadMessage"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "message": message,
        "time": time,
        "hasUreadMessage": hasUreadMessage,
        "profile_picture": profilePicture,
      };
}
