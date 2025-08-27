import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/ingredients/presentation/providers/ingredients_provider.dart';

class IngredientsScreen extends ConsumerWidget {
  const IngredientsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncIngredients = ref.watch(fetchIngredientsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Ingredients")),
      body: asyncIngredients.when(
        data: (ingredients) => RefreshIndicator.adaptive(
          child: ListView.builder(
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = ingredients[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child:
                      ingredient.pictureUrl == null ||
                          ingredient.pictureUrl!.isEmpty
                      ? const Icon(Icons.food_bank)
                      : ClipOval(
                          child: Image.network(
                            ingredient.pictureUrl!,
                            fit: BoxFit.cover,
                            width: 40,
                            height: 40,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.food_bank),
                          ),
                        ),
                ),
                title: Text(ingredient.name),
                subtitle: Text("Kilojoules: ${ingredient.kilojoulesPerUnit}"),
                trailing: Text(ingredient.unitOfMeasurement),
              );
            },
          ),
          onRefresh: () async {
            return ref.refresh(fetchIngredientsProvider);
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
                  ref.invalidate(fetchIngredientsProvider);
                },
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        tooltip: "Add Ingredient",
        child: Icon(Icons.add),
      ),
    );
  }
}
