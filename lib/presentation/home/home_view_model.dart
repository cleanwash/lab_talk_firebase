import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:lab_talk_firebase/domain/model/item_model.dart';
import 'package:lab_talk_firebase/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final HomeState _state = HomeState();

  HomeState get state => _state;

  // Future<void> fetchItems() async {
  //   _state = state.copyWith(isLoading: true);
  //   notifyListeners();

  //   try {
  //     final querySnapshot =
  //         await FirebaseFirestore.instance.collection('items').get();
  //     final items =
  //         querySnapshot.docs.map((doc) => ItemModel.fromSnapshot(doc)).toList();

  //     _state = state.copyWith(
  //       isLoading: false,
  //       items: items,
  //     );
  //   } catch (e) {
  //     _state = state.copyWith(isLoading: false);
  //     // 에러 처리 로직 추가
  //   }

  //   notifyListeners();
  // }
}
