import 'package:cloud_firestore/cloud_firestore.dart';

class ChatroomModel {
  final String chatroomKey;
  final String requestId;
  final String buyerId;
  final String sellerId;
  final String? buyerName;
  final String? sellerName;
  final String lastMsg;
  final DateTime lastMsgTime;
  final String lastMsgUserKey;
  final String status;
  final DocumentReference? reference;

  ChatroomModel({
    required this.chatroomKey,
    required this.requestId,
    required this.buyerId,
    required this.sellerId,
    this.buyerName,
    this.sellerName,
    this.lastMsg = "",
    required this.lastMsgTime,
    required this.lastMsgUserKey,
    required this.status,
    this.reference,
  });

  // FromJson
  factory ChatroomModel.fromJson(Map<String, dynamic> json,
      {DocumentReference? ref}) {
    return ChatroomModel(
      chatroomKey: json['chatroomKey'] as String,
      requestId: json['requestId'] as String,
      buyerId: json['buyerId'] as String,
      sellerId: json['sellerId'] as String,
      buyerName: json['buyerName'] as String?,
      sellerName: json['sellerName'] as String?,
      lastMsg: json['lastMsg'] as String? ?? "",
      lastMsgTime: (json['lastMsgTime'] as Timestamp).toDate(),
      lastMsgUserKey: json['lastMsgUserKey'] as String,
      status: json['status'] as String,
      reference: ref,
    );
  }

  // FromSnapshot
  factory ChatroomModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ChatroomModel.fromJson(
      snapshot.data()!,
      ref: snapshot.reference,
    );
  }

  // ToMap
  Map<String, dynamic> toMap() {
    return {
      'chatroomKey': chatroomKey,
      'requestId': requestId,
      'buyerId': buyerId,
      'sellerId': sellerId,
      if (buyerName != null) 'buyerName': buyerName,
      if (sellerName != null) 'sellerName': sellerName,
      'lastMsg': lastMsg,
      'lastMsgTime': FieldValue.serverTimestamp(), // 서버 타임스탬프 사용
      'lastMsgUserKey': lastMsgUserKey,
      'status': status,
    };
  }

  // 채팅방 키 생성 유틸리티 메서드
  static String generateChatRoomKey(
      String buyerId, String sellerId, String requestId) {
    return '${buyerId}_${sellerId}_$requestId';
  }
}
