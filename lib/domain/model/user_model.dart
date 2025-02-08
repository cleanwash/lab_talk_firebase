import 'package:cloud_firestore/cloud_firestore.dart';

enum LoginType {
  email,
  google,
  kakao;

  String toJson() => name;

  static LoginType fromJson(String json) =>
      LoginType.values.firstWhere((e) => e.name == json);
}

class UserModel {
  final String? uid; //firebase 가입 uid
  final String email;
  final String? displayName; //이름
  final String? companyName; //회사명
  final String? photoURL; //마이페이지 이미지
  final bool isSeller; //개인-판매자 여부
  final LoginType? loginType;
  final DocumentReference? reference;

  UserModel({
    this.uid,
    required this.email,
    this.displayName,
    this.companyName,
    this.photoURL,
    required this.isSeller,
    this.loginType,
    this.reference,
  });

  factory UserModel.fromJson(Map<String, dynamic> json,
      {DocumentReference? ref}) {
    return UserModel(
      uid: json['uid'] as String?,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      companyName: json['companyName'] as String?,
      photoURL: json['photoURL'] as String?,
      isSeller: json['isSeller'] as bool,
      loginType: json['loginType'] != null
          ? LoginType.fromJson(json['loginType'])
          : null,
      reference: ref,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (uid != null) 'uid': uid,
      'email': email,
      if (displayName != null) 'displayName': displayName,
      if (companyName != null) 'companyName': companyName,
      if (photoURL != null) 'photoURL': photoURL,
      'isSeller': isSeller,
      if (loginType != null) 'loginType': loginType!.toJson(),
    };
  }
}
