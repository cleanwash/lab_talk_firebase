// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  Future<void> signUp() async {
    try {
      _state = state.copyWith(isLoading: true);
      notifyListeners();
    } catch (e) {}
  }
}
