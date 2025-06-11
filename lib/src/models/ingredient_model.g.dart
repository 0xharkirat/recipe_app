// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) =>
    _IngredientModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      pictureUrl: json['pictureUrl'] as String?,
      kilojoulesPerUnit: (json['kilojoulesPerUnit'] as num).toDouble(),
      unitOfMeasurement: json['unitOfMeasurement'] as String,
    );

Map<String, dynamic> _$IngredientModelToJson(_IngredientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pictureUrl': instance.pictureUrl,
      'kilojoulesPerUnit': instance.kilojoulesPerUnit,
      'unitOfMeasurement': instance.unitOfMeasurement,
    };
