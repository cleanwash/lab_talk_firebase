import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  final String? requestId;
  final String? buyerId;
  final String productName;
  final String productCode;
  final String manufacturer;
  final String quantity;
  final String? volume;
  final String? description;
  final DateTime? requestDate;
  final String? status;
  final String? imageUrl; // 추가
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
    this.imageUrl, // 추가
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
      imageUrl: json['imageUrl'] as String?, // 추가
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
      if (imageUrl != null) 'imageUrl': imageUrl, // 추가
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
    String? imageUrl, // 추가
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
      imageUrl: imageUrl ?? this.imageUrl, // 추가
      reference: reference ?? this.reference,
    );
  }
}
