// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variablen_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VariablenDto {
  String get name => throw _privateConstructorUsedError;
  Controltyp get controltyp => throw _privateConstructorUsedError;
  Datentyp get datentyp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VariablenDtoCopyWith<VariablenDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariablenDtoCopyWith<$Res> {
  factory $VariablenDtoCopyWith(
          VariablenDto value, $Res Function(VariablenDto) then) =
      _$VariablenDtoCopyWithImpl<$Res, VariablenDto>;
  @useResult
  $Res call({String name, Controltyp controltyp, Datentyp datentyp});
}

/// @nodoc
class _$VariablenDtoCopyWithImpl<$Res, $Val extends VariablenDto>
    implements $VariablenDtoCopyWith<$Res> {
  _$VariablenDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? controltyp = null,
    Object? datentyp = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      controltyp: null == controltyp
          ? _value.controltyp
          : controltyp // ignore: cast_nullable_to_non_nullable
              as Controltyp,
      datentyp: null == datentyp
          ? _value.datentyp
          : datentyp // ignore: cast_nullable_to_non_nullable
              as Datentyp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariablenDtoImplCopyWith<$Res>
    implements $VariablenDtoCopyWith<$Res> {
  factory _$$VariablenDtoImplCopyWith(
          _$VariablenDtoImpl value, $Res Function(_$VariablenDtoImpl) then) =
      __$$VariablenDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Controltyp controltyp, Datentyp datentyp});
}

/// @nodoc
class __$$VariablenDtoImplCopyWithImpl<$Res>
    extends _$VariablenDtoCopyWithImpl<$Res, _$VariablenDtoImpl>
    implements _$$VariablenDtoImplCopyWith<$Res> {
  __$$VariablenDtoImplCopyWithImpl(
      _$VariablenDtoImpl _value, $Res Function(_$VariablenDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? controltyp = null,
    Object? datentyp = null,
  }) {
    return _then(_$VariablenDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      controltyp: null == controltyp
          ? _value.controltyp
          : controltyp // ignore: cast_nullable_to_non_nullable
              as Controltyp,
      datentyp: null == datentyp
          ? _value.datentyp
          : datentyp // ignore: cast_nullable_to_non_nullable
              as Datentyp,
    ));
  }
}

/// @nodoc

class _$VariablenDtoImpl implements _VariablenDto {
  const _$VariablenDtoImpl(
      {required this.name, required this.controltyp, required this.datentyp});

  @override
  final String name;
  @override
  final Controltyp controltyp;
  @override
  final Datentyp datentyp;

  @override
  String toString() {
    return 'VariablenDto(name: $name, controltyp: $controltyp, datentyp: $datentyp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariablenDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.controltyp, controltyp) ||
                other.controltyp == controltyp) &&
            (identical(other.datentyp, datentyp) ||
                other.datentyp == datentyp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, controltyp, datentyp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VariablenDtoImplCopyWith<_$VariablenDtoImpl> get copyWith =>
      __$$VariablenDtoImplCopyWithImpl<_$VariablenDtoImpl>(this, _$identity);
}

abstract class _VariablenDto implements VariablenDto {
  const factory _VariablenDto(
      {required final String name,
      required final Controltyp controltyp,
      required final Datentyp datentyp}) = _$VariablenDtoImpl;

  @override
  String get name;
  @override
  Controltyp get controltyp;
  @override
  Datentyp get datentyp;
  @override
  @JsonKey(ignore: true)
  _$$VariablenDtoImplCopyWith<_$VariablenDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
