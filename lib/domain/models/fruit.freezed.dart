// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fruit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Fruit _$FruitFromJson(Map<String, dynamic> json) {
  return _Fruit.fromJson(json);
}

/// @nodoc
mixin _$Fruit {
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  /// Serializes this Fruit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Fruit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FruitCopyWith<Fruit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FruitCopyWith<$Res> {
  factory $FruitCopyWith(Fruit value, $Res Function(Fruit) then) =
      _$FruitCopyWithImpl<$Res, Fruit>;
  @useResult
  $Res call({String name, String color});
}

/// @nodoc
class _$FruitCopyWithImpl<$Res, $Val extends Fruit>
    implements $FruitCopyWith<$Res> {
  _$FruitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Fruit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FruitImplCopyWith<$Res> implements $FruitCopyWith<$Res> {
  factory _$$FruitImplCopyWith(
          _$FruitImpl value, $Res Function(_$FruitImpl) then) =
      __$$FruitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String color});
}

/// @nodoc
class __$$FruitImplCopyWithImpl<$Res>
    extends _$FruitCopyWithImpl<$Res, _$FruitImpl>
    implements _$$FruitImplCopyWith<$Res> {
  __$$FruitImplCopyWithImpl(
      _$FruitImpl _value, $Res Function(_$FruitImpl) _then)
      : super(_value, _then);

  /// Create a copy of Fruit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_$FruitImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FruitImpl implements _Fruit {
  const _$FruitImpl({required this.name, required this.color});

  factory _$FruitImpl.fromJson(Map<String, dynamic> json) =>
      _$$FruitImplFromJson(json);

  @override
  final String name;
  @override
  final String color;

  @override
  String toString() {
    return 'Fruit(name: $name, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FruitImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, color);

  /// Create a copy of Fruit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FruitImplCopyWith<_$FruitImpl> get copyWith =>
      __$$FruitImplCopyWithImpl<_$FruitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FruitImplToJson(
      this,
    );
  }
}

abstract class _Fruit implements Fruit {
  const factory _Fruit(
      {required final String name, required final String color}) = _$FruitImpl;

  factory _Fruit.fromJson(Map<String, dynamic> json) = _$FruitImpl.fromJson;

  @override
  String get name;
  @override
  String get color;

  /// Create a copy of Fruit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FruitImplCopyWith<_$FruitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
