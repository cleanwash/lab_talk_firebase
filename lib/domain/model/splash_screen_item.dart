import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_screen_item.freezed.dart';
part 'splash_screen_item.g.dart';

@freezed
class SplashScreenItem with _$SplashScreenItem {
  factory SplashScreenItem({
    required String title,
    required String description,
    required String image,
  }) = _SplashScreenItem;

  factory SplashScreenItem.fromJson(Map<String, dynamic> json) =>
      _$SplashScreenItemFromJson(json);
}
