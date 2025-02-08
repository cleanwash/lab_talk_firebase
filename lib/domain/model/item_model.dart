import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  final String? requestId; // 요청 ID
  final String? buyerId; // 요청자 ID
  final String productName; // 제품명
  final String productCode; // 제품 코드
  final String manufacturer; // 제조사
  final String quantity; // 수량
  final String? volume; // 용량
  final String? description; // 추가 설명
  final DateTime? requestDate; // 요청일
  final String? status; //  상태 (대기중/견적완료/취소 등)
  final DocumentReference? reference;

  ItemModel({
    this.requestId,
    this.buyerId,
    required this.productName,
    required this.productCode,
    required this.manufacturer,
    required this.quantity,
    this.volume,
    this.description,
    this.requestDate,
    this.status,
    this.reference,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json,
      {DocumentReference? ref}) {
    return ItemModel(
      requestId: json['requestId'] as String?,
      buyerId: json['buyerId'] as String?,
      productName: json['productName'] as String,
      productCode: json['productCode'] as String,
      manufacturer: json['manufacturer'] as String,
      quantity: json['quantity'] as String,
      volume: json['volume'] as String?,
      description: json['description'] as String?,
      requestDate: json['requestDate'] != null
          ? (json['requestDate'] as Timestamp).toDate()
          : null,
      status: json['status'] as String?,
      reference: ref,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (requestId != null) 'requestId': requestId,
      if (buyerId != null) 'buyerId': buyerId,
      'productName': productName,
      'productCode': productCode,
      'manufacturer': manufacturer,
      'quantity': quantity,
      if (volume != null) 'volume': volume,
      if (description != null) 'description': description,
      if (requestDate != null) 'requestDate': Timestamp.fromDate(requestDate!),
      if (status != null) 'status': status,
    };
  }

  ItemModel copyWith({
    String? requestId,
    String? buyerId,
    String? productName,
    String? productCode,
    String? manufacturer,
    String? quantity,
    String? volume,
    String? description,
    DateTime? requestDate,
    String? status,
    DocumentReference? reference,
  }) {
    return ItemModel(
      requestId: requestId ?? this.requestId,
      buyerId: buyerId ?? this.buyerId,
      productName: productName ?? this.productName,
      productCode: productCode ?? this.productCode,
      manufacturer: manufacturer ?? this.manufacturer,
      quantity: quantity ?? this.quantity,
      volume: volume ?? this.volume,
      description: description ?? this.description,
      requestDate: requestDate ?? this.requestDate,
      status: status ?? this.status,
      reference: reference ?? this.reference,
    );
  }
}
