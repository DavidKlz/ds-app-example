import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'enum/controltyp.dart';
import 'enum/datentyp.dart';

part 'variablen_dto.freezed.dart';
part 'variablen_dto.g.dart';

@unfreezed
class VariablenDto with _$VariablenDto {
  @HiveType(typeId: 2, adapterName: 'VariablenAdapter')
  factory VariablenDto({
    @HiveField(0) required String name,
    @HiveField(1) required Controltyp controltyp,
    @HiveField(2) required Datentyp datentyp,
  }) = _VariablenDto;
}
