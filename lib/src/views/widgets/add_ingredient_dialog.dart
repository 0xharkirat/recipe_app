import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/controllers/ingredients_controller.dart';

class AddIngredientDialog extends ConsumerStatefulWidget {
  const AddIngredientDialog({super.key});

  @override
  ConsumerState<AddIngredientDialog> createState() => _AddIngredientDialogState();
}

class _AddIngredientDialogState extends ConsumerState<AddIngredientDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  final TextEditingController _kjPUcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  UnitOfMeasurement _selectedUnit = UnitOfMeasurement.g;

  void onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      // Here you would typically save the ingredient to your database or state management solution
      final name = _nameController.text;
      final imageUrl = _urlController.text;
      final kjPerUnit = _kjPUcontroller.text;

      // create a new ingredient object
      final newIngredient = {
        'name': name,
        'imageUrl': imageUrl.isNotEmpty ? imageUrl : null,
        'kilojoulesPerUnit': double.tryParse(kjPerUnit) ?? 0.0,
        'unitOfMeasurement': _selectedUnit.name,
      };

      ref.read(ingredientsService.notifier).addIngredient(newIngredient);



      // Navigator.of(context).pop(); // Close the dialog
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _urlController.dispose();
    _kjPUcontroller.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16.0,
          children: [
            Text(
              "Add Ingredient",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingredient name cannot be empty";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _urlController,
                    decoration: const InputDecoration(labelText: "Image URL"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
                      }
                      // A simple URL validation using regex
                      final urlPattern =
                          r'^(https:\/\/)([\w-]+(\.[\w-]+)+)(\/[\w- .\/?%&=]*)?$';
                      final isValidUrl = RegExp(urlPattern).hasMatch(value);
                      if (!isValidUrl) {
                        return "Must be a valid URL (https://example.com)";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _kjPUcontroller,

                    decoration: const InputDecoration(
                      labelText: "Kilojoules per unit",
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d*'),
                      ),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter KJ per unit";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            DropdownButtonFormField<UnitOfMeasurement>(
              decoration: InputDecoration(labelText: 'Unit of Measurement'),
              items: UnitOfMeasurement.values
                  .map(
                    (unit) => DropdownMenuItem(
                      value: unit,
                      child: Text("${unit.fullName} (${unit.name})"),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                // Save value
                if (value != null) {
                  _selectedUnit = value;
                }
              },
              validator: (value) =>
                  value == null ? 'Please select a unit' : null,
            ),

            ElevatedButton(
              onPressed: () => onSave(),
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}

enum UnitOfMeasurement {
  g("Grams"),
  kg("Kilograms"),
  ml("Milliliters"),
  L("Liters"),
  pcs("Pieces"),
  tbsp("Tablespoons"),
  tsp("Teaspoons"),
  cup("Cups");

  final String fullName;
  const UnitOfMeasurement(this.fullName);
}
