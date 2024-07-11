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
  Uuid get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<VariablenDto> get variablen => throw _privateConstructorUsedError;

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
  $Res call({Uuid id, String name, List<VariablenDto> variablen});
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
    Object? id = null,
    Object? name = null,
    Object? variablen = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Uuid,
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
  $Res call({Uuid id, String name, List<VariablenDto> variablen});
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
    Object? id = null,
    Object? name = null,
    Object? variablen = null,
  }) {
    return _then(_$FormularDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Uuid,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      variablen: null == variablen
          ? _value._variablen
          : variablen // ignore: cast_nullable_to_non_nullable
              as List<VariablenDto>,
    ));
  }
}

/// @nodoc

class _$FormularDtoImpl implements _FormularDto {
  const _$FormularDtoImpl(
      {required this.id,
      required this.name,
      required final List<VariablenDto> variablen})
      : _variablen = variablen;

  @override
  final Uuid id;
  @override
  final String name;
  final List<VariablenDto> _variablen;
  @override
  List<VariablenDto> get variablen {
    if (_variablen is EqualUnmodifiableListView) return _variablen;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variablen);
  }

  @override
  String toString() {
    return 'FormularDto(id: $id, name: $name, variablen: $variablen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormularDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._variablen, _variablen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_variablen));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormularDtoImplCopyWith<_$FormularDtoImpl> get copyWith =>
      __$$FormularDtoImplCopyWithImpl<_$FormularDtoImpl>(this, _$identity);
}

abstract class _FormularDto implements FormularDto {
  const factory _FormularDto(
      {required final Uuid id,
      required final String name,
      required final List<VariablenDto> variablen}) = _$FormularDtoImpl;

  @override
  Uuid get id;
  @override
  String get name;
  @override
  List<VariablenDto> get variablen;
  @override
  @JsonKey(ignore: true)
  _$$FormularDtoImplCopyWith<_$FormularDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
