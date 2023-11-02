import 'package:masak_apa/models/recipe.dart';

class MockAPI {
  bool shouldThrowError = false;
  // bool shouldThrowApiKeyError = false;
  // bool shouldThrowFailedToLoadRecipes = false;

  Future<List<Recipe>> searchRecipes(String query) async {
    if (shouldThrowError) {
      throw Exception('Failed to load recipes');
    }

    // Generate mock recipe data
    final mockData = [
      Recipe(
        uri: 'mock_uri_1',
        name: 'Pasta 1',
        image: 'pasta_image_1.jpg',
        source: 'Mock Source 1',
        url: 'https://mock-url-1.com',
        servings: 2.0,
        dietLabels: ['Diet Label 1', 'Diet Label 2'],
        healthLabels: ['Health Label 1', 'Health Label 2'],
        cautions: ['Cautions 1', 'Cautions 2'],
        ingredientLines: ['Ingredient 1', 'Ingredient 2'],
        calories: 200.0,
        totalWeight: 100.0,
        totalTime: 30.0,
        cuisineType: ['Cuisine Type 1', 'Cuisine Type 2'],
        mealType: ['Meal Type 1', 'Meal Type 2'],
        dishType: ['Dish Type 1', 'Dish Type 2'],
      ),
      Recipe(
        uri: 'mock_uri_2',
        name: 'Pasta 2',
        image: 'pasta_image_2.jpg',
        source: 'Mock Source 2',
        url: 'https://mock-url-2.com',
        servings: 4.0,
        dietLabels: ['Diet Label 3', 'Diet Label 4'],
        healthLabels: ['Health Label 3', 'Health Label 4'],
        cautions: ['Cautions 3', 'Cautions 4'],
        ingredientLines: ['Ingredient 3', 'Ingredient 4'],
        calories: 300.0,
        totalWeight: 150.0,
        totalTime: 45.0,
        cuisineType: ['Cuisine Type 3', 'Cuisine Type 4'],
        mealType: ['Meal Type 3', 'Meal Type 4'],
        dishType: ['Dish Type 3', 'Dish Type 4'],
      ),
    ];

    final matchingRecipes =
        mockData.where((recipe) => recipe.name.contains(query)).toList();

    // Delay the response by 500 milliseconds to simulate network latency
    await Future.delayed(const Duration(milliseconds: 500));

    return matchingRecipes;
  }
}
