import 'package:freezed_annotation/freezed_annotation.dart';

part 'fruit.freezed.dart';
part 'fruit.g.dart';

@freezed
class Fruit with _$Fruit {
  const factory Fruit({
    required String name,
    required String color,
  }) = _Fruit;

  factory Fruit.fromJson(Map<String, Object?> json) => _$FruitFromJson(json);
}
