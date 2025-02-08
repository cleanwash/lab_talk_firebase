import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String? chatKey;
  final String msg;
  final DateTime createdDate;
  final String userKey;
  final DocumentReference? reference;

  ChatModel({
    this.chatKey,
    required this.msg,
    required this.createdDate,
    required this.userKey,
    this.reference,
  });

  // FromJson
  factory ChatModel.fromJson(Map<String, dynamic> json,
      {DocumentReference? ref}) {
    return ChatModel(
      chatKey: json['chatKey'] as String?,
      msg: json['msg'] as String,
      createdDate: (json['createdDate'] as Timestamp).toDate(),
      userKey: json['userKey'] as String,
      reference: ref,
    );
  }

  // FromSnapshot
  factory ChatModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ChatModel.fromJson(
      snapshot.data()!,
      ref: snapshot.reference,
    );
  }

  // ToMap
  Map<String, dynamic> toMap() {
    return {
      if (chatKey != null) 'chatKey': chatKey,
      'msg': msg,
      'createdDate': FieldValue.serverTimestamp(), // 서버 타임스탬프 사용
      'userKey': userKey,
    };
  }
}
