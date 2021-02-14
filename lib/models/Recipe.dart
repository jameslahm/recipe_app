import 'dart:isolate';

class Recipe {
  final String image;
  final String url;
  final String source;
  final String label;

  Recipe({this.image, this.url, this.source, this.label});

  factory Recipe.fromMap(Map<String, dynamic> recipeJson) {
    return Recipe(
        image: recipeJson["image"],
        url: recipeJson["url"],
        source: recipeJson["source"],
        label: recipeJson["label"]);
  }
}
