import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/src/constants/constants.dart';
import 'package:recipe_app/src/ingredients/domain/ingredients_repo.dart';
import 'package:recipe_app/src/ingredients/domain/models/ingredient_dto.dart';


class IngredientsRepoImpl implements IngredientsRepository {
  @override
  Future<List<IngredientDto>> fetchIngredients() async {
    final response = await http.get(
      Uri.parse('${Constants.apiUrl}/Ingredients'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => IngredientDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load ingredients');
    }
  }
}
