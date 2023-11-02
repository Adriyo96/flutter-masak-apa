import 'package:flutter/material.dart';
import 'category_recipes_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  
  @override
  Widget build(BuildContext context) {

    return GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: [
            Padding(padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryRecipesScreen(category: 'Breakfast',),
                    ),
                  );
                },
                child: Container(
                  child: const Center(child: Text('Breakfast', textAlign: TextAlign.center,)),
                  color: Colors.orange,
                ),
              )
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryRecipesScreen(category: 'Lunch',),
                    ),
                  );
                },
                child: Container(
                  child: const Center(child: Text('Lunch', textAlign: TextAlign.center,)),
                  color: Colors.orange,
                ),
              )
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryRecipesScreen(category: 'Dinner',),
                    ),
                  );
                },
                child: Container(
                  child: const Center(child: Text('Dinner', textAlign: TextAlign.center,)),
                  color: Colors.orange,
                ),
              )
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryRecipesScreen(category: 'Snack',),
                    ),
                  );
                },
                child: Container(
                  child: const Center(child: Text('Snack', textAlign: TextAlign.center,)),
                  color: Colors.orange,
                ),
              )
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryRecipesScreen(category: 'Teatime',),
                    ),
                  );
                },
                child: Container(
                  child: const Center(child: Text('Teatime', textAlign: TextAlign.center,)),
                  color: Colors.orange,
                ),
              )
            ),
          ]
    );
  }
}