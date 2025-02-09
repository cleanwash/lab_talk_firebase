import 'package:flutter/widgets.dart';

import 'package:lab_talk_firebase/data/data_source/email_auth.dart';
import 'package:lab_talk_firebase/presentation/register/register_state.dart';

class RegisterViewModel with ChangeNotifier {
  EmailAuth emailAuth;
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
        onSuccess: () {
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
