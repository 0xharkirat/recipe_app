import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/models/ingredient_model.dart';

class IngredientsController extends AsyncNotifier<List<IngredientModel>> {
  static final _dio = Dio();
  @override
  FutureOr<List<IngredientModel>> build() async {
    return await getIngredients();
  }

  getIngredients() async {
    final response = await _dio.get("http://localhost:5143/Ingredients");
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data
          .map((ingredient) => IngredientModel.fromJson(ingredient))
          .toList();
    } else {
      throw Exception("Failed to load ingredients");
    }
  }

  Future<void> addIngredient(Map<String, dynamic> ingredient) async {

    ingredient = {
      ...ingredient,
      "id": getLength() + 1, // Simple ID generation
    };

    debugPrint("Adding ingredient: $ingredient");

    final ingredientModel = IngredientModel.fromJson(ingredient);

    state = AsyncValue.data([...state.value ?? [], ingredientModel]);

    // final response = await _dio.post(
    //   "http://localhost:5143/Ingredients",
    //   data: ingredient.toJson(),
    // );
    // if (response.statusCode == 201) {
    //   state = AsyncValue.data([...state.value ?? [], ingredient]);
    // } else {
    //   throw Exception("Failed to add ingredient");
    // }
  }

  int getLength() {
    return state.value?.length ?? 0;
  }
}

final ingredientsService =
    AsyncNotifierProvider<IngredientsController, List<IngredientModel>>(
      IngredientsController.new,
    );
