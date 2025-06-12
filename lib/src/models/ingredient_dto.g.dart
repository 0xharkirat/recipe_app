// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientDto _$IngredientDtoFromJson(Map<String, dynamic> json) =>
    _IngredientDto(
      name: json['name'] as String,
      pictureUrl: json['pictureUrl'] as String?,
      kilojoulesPerUnit: (json['kilojoulesPerUnit'] as num).toDouble(),
      unitOfMeasurement: json['unitOfMeasurement'] as String,
    );

Map<String, dynamic> _$IngredientDtoToJson(_IngredientDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pictureUrl': instance.pictureUrl,
      'kilojoulesPerUnit': instance.kilojoulesPerUnit,
      'unitOfMeasurement': instance.unitOfMeasurement,
    };
