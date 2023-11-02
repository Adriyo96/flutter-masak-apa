import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:masak_apa/viewmodels/recipe_viewmodel.dart';
import 'package:masak_apa/views/components/recipe_card.dart';

class CategoryRecipesScreen extends StatelessWidget {
  final String category;

  CategoryRecipesScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final recipesViewModel =
        Provider.of<RecipesViewModel>(context, listen: false);
    final categoryRecipes = recipesViewModel.recipes;
    recipesViewModel.recipesByCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<RecipesViewModel>(
              builder: (context, searchViewModel, _) {
                if (recipesViewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (categoryRecipes.isEmpty) {
                  return const Center(child: Text('No results found.'));
                }

                return ListView.builder(
                  itemCount: categoryRecipes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final recipe = categoryRecipes[index];
                    return RecipeCard(recipe: recipe);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
