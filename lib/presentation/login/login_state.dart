import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';
part 'login_state.g.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isLoading,
    @Default(null) String? error,
  }) = _LoginState;

  factory LoginState.fromJson(Map<String, dynamic> json) =>
      _$LoginStateFromJson(json);
}
