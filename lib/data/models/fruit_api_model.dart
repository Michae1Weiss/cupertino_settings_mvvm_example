import 'package:freezed_annotation/freezed_annotation.dart';

part 'fruit_api_model.freezed.dart';
part 'fruit_api_model.g.dart';

@freezed
class FruitApiModel with _$FruitApiModel {
  const factory FruitApiModel({
    required String name,
    required String color,
  }) = _FruitApiModel;

  factory FruitApiModel.fromJson(Map<String, Object?> json) =>
      _$FruitApiModelFromJson(json);
}
