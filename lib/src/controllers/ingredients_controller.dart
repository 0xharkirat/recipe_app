import 'dart:async';

import 'package:dio/dio.dart';
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
}

final ingredientsService =
    AsyncNotifierProvider<IngredientsController, List<IngredientModel>>(
      IngredientsController.new,
    );
