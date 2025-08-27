import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/ingredients/domain/ingredients_repo.dart';
import 'package:recipe_app/src/ingredients/domain/models/ingredient_dto.dart';


final fetchIngredientsProvider = FutureProvider<List<IngredientDto>>((ref) async {
  final repo = ref.watch(ingredientsRepositoryProvider);
  return repo.fetchIngredients();
});
