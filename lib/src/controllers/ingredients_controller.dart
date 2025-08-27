import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/models/ingredient_dto.dart';
import 'package:recipe_app/src/models/ingredient_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IngredientsController extends AsyncNotifier<List<IngredientModel>> {
  @override
  FutureOr<List<IngredientModel>> build() async {
    return await getIngredients();
  }

  getIngredients() async {
    try {
      final response = await http.get(
        Uri.parse("https://127.0.0.1:7238/Ingredients"),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print("Fetched ingredients: $data");
        return data
            .map((ingredient) => IngredientModel.fromJson(ingredient))
            .toList();
      } else {
        throw Exception("Failed to load ingredients");
      }
    } on Exception catch (e) {
      debugPrint("Error fetching ingredients: $e");
    }
  }

  // state = AsyncValue.data([...state.value ?? [], ingredientModel]);
}

final ingredientsService =
    AsyncNotifierProvider<IngredientsController, List<IngredientModel>>(
      IngredientsController.new,
    );
