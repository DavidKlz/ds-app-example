import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'enum/controltyp.dart';
import 'enum/datentyp.dart';

part 'variable_dto.freezed.dart';

part 'variable_dto.g.dart';

@unfreezed
class VariableDto with _$VariableDto {
  @HiveType(typeId: 2, adapterName: 'VariablenAdapter')
  factory VariableDto({
    @HiveField(0) required String name,
    @HiveField(1) required Controltyp controltyp,
    @HiveField(2) required Datentyp datentyp,
    @HiveField(3) @Default("") String hint,
    @HiveField(4) @Default([]) List<String> values,
    @HiveField(5) required int row,
    @HiveField(6) required int col,
    @HiveField(7) required int colSpan,
  }) = _VariableDto;

  factory VariableDto.ofControltyp(Controltyp controltyp) => VariableDto(name: '', controltyp: controltyp, datentyp: controltyp.getDatentypen().first, row: -1, col: -1, colSpan: -1);

  factory VariableDto.ofControltypAndDatentyp(Controltyp controltyp, Datentyp datentyp) => VariableDto(name: '', controltyp: controltyp, datentyp: datentyp, row: -1, col: -1, colSpan: -1);
}
