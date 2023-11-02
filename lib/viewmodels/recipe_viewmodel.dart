import 'package:flutter/foundation.dart';
import 'package:masak_apa/models/recipe.dart';
import 'package:masak_apa/services/recipe_api.dart';

class RecipesViewModel extends ChangeNotifier {
  final RecipeApi _recipeApi = RecipeApi();
  List<Recipe?> _recipes = [];
  bool _isLoading = false;
  bool _isSearch = false;
  String _errorMessage = '';

  List<Recipe?> get recipes => _recipes;
  bool get isLoading => _isLoading;
  bool get isSearch => _isSearch;
  String get errorMessage => _errorMessage;

  Future<void> mainCourseRecipes() async {
    try {
      _isLoading = true;
      _errorMessage = '';
      notifyListeners();

      final recipeDataList = await _recipeApi.mainCourseRecipes();

      _recipes = recipeDataList.map((recipeData) {
        try {
          final recipe = Recipe.fromJson(recipeData);
          return recipe;
        } catch (e) {
          print('Error mapping recipe: $e');
          return null;
        }
      }).toList();

      _isLoading = false;
      _isSearch = false;
      _errorMessage = '';
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _errorMessage = 'Failed to get recipes: $error';
      notifyListeners();
    }
  }

  Future<void> searchRecipes(String query) async {
    try {
      _isLoading = true;
      _errorMessage = '';
      notifyListeners();

      final recipeDataList = await _recipeApi.searchRecipes(query);

      _recipes = recipeDataList.map((recipeData) {
        try {
          final recipe = Recipe.fromJson(recipeData);
          return recipe;
        } catch (e) {
          print('Error mapping recipe: $e');
          return null;
        }
      }).toList();

      _isLoading = false;
      _isSearch = true;
      if (query.isEmpty) {
        _isSearch = false;
      }
      _errorMessage = '';
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _errorMessage = 'Failed to search recipes: $error';
      notifyListeners();
    }
  }

  Future<void> recipesByCategory(String category) async {
    try {
      _isLoading = true;
      _errorMessage = '';
      notifyListeners();

      final recipeDataList = await _recipeApi.recipesByCategory(category);

      _recipes = recipeDataList.map((recipeData) {
        try {
          final recipe = Recipe.fromJson(recipeData);
          return recipe;
        } catch (e) {
          print('Error mapping recipe: $e');
          return null;
        }
      }).toList();

      _isLoading = false;
      _errorMessage = '';
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _errorMessage = 'Failed to get recipes: $error';
      notifyListeners();
    }
  }
}
