import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'variablen_dto.dart';

part 'formular_dto.freezed.dart';

@freezed
class FormularDto with _$FormularDto {
  const factory FormularDto({
    required Uuid id,
    required String name,
    required List<VariablenDto> variablen,
}) = _FormularDto;
}