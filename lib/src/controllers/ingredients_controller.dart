import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/models/ingredient_dto.dart';
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

  Future<void> addIngredient(IngredientDto dto) async {
    state = const AsyncValue.loading();

    final ingredient = dto.toJson();

    try {
      final response = await _dio.post(
        "http://localhost:5143/Ingredients/add",
        data: ingredient,
      );
      final ingredientModel = IngredientModel.fromJson(response.data);
       state = AsyncValue.data([...state.value ?? [], ingredientModel]);
    } on DioException catch (dioError) {
      final statusCode = dioError.response?.statusCode;
      final data = dioError.response?.data;

      // Try to read the message from structured error body
      String errorMessage;
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        errorMessage = data['message'];
      } else {
        errorMessage = dioError.message ?? 'Unknown error occurred';
      }

      debugPrint("HTTP $statusCode Error: $errorMessage");
      state = AsyncValue.error(errorMessage, StackTrace.current);
    } catch (e, st) {
      debugPrint("Unexpected error: ${e.toString()}");
      state = AsyncValue.error(e.toString(), st);
    }

    // state = AsyncValue.data([...state.value ?? [], ingredientModel]);
  }

  int getLength() {
    return state.value?.length ?? 0;
  }
}

final ingredientsService =
    AsyncNotifierProvider<IngredientsController, List<IngredientModel>>(
      IngredientsController.new,
    );
