import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'variablen_dto.dart';

part 'formular_dto.freezed.dart';

@unfreezed
class FormularDto with _$FormularDto {
  factory FormularDto({
    required String uuid,
    required String name,
    required List<VariablenDto> variablen,
}) = _FormularDto;
}