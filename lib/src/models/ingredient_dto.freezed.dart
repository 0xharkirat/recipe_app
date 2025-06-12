// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngredientDto {

 String get name; String? get pictureUrl; double get kilojoulesPerUnit; String get unitOfMeasurement;
/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientDtoCopyWith<IngredientDto> get copyWith => _$IngredientDtoCopyWithImpl<IngredientDto>(this as IngredientDto, _$identity);

  /// Serializes this IngredientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientDto&&(identical(other.name, name) || other.name == name)&&(identical(other.pictureUrl, pictureUrl) || other.pictureUrl == pictureUrl)&&(identical(other.kilojoulesPerUnit, kilojoulesPerUnit) || other.kilojoulesPerUnit == kilojoulesPerUnit)&&(identical(other.unitOfMeasurement, unitOfMeasurement) || other.unitOfMeasurement == unitOfMeasurement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pictureUrl,kilojoulesPerUnit,unitOfMeasurement);

@override
String toString() {
  return 'IngredientDto(name: $name, pictureUrl: $pictureUrl, kilojoulesPerUnit: $kilojoulesPerUnit, unitOfMeasurement: $unitOfMeasurement)';
}


}

/// @nodoc
abstract mixin class $IngredientDtoCopyWith<$Res>  {
  factory $IngredientDtoCopyWith(IngredientDto value, $Res Function(IngredientDto) _then) = _$IngredientDtoCopyWithImpl;
@useResult
$Res call({
 String name, String? pictureUrl, double kilojoulesPerUnit, String unitOfMeasurement
});




}
/// @nodoc
class _$IngredientDtoCopyWithImpl<$Res>
    implements $IngredientDtoCopyWith<$Res> {
  _$IngredientDtoCopyWithImpl(this._self, this._then);

  final IngredientDto _self;
  final $Res Function(IngredientDto) _then;

/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pictureUrl = freezed,Object? kilojoulesPerUnit = null,Object? unitOfMeasurement = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pictureUrl: freezed == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String?,kilojoulesPerUnit: null == kilojoulesPerUnit ? _self.kilojoulesPerUnit : kilojoulesPerUnit // ignore: cast_nullable_to_non_nullable
as double,unitOfMeasurement: null == unitOfMeasurement ? _self.unitOfMeasurement : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IngredientDto implements IngredientDto {
  const _IngredientDto({required this.name, this.pictureUrl, required this.kilojoulesPerUnit, required this.unitOfMeasurement});
  factory _IngredientDto.fromJson(Map<String, dynamic> json) => _$IngredientDtoFromJson(json);

@override final  String name;
@override final  String? pictureUrl;
@override final  double kilojoulesPerUnit;
@override final  String unitOfMeasurement;

/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientDtoCopyWith<_IngredientDto> get copyWith => __$IngredientDtoCopyWithImpl<_IngredientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientDto&&(identical(other.name, name) || other.name == name)&&(identical(other.pictureUrl, pictureUrl) || other.pictureUrl == pictureUrl)&&(identical(other.kilojoulesPerUnit, kilojoulesPerUnit) || other.kilojoulesPerUnit == kilojoulesPerUnit)&&(identical(other.unitOfMeasurement, unitOfMeasurement) || other.unitOfMeasurement == unitOfMeasurement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pictureUrl,kilojoulesPerUnit,unitOfMeasurement);

@override
String toString() {
  return 'IngredientDto(name: $name, pictureUrl: $pictureUrl, kilojoulesPerUnit: $kilojoulesPerUnit, unitOfMeasurement: $unitOfMeasurement)';
}


}

/// @nodoc
abstract mixin class _$IngredientDtoCopyWith<$Res> implements $IngredientDtoCopyWith<$Res> {
  factory _$IngredientDtoCopyWith(_IngredientDto value, $Res Function(_IngredientDto) _then) = __$IngredientDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String? pictureUrl, double kilojoulesPerUnit, String unitOfMeasurement
});




}
/// @nodoc
class __$IngredientDtoCopyWithImpl<$Res>
    implements _$IngredientDtoCopyWith<$Res> {
  __$IngredientDtoCopyWithImpl(this._self, this._then);

  final _IngredientDto _self;
  final $Res Function(_IngredientDto) _then;

/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? pictureUrl = freezed,Object? kilojoulesPerUnit = null,Object? unitOfMeasurement = null,}) {
  return _then(_IngredientDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pictureUrl: freezed == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String?,kilojoulesPerUnit: null == kilojoulesPerUnit ? _self.kilojoulesPerUnit : kilojoulesPerUnit // ignore: cast_nullable_to_non_nullable
as double,unitOfMeasurement: null == unitOfMeasurement ? _self.unitOfMeasurement : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
