class IngredientModel {
  final int id;
  final String name;
  final String? pictureUrl;
  final double kilojoulesPerUnit;
  final String unitOfMeasurement;

  const IngredientModel({
    required this.id,
    required this.name,
    this.pictureUrl,
    required this.kilojoulesPerUnit,
    required this.unitOfMeasurement,
  });

  @override
  String toString() {
    return "IngredientModel(id: $id, name: $name)";
  }
}


