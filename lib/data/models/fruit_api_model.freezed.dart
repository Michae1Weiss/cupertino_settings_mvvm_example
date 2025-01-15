// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fruit_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FruitApiModel _$FruitApiModelFromJson(Map<String, dynamic> json) {
  return _FruitApiModel.fromJson(json);
}

/// @nodoc
mixin _$FruitApiModel {
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  /// Serializes this FruitApiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FruitApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FruitApiModelCopyWith<FruitApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FruitApiModelCopyWith<$Res> {
  factory $FruitApiModelCopyWith(
          FruitApiModel value, $Res Function(FruitApiModel) then) =
      _$FruitApiModelCopyWithImpl<$Res, FruitApiModel>;
  @useResult
  $Res call({String name, String color});
}

/// @nodoc
class _$FruitApiModelCopyWithImpl<$Res, $Val extends FruitApiModel>
    implements $FruitApiModelCopyWith<$Res> {
  _$FruitApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FruitApiModel
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
abstract class _$$FruitApiModelImplCopyWith<$Res>
    implements $FruitApiModelCopyWith<$Res> {
  factory _$$FruitApiModelImplCopyWith(
          _$FruitApiModelImpl value, $Res Function(_$FruitApiModelImpl) then) =
      __$$FruitApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String color});
}

/// @nodoc
class __$$FruitApiModelImplCopyWithImpl<$Res>
    extends _$FruitApiModelCopyWithImpl<$Res, _$FruitApiModelImpl>
    implements _$$FruitApiModelImplCopyWith<$Res> {
  __$$FruitApiModelImplCopyWithImpl(
      _$FruitApiModelImpl _value, $Res Function(_$FruitApiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FruitApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_$FruitApiModelImpl(
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
class _$FruitApiModelImpl implements _FruitApiModel {
  const _$FruitApiModelImpl({required this.name, required this.color});

  factory _$FruitApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FruitApiModelImplFromJson(json);

  @override
  final String name;
  @override
  final String color;

  @override
  String toString() {
    return 'FruitApiModel(name: $name, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FruitApiModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, color);

  /// Create a copy of FruitApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FruitApiModelImplCopyWith<_$FruitApiModelImpl> get copyWith =>
      __$$FruitApiModelImplCopyWithImpl<_$FruitApiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FruitApiModelImplToJson(
      this,
    );
  }
}

abstract class _FruitApiModel implements FruitApiModel {
  const factory _FruitApiModel(
      {required final String name,
      required final String color}) = _$FruitApiModelImpl;

  factory _FruitApiModel.fromJson(Map<String, dynamic> json) =
      _$FruitApiModelImpl.fromJson;

  @override
  String get name;
  @override
  String get color;

  /// Create a copy of FruitApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FruitApiModelImplCopyWith<_$FruitApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
