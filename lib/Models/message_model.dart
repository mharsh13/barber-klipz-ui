// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageModel {
  String id;
  String senderId;
  String receiverId;
  String message;
  String messageType;
  String createdAt;
  bool seen;
  MessageUser? sender;
  MessageUser? receiver;
  MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.messageType,
    required this.createdAt,
    required this.seen,
    this.sender,
    this.receiver,
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
      'sender': sender?.toMap(),
      'receiver': receiver?.toMap(),
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String,
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      message: map['message'] as String,
      messageType: map['messageType'] as String,
      createdAt: map['createdAt'] as String,
      seen: map['seen'] as bool,
      sender: map['sender'] != null
          ? MessageUser.fromMap(map['sender'] as Map<String, dynamic>)
          : null,
      receiver: map['receiver'] != null
          ? MessageUser.fromMap(map['receiver'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MessageUser {
  String id;
  String user_name;
  String? profile_image;
  MessageUser({
    required this.id,
    required this.user_name,
    required this.profile_image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_name': user_name,
      'profile_image': profile_image,
    };
  }

  factory MessageUser.fromMap(Map<String, dynamic> map) {
    return MessageUser(
      id: map['id'] as String,
      user_name: map['user_name'] as String,
      profile_image:
          map['profile_image'] != null ? map['profile_image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageUser.fromJson(String source) =>
      MessageUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
