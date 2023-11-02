class Recipe {
  String uri;
  String name;
  String image;
  String source;
  String url;
  double servings;
  List<String> dietLabels;
  List<String> healthLabels;
  List<String> cautions;
  List<String> ingredientLines;
  double calories;
  double totalWeight;
  double totalTime;
  List<String> cuisineType;
  List<String> mealType;
  List<String> dishType;

  Recipe({
    required this.uri,
    required this.name,
    required this.image,
    required this.source,
    required this.url,
    required this.servings,
    required this.dietLabels,
    required this.healthLabels,
    required this.cautions,
    required this.ingredientLines,
    required this.calories,
    required this.totalWeight,
    required this.totalTime,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      uri: json['uri'],
      name: json['label'],
      image: json['image'],
      source: json['source'],
      url: json['url'],
      servings: json['yield'].toDouble(),
      dietLabels: List<String>.from(json['dietLabels'] ?? []),
      healthLabels: List<String>.from(json['healthLabels'] ?? []),
      cautions: List<String>.from(json['cautions'] ?? []),
      ingredientLines: List<String>.from(json['ingredientLines'] ?? []),
      calories: json['calories'].toDouble(),
      totalWeight: json['totalWeight'].toDouble(),
      totalTime: json['totalTime'].toDouble(),
      cuisineType: List<String>.from(json['cuisineType'] ?? []),
      mealType: List<String>.from(json['mealType'] ?? []),
      dishType: List<String>.from(json['dishType'] ?? []),
    );
  }
}


