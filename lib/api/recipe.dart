import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/models/Recipe.dart';
import 'package:recipe_app/utils/constant.dart';

const API_BASE_URL = "https://api.edamam.com/";

Future<List<Recipe>> getRecipes({String q}) async {
  return await http
      .get("${API_BASE_URL}search?q=$q&app_id=$APP_ID&app_key=$APP_KEY")
      .then((value) {
    Map<String, dynamic> recipesJson = jsonDecode(value.body);
    List<Recipe> recipes = recipesJson["hits"].map<Recipe>((recipe) {
      return Recipe.fromMap(recipe["recipe"]);
    }).toList();
    return recipes;
  });
}
