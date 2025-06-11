import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/controllers/ingredients_controller.dart';
import 'package:recipe_app/src/models/ingredient_model.dart';

class IngredientsScreen extends ConsumerWidget {
  const IngredientsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredientsAsync = ref.watch(ingredientsService);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ingredients"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ingredientsAsync.when(
        data: (ingredients) => _IngredientsList(ingredients: ingredients),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text("Error: $error")),
      ),
    );
  }
}

class _IngredientsList extends StatelessWidget {
  final List<IngredientModel> ingredients;

  const _IngredientsList({required this.ingredients});

  @override
  Widget build(BuildContext context) {
    if (ingredients.isEmpty) {
      return const Center(child: Text("No ingredients found."));
    }

    return ListView.separated(
      itemCount: ingredients.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final ing = ingredients[index];
        return ListTile(
          leading: Text(ing.id.toString()),
          title: Text(ing.name),
          subtitle: Text("Kilojoules: ${ing.kilojoulesPerUnit}"),
          trailing: Text(ing.unitOfMeasurement),
        );
      },
    );
  }
}
