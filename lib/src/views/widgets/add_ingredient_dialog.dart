import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/src/controllers/ingredients_controller.dart';

class AddIngredientDialog extends ConsumerStatefulWidget {
  const AddIngredientDialog({super.key});

  @override
  ConsumerState<AddIngredientDialog> createState() =>
      _AddIngredientDialogState();
}

class _AddIngredientDialogState extends ConsumerState<AddIngredientDialog> {
  static const placeholderImage =
      "https://placehold.co/250/png?text=Preview+Image";
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
    final size = MediaQuery.of(context).size;
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Ingredient"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16.0,
              children: [
                Builder(
                  builder: (context) {
                    final imageUrl = _urlController.text.trim();

                    return Image.network(
                      (imageUrl.isEmpty) ? placeholderImage : imageUrl,
                      height: size.width * 0.5,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Always show the placeholder image if error occurs
                        return Image.network(
                          placeholderImage,
                          height: size.width * 0.5,
                          fit: BoxFit.cover,
                        );
                      },
                    );
                  },
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
                        decoration: const InputDecoration(
                          labelText: "Image URL",
                        ),
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
