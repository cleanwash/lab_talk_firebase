import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';
part 'register_state.g.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    @Default(false) bool isLoading,
    @Default(null) String? error,
  }) = _RegisterState;

  factory RegisterState.fromJson(Map<String, dynamic> json) =>
      _$RegisterStateFromJson(json);
}
