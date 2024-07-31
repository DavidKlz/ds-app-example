// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formular_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormularDto {
  @HiveField(0)
  String get uuid => throw _privateConstructorUsedError;
  @HiveField(0)
  set uuid(String value) => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  set name(String value) => throw _privateConstructorUsedError;
  @HiveField(2)
  List<VariablenDto> get variablen => throw _privateConstructorUsedError;
  @HiveField(2)
  set variablen(List<VariablenDto> value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormularDtoCopyWith<FormularDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormularDtoCopyWith<$Res> {
  factory $FormularDtoCopyWith(
          FormularDto value, $Res Function(FormularDto) then) =
      _$FormularDtoCopyWithImpl<$Res, FormularDto>;
  @useResult
  $Res call(
      {@HiveField(0) String uuid,
      @HiveField(1) String name,
      @HiveField(2) List<VariablenDto> variablen});
}

/// @nodoc
class _$FormularDtoCopyWithImpl<$Res, $Val extends FormularDto>
    implements $FormularDtoCopyWith<$Res> {
  _$FormularDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? variablen = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      variablen: null == variablen
          ? _value.variablen
          : variablen // ignore: cast_nullable_to_non_nullable
              as List<VariablenDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormularDtoImplCopyWith<$Res>
    implements $FormularDtoCopyWith<$Res> {
  factory _$$FormularDtoImplCopyWith(
          _$FormularDtoImpl value, $Res Function(_$FormularDtoImpl) then) =
      __$$FormularDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String uuid,
      @HiveField(1) String name,
      @HiveField(2) List<VariablenDto> variablen});
}

/// @nodoc
class __$$FormularDtoImplCopyWithImpl<$Res>
    extends _$FormularDtoCopyWithImpl<$Res, _$FormularDtoImpl>
    implements _$$FormularDtoImplCopyWith<$Res> {
  __$$FormularDtoImplCopyWithImpl(
      _$FormularDtoImpl _value, $Res Function(_$FormularDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? variablen = null,
  }) {
    return _then(_$FormularDtoImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      variablen: null == variablen
          ? _value.variablen
          : variablen // ignore: cast_nullable_to_non_nullable
              as List<VariablenDto>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: 'FormularAdapter')
class _$FormularDtoImpl implements _FormularDto {
  _$FormularDtoImpl(
      {@HiveField(0) required this.uuid,
      @HiveField(1) required this.name,
      @HiveField(2) required this.variablen});

  @override
  @HiveField(0)
  String uuid;
  @override
  @HiveField(1)
  String name;
  @override
  @HiveField(2)
  List<VariablenDto> variablen;

  @override
  String toString() {
    return 'FormularDto(uuid: $uuid, name: $name, variablen: $variablen)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormularDtoImplCopyWith<_$FormularDtoImpl> get copyWith =>
      __$$FormularDtoImplCopyWithImpl<_$FormularDtoImpl>(this, _$identity);
}

abstract class _FormularDto implements FormularDto {
  factory _FormularDto(
      {@HiveField(0) required String uuid,
      @HiveField(1) required String name,
      @HiveField(2) required List<VariablenDto> variablen}) = _$FormularDtoImpl;

  @override
  @HiveField(0)
  String get uuid;
  @HiveField(0)
  set uuid(String value);
  @override
  @HiveField(1)
  String get name;
  @HiveField(1)
  set name(String value);
  @override
  @HiveField(2)
  List<VariablenDto> get variablen;
  @HiveField(2)
  set variablen(List<VariablenDto> value);
  @override
  @JsonKey(ignore: true)
  _$$FormularDtoImplCopyWith<_$FormularDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
