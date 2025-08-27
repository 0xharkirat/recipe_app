import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_dto.freezed.dart';

part 'ingredient_dto.g.dart';

@freezed
abstract class IngredientDto with _$IngredientDto {
  const factory IngredientDto({
    required String name,
    String? pictureUrl,
    required double kilojoulesPerUnit,
    required String unitOfMeasurement,
  }) = _IngredientDto;

  factory IngredientDto.fromJson(Map<String, dynamic> json) => _$IngredientDtoFromJson(json);
}
