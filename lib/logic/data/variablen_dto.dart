import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum/controltyp.dart';
import 'enum/datentyp.dart';

part 'variablen_dto.freezed.dart';

@unfreezed
class VariablenDto with _$VariablenDto {
  factory VariablenDto({
    required String name,
    required Controltyp controltyp,
    required Datentyp datentyp,
}) = _VariablenDto;
}