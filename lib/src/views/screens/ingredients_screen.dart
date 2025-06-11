import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/controllers/ingredients_controller.dart';
import 'package:recipe_app/src/models/ingredient_model.dart';
import 'package:recipe_app/src/views/widgets/add_ingredient_dialog.dart';

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
        data: (ingredients) => RefreshIndicator.adaptive(
          child: _IngredientsList(ingredients: ingredients),
          onRefresh: () async {
            // await Future.delayed(const Duration(seconds: 1));
            return await ref.refresh(ingredientsService.future);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Column(
            children: [
              Text("Error: $error"),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  // ignore: unused_result
                  ref.refresh(ingredientsService);
                },
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (_) {
            return AddIngredientDialog();
          });
        },
        tooltip: "Add Ingredient",
        child: Icon(Icons.add),
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
