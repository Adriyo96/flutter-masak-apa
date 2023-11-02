import 'package:dio/dio.dart';

class RecipeApi {
  static const String _baseUrl = 'https://api.edamam.com';
  static const String _appId = '10844a16';
  static const String _appKey = 'fab2a115c3a10e7e7385e08ec6919af2';

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      queryParameters: {
        'app_id': _appId,
        'app_key': _appKey,
      },
    ),
  );

  Future<List<dynamic>> searchRecipes(String query) async {
    try {
      final response = await _dio.get('/api/recipes/v2', queryParameters: {'q': query, 'type': 'public'});

      if (response.statusCode == 200) {
        final hits = response.data['hits'] as List<dynamic>;
        return hits.map((hit) => hit['recipe']).toList();
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<List<dynamic>> recipesByCategory(String category) async {
    try {
      final response = await _dio.get('/api/recipes/v2', queryParameters: {'mealType': category, 'type': 'public', 'random': 'true'});

      if (response.statusCode == 200) {
        final hits = response.data['hits'] as List<dynamic>;
        return hits.map((hit) => hit['recipe']).toList();
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<List<dynamic>> mainCourseRecipes() async {
    try {
      final response = await _dio.get('/api/recipes/v2', queryParameters: {'dishType': 'Main course', 'type': 'public', 'random': 'true'});

      if (response.statusCode == 200) {
        final hits = response.data['hits'] as List<dynamic>;
        return hits.map((hit) => hit['recipe']).toList();
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }
}
