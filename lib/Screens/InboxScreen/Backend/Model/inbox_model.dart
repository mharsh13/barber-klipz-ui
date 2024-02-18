// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:barber_klipz_ui/Models/message_model.dart';

class InboxModel {
  String id;
  String user_name;
  String? profile_image;
  MessageModel lastMessage;
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
      profile_image:
          map['profile_image'] != null ? map['profile_image'] as String : null,
      lastMessage:
          MessageModel.fromMap(map['lastMessage'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory InboxModel.fromJson(String source) =>
      InboxModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
