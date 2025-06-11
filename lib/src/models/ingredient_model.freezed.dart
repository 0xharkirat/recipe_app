// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngredientModel {

 int get id; String get name; String? get pictureUrl; double get kilojoulesPerUnit; String get unitOfMeasurement;
/// Create a copy of IngredientModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientModelCopyWith<IngredientModel> get copyWith => _$IngredientModelCopyWithImpl<IngredientModel>(this as IngredientModel, _$identity);

  /// Serializes this IngredientModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.pictureUrl, pictureUrl) || other.pictureUrl == pictureUrl)&&(identical(other.kilojoulesPerUnit, kilojoulesPerUnit) || other.kilojoulesPerUnit == kilojoulesPerUnit)&&(identical(other.unitOfMeasurement, unitOfMeasurement) || other.unitOfMeasurement == unitOfMeasurement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,pictureUrl,kilojoulesPerUnit,unitOfMeasurement);

@override
String toString() {
  return 'IngredientModel(id: $id, name: $name, pictureUrl: $pictureUrl, kilojoulesPerUnit: $kilojoulesPerUnit, unitOfMeasurement: $unitOfMeasurement)';
}


}

/// @nodoc
abstract mixin class $IngredientModelCopyWith<$Res>  {
  factory $IngredientModelCopyWith(IngredientModel value, $Res Function(IngredientModel) _then) = _$IngredientModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? pictureUrl, double kilojoulesPerUnit, String unitOfMeasurement
});




}
/// @nodoc
class _$IngredientModelCopyWithImpl<$Res>
    implements $IngredientModelCopyWith<$Res> {
  _$IngredientModelCopyWithImpl(this._self, this._then);

  final IngredientModel _self;
  final $Res Function(IngredientModel) _then;

/// Create a copy of IngredientModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? pictureUrl = freezed,Object? kilojoulesPerUnit = null,Object? unitOfMeasurement = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pictureUrl: freezed == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String?,kilojoulesPerUnit: null == kilojoulesPerUnit ? _self.kilojoulesPerUnit : kilojoulesPerUnit // ignore: cast_nullable_to_non_nullable
as double,unitOfMeasurement: null == unitOfMeasurement ? _self.unitOfMeasurement : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IngredientModel implements IngredientModel {
  const _IngredientModel({required this.id, required this.name, this.pictureUrl, required this.kilojoulesPerUnit, required this.unitOfMeasurement});
  factory _IngredientModel.fromJson(Map<String, dynamic> json) => _$IngredientModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? pictureUrl;
@override final  double kilojoulesPerUnit;
@override final  String unitOfMeasurement;

/// Create a copy of IngredientModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientModelCopyWith<_IngredientModel> get copyWith => __$IngredientModelCopyWithImpl<_IngredientModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.pictureUrl, pictureUrl) || other.pictureUrl == pictureUrl)&&(identical(other.kilojoulesPerUnit, kilojoulesPerUnit) || other.kilojoulesPerUnit == kilojoulesPerUnit)&&(identical(other.unitOfMeasurement, unitOfMeasurement) || other.unitOfMeasurement == unitOfMeasurement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,pictureUrl,kilojoulesPerUnit,unitOfMeasurement);

@override
String toString() {
  return 'IngredientModel(id: $id, name: $name, pictureUrl: $pictureUrl, kilojoulesPerUnit: $kilojoulesPerUnit, unitOfMeasurement: $unitOfMeasurement)';
}


}

/// @nodoc
abstract mixin class _$IngredientModelCopyWith<$Res> implements $IngredientModelCopyWith<$Res> {
  factory _$IngredientModelCopyWith(_IngredientModel value, $Res Function(_IngredientModel) _then) = __$IngredientModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? pictureUrl, double kilojoulesPerUnit, String unitOfMeasurement
});




}
/// @nodoc
class __$IngredientModelCopyWithImpl<$Res>
    implements _$IngredientModelCopyWith<$Res> {
  __$IngredientModelCopyWithImpl(this._self, this._then);

  final _IngredientModel _self;
  final $Res Function(_IngredientModel) _then;

/// Create a copy of IngredientModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? pictureUrl = freezed,Object? kilojoulesPerUnit = null,Object? unitOfMeasurement = null,}) {
  return _then(_IngredientModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pictureUrl: freezed == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String?,kilojoulesPerUnit: null == kilojoulesPerUnit ? _self.kilojoulesPerUnit : kilojoulesPerUnit // ignore: cast_nullable_to_non_nullable
as double,unitOfMeasurement: null == unitOfMeasurement ? _self.unitOfMeasurement : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
