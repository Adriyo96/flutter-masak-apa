import 'package:flutter/material.dart';
import 'package:masak_apa/views/category_screen.dart';
import 'package:masak_apa/views/recipe_search_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return RecipeSearchScreen();
      case 1:
        return CategoryScreen();
      default:
        return const Text('Page not found.');
    }
  }

  List<String> titleList = ["MasakApa?", "Category"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(titleList[_currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) {
          if (mounted) {
            setState(() {
              _currentIndex = value;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
        ],
      ),
      body: _getDrawerItemWidget(_currentIndex),
    );
  }
}
