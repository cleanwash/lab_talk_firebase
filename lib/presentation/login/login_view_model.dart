import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab_talk_firebase/data/data_source/email_auth.dart';
import 'package:lab_talk_firebase/data/data_source/google_auth.dart';
import 'package:lab_talk_firebase/data/data_source/kakao_auth.dart';
import 'package:lab_talk_firebase/presentation/login/login_state.dart';

class LoginViewModel with ChangeNotifier {
  final GoogleAuth googleAuth;
  final KakaoAuth kakaoAuth;
  final EmailAuth emailAuth;

  LoginViewModel({
    required this.googleAuth,
    required this.kakaoAuth,
    required this.emailAuth,
  });

  LoginState _state = LoginState();
  LoginState get state => _state;

  User? _user;
  User? get user => _user;

  Future<void> signInWithGoogle() async {
    try {
      _state = state.copyWith(isLoading: true);
      notifyListeners();

      final userCredential = await googleAuth.signInWithGoogle();
      _user = userCredential.user;

      _state = state.copyWith(
        isLoading: false,
        error: null,
      );
      notifyListeners();
    } catch (e) {
      _state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      _user = null;
      notifyListeners();
    }
  }

  Future<void> signInWithKakao() async {
    try {
      _state = state.copyWith(isLoading: true);
      notifyListeners();

      final userCredential = await kakaoAuth.signInWithKakao();
      _user = userCredential.user;

      _state = state.copyWith(
        isLoading: false,
        error: null,
      );
      notifyListeners();
    } catch (e) {
      _state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      _user = null;
      notifyListeners();
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      _state = state.copyWith(isLoading: true);
      notifyListeners();

      await emailAuth.signIn(
        email: email,
        password: password,
        onSuccess: () {
          _user = emailAuth.currentUser();
          _state = state.copyWith(
            isLoading: false,
            error: null,
          );
          notifyListeners();
        },
        onError: (error) {
          _user = null;
          _state = state.copyWith(
            isLoading: false,
            error: error,
          );
          notifyListeners();
        },
      );
    } catch (e) {
      _user = null;
      _state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      _state = state.copyWith(isLoading: true);
      notifyListeners();

      await emailAuth.signOut();
      _user = null;

      _state = state.copyWith(
        isLoading: false,
        error: null,
      );
      notifyListeners();
    } catch (e) {
      _state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      notifyListeners();
    }
  }
}
