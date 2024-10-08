import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'variable_dto.dart';

part 'formular_dto.freezed.dart';

part 'formular_dto.g.dart';

@unfreezed
class FormularDto with _$FormularDto {
  @HiveType(typeId: 1, adapterName: 'FormularAdapter')
  factory FormularDto({
    @HiveField(0) required String uuid,
    @HiveField(1) required String name,
    @HiveField(2) required List<VariableDto> variablen,
    @HiveField(3) @Default("") String description,
  }) = _FormularDto;
}
