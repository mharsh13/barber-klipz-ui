// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class InboxModel {
  String id;
  String user_name;
  String profile_image;
  LastMessageModel lastMessage;
  InboxModel({
    required this.id,
    required this.user_name,
    required this.profile_image,
    required this.lastMessage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_name': user_name,
      'profile_image': profile_image,
      'lastMessage': lastMessage.toMap(),
    };
  }

  factory InboxModel.fromMap(Map<String, dynamic> map) {
    return InboxModel(
      id: map['id'] as String,
      user_name: map['user_name'] as String,
      profile_image: map['profile_image'] as String,
      lastMessage:
          LastMessageModel.fromMap(map['lastMessage'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory InboxModel.fromJson(String source) =>
      InboxModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class LastMessageModel {
  String id;
  String senderId;
  String receiverId;
  String message;
  String messageType;
  String createdAt;
  bool seen;
  LastMessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.messageType,
    required this.createdAt,
    required this.seen,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'messageType': messageType,
      'createdAt': createdAt,
      'seen': seen,
    };
  }

  factory LastMessageModel.fromMap(Map<String, dynamic> map) {
    return LastMessageModel(
      id: map['id'] as String,
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      message: map['message'] as String,
      messageType: map['messageType'] as String,
      createdAt: map['createdAt'] as String,
      seen: map['seen'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LastMessageModel.fromJson(String source) =>
      LastMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
