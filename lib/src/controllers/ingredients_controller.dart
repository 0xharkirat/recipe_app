import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/models/ingredient_model.dart';

class IngredientsController extends Notifier<List<IngredientModel>> {
  static final List<IngredientModel> _mockIngredients = [
    IngredientModel(
      id: 1,
      name: 'Black Bean',
      pictureUrl: null,
      kilojoulesPerUnit: 14.27,
      unitOfMeasurement: 'g',
    ),
    IngredientModel(
      id: 2,
      name: 'Chicken Broth',
      pictureUrl: null,
      kilojoulesPerUnit: 1.51,
      unitOfMeasurement: 'ml',
    ),
    IngredientModel(
      id: 3,
      name: 'Beef',
      pictureUrl: null,
      kilojoulesPerUnit: 6.28,
      unitOfMeasurement: 'g',
    ),
    IngredientModel(
      id: 4,
      name: 'Cauliflower',
      pictureUrl: null,
      kilojoulesPerUnit: 1.05,
      unitOfMeasurement: 'g',
    ),
    IngredientModel(
      id: 5,
      name: 'Salt',
      pictureUrl: null,
      kilojoulesPerUnit: 0,
      unitOfMeasurement: 'g',
    ),
    IngredientModel(
      id: 6,
      name: 'Olive Oil',
      pictureUrl: null,
      kilojoulesPerUnit: 36.99,
      unitOfMeasurement: 'ml',
    ),
    IngredientModel(
      id: 7,
      name: 'Tomato',
      pictureUrl: null,
      kilojoulesPerUnit: 0.75,
      unitOfMeasurement: 'g',
    ),
    IngredientModel(
      id: 8,
      name: 'Garlic',
      pictureUrl: null,
      kilojoulesPerUnit: 6.23,
      unitOfMeasurement: 'g',
    ),
    IngredientModel(
      id: 9,
      name: 'Pepper',
      pictureUrl: null,
      kilojoulesPerUnit: 10.67,
      unitOfMeasurement: 'g',
    ),
    IngredientModel(
      id: 10,
      name: 'Onion',
      pictureUrl: null,
      kilojoulesPerUnit: 1.76,
      unitOfMeasurement: 'g',
    ),
  ];

  @override
  List<IngredientModel> build() {
    return _mockIngredients;
  }
}

final ingredientsService =
    NotifierProvider<IngredientsController, List<IngredientModel>>(
      IngredientsController.new,
    );
