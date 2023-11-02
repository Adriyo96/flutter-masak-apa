import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:masak_apa/viewmodels/recipe_viewmodel.dart';
import 'package:masak_apa/views/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RecipesViewModel>(
            create: (_) => RecipesViewModel()),
      ],
      child: MaterialApp(
        title: 'My Recipes App',
        theme: ThemeData(
          textTheme: GoogleFonts.alataTextTheme(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
              .copyWith(secondary: Colors.red.shade200),
        ),
        home: const Home(),
      ),
    );
  }
}
