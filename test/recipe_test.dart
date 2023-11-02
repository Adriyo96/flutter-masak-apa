import 'package:flutter_test/flutter_test.dart';
import 'mock_api.dart';
import 'mock_search_viewmodel.dart';

void main() {
  group('SearchViewModel', () {
    late MockAPI mockApi;
    late MockSearchViewModel mockSearchViewModel;

    setUp(() {
      mockApi = MockAPI();
      mockSearchViewModel = MockSearchViewModel(mockApi: mockApi);
    });

    tearDown(() {
      mockSearchViewModel.isLoading = false;
      mockSearchViewModel.errorMessage = '';
    });

    test('searchRecipes should return matching recipe data (Pasta 1 & 2) for a given query (Pasta)', () async {
      // Arrange
      const query = 'Pasta';
      final expectedRecipes = await mockApi.searchRecipes(query);

      // Act
      final recipes = await mockSearchViewModel.searchRecipes(query);

      // Assert
      expect(recipes.length, expectedRecipes.length);
      for (var i = 0; i < recipes.length; i++) {
        final expectedRecipe = expectedRecipes[i];
        final recipe = recipes[i];

        expect(recipe.uri, expectedRecipe.uri);
        expect(recipe.name, expectedRecipe.name);
        expect(recipe.image, expectedRecipe.image);
        expect(recipe.source, expectedRecipe.source);
        expect(recipe.url, expectedRecipe.url);
        expect(recipe.servings, expectedRecipe.servings);
        expect(recipe.dietLabels, expectedRecipe.dietLabels);
        expect(recipe.healthLabels, expectedRecipe.healthLabels);
        expect(recipe.cautions, expectedRecipe.cautions);
        expect(recipe.ingredientLines, expectedRecipe.ingredientLines);
        expect(recipe.calories, expectedRecipe.calories);
        expect(recipe.totalWeight, expectedRecipe.totalWeight);
        expect(recipe.totalTime, expectedRecipe.totalTime);
        expect(recipe.cuisineType, expectedRecipe.cuisineType);
        expect(recipe.mealType, expectedRecipe.mealType);
        expect(recipe.dishType, expectedRecipe.dishType);
      }
    });

    test('searchRecipes should return an empty list when no matching recipe data is found', () async {
      // Arrange
      const query = 'Cake';

      // Act
      final recipes = await mockSearchViewModel.searchRecipes(query);

      // Assert
      expect(recipes, isEmpty);
      expect(mockSearchViewModel.isLoading, false);
      expect(mockSearchViewModel.errorMessage, isEmpty);
    });

    test('searchRecipes should handle API error and display error message', () async {
      // Arrange
      mockApi.shouldThrowError = true;
      const query = 'query';

      // Act and Assert
      try {
        await mockSearchViewModel.searchRecipes(query);
        fail('Exception should have been thrown');
      } catch (error) {
        expect(mockSearchViewModel.isLoading, false);
        expect(mockSearchViewModel.errorMessage, startsWith('Failed to search recipes'));
      }
    });
  });
}
