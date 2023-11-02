import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:masak_apa/viewmodels/recipe_viewmodel.dart';
import 'package:masak_apa/views/components/recipe_card.dart';

class RecipeSearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  RecipeSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchViewModel =
        Provider.of<RecipesViewModel>(context, listen: false);
    searchViewModel.mainCourseRecipes();
    var searchResults = searchViewModel.recipes;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: const TextStyle(fontSize: 18.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  final query = _searchController.text;
                  searchViewModel.searchRecipes(query);
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Consumer<RecipesViewModel>(
            builder: (context, searchViewModel, _) {
              if (searchViewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              searchResults = searchViewModel.recipes;
              if (searchResults.isEmpty && searchViewModel.isSearch) {
                return const Center(child: Text('No results found.'));
              } else if (searchViewModel.isSearch == false &&
                  searchResults.isEmpty) {
                searchViewModel.mainCourseRecipes();
                searchResults = searchViewModel.recipes;
              }

              return ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (BuildContext context, int index) {
                  final recipe = searchResults[index];
                  return RecipeCard(recipe: recipe);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
