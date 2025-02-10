import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_item_state.freezed.dart';
part 'create_item_state.g.dart';

@freezed
class CreateItemState with _$CreateItemState {

  factory CreateItemState({
    @Default(false) isLoading, 
    @Default(null) error,
  }) = _CreateItemState;

  factory CreateItemState.fromJson(Map<String, dynamic> json) => _$CreateItemStateFromJson(json);
}