import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum/controltyp.dart';
import 'enum/datentyp.dart';

part 'variablen_dto.freezed.dart';

@freezed
class VariablenDto with _$VariablenDto {
  const factory VariablenDto({
    required String name,
    required Controltyp controltyp,
    required Datentyp datentyp,
}) = _VariablenDto;
}