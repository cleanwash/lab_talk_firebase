import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lab_talk_firebase/domain/model/item_model.dart';
import 'package:lab_talk_firebase/presentation/create_item/create_item_state.dart';

class CreateItemViewModel with ChangeNotifier {
  CreateItemState _state = CreateItemState();

  CreateItemState get state => _state;

  Future<bool> submitForm({
    required String productName,
    required String productCode,
    required String manufacturer,
    required String quantity,
    String? volume,
    String? description,
  }) async {
    _state = _state.copyWith(isLoading: true, error: null);
    notifyListeners();

    try {
      final item = ItemModel(
        productName: productName,
        productCode: productCode,
        manufacturer: manufacturer,
        quantity: quantity,
        volume: volume,
        description: description,
        requestDate: DateTime.now(),
        status: '대기중',
      );

      await FirebaseFirestore.instance.collection('items').add(item.toMap());

      _state = _state.copyWith(isLoading: false);
      notifyListeners();
      return true;
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        error: '등록 중 오류가 발생했습니다',
      );
      notifyListeners();
      return false;
    }
  }
}
