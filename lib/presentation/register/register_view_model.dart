import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import 'package:lab_talk_firebase/data/data_source/email_auth.dart';
import 'package:lab_talk_firebase/domain/model/user_model.dart';
import 'package:lab_talk_firebase/presentation/register/register_state.dart';

class RegisterViewModel with ChangeNotifier {
  final EmailAuth emailAuth;

  RegisterViewModel({
    required this.emailAuth,
  });

  RegisterState _state = RegisterState();
  RegisterState get state => _state;

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      _state = state.copyWith(isLoading: true);
      notifyListeners();

      await emailAuth.signUp(
        email: email,
        password: password,
        onSuccess: () async {
          // Firebase Auth의 현재 유저 정보 가져오기
          final user = FirebaseAuth.instance.currentUser;

          if (user != null) {
            // UserModel 생성
            final userModel = UserModel(
              uid: user.uid,
              email: email,
              isSeller: false,
              loginType: LoginType.email,
            );

            await FirebaseFirestore.instance
                .collection('users') //collection을 users로 선택
                .doc(user.uid) //문서 id를 user의 uid로 지정
                .set(userModel.toMap());
          }

          _state = state.copyWith(
            isLoading: false,
            error: null,
            isSuccess: true,
          );
          notifyListeners();
        },
        onError: (error) {
          _state = state.copyWith(
            isLoading: false,
            error: error,
            isSuccess: false,
          );
          notifyListeners();
        },
      );
    } catch (e) {
      _state = state.copyWith(
        isLoading: false,
        error: e.toString(),
        isSuccess: false,
      );
      notifyListeners();
    }
  }
}
