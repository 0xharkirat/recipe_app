import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/controllers/ingredients_controller.dart';

class IngredientsScreen extends ConsumerWidget {
  const IngredientsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredientsController = ref.watch(ingredientsService);

    return Scaffold(
      appBar: AppBar(
        title: Text("Ingredients Screen"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView.separated(
        separatorBuilder: (_, _) => Divider(),
        itemCount: ingredientsController.length,
        itemBuilder: (_, index) {
          final ing = ingredientsController[index];
          return ListTile(
            title: Text(ing.name),
            leading: Text(ing.id.toString()),
            subtitle: Text("Kilojoules Per Unit: ${ing.kilojoulesPerUnit}"),
            trailing: Text(ing.unitOfMeasurement),
          );
        },
      ),
    );
  }
}
