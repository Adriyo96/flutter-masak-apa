import 'package:masak_apa/models/recipe.dart';
import 'mock_api.dart';

class MockSearchViewModel {
  final MockAPI mockApi;
  bool isLoading = false;
  String errorMessage = '';

  MockSearchViewModel({required this.mockApi});

  Future<List<Recipe>> searchRecipes(String query) async {
    isLoading = true;
    errorMessage = '';
    try {
      final recipes = await _getMatchingRecipes(query);
      isLoading = false;
      return recipes;
    } catch (error) {
      isLoading = false;
      errorMessage = 'Failed to search recipes: $error';
      throw Exception(errorMessage);
    }
  }

  Future<List<Recipe>> _getMatchingRecipes(String query) async {
    try {
      final allRecipes = await mockApi.searchRecipes(query);
      final matchingRecipes =
          allRecipes.where((recipe) => recipe.name.contains(query)).toList();
      return matchingRecipes;
    } catch (error) {
      throw Exception('Failed to load recipes: $error');
    }
  }
}
