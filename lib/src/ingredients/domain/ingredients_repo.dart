import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/ingredients/data/ingredients_repo_impl.dart';
import 'package:recipe_app/src/ingredients/domain/models/ingredient_dto.dart' show IngredientDto;

abstract class IngredientsRepository {
  Future<List<IngredientDto>> fetchIngredients();
}

final ingredientsRepositoryProvider = Provider<IngredientsRepository>((ref) {
  return IngredientsRepoImpl();
});


