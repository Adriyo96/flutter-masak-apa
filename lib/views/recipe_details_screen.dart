import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(recipe.image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Source: ${recipe.source}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Servings: ${recipe.servings.toInt()}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Total Time: ${recipe.totalTime.toInt()} mins',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Additional Information:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Diet Labels: ${recipe.dietLabels.join(", ")}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Health Labels: ${recipe.healthLabels.join(", ")}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Cautions: ${recipe.cautions.join(", ")}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Calories: ${recipe.calories.toInt()}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Cuisine Type: ${recipe.cuisineType.join(", ")}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Meal Type: ${recipe.mealType.join(", ")}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Dish Type: ${recipe.dishType.join(", ")}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Ingredients:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.ingredientLines.map((ingredient) => Text('- $ingredient',
                      style: const TextStyle(fontSize: 16.0),
                    )).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
