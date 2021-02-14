import 'package:flutter/material.dart';
import 'package:recipe_app/models/Recipe.dart';
import 'package:recipe_app/views/recipe_view.dart';

class RecipeTile extends StatelessWidget {
  final Recipe recipe;

  RecipeTile({@required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return RecipeView(
              recipeUrl: recipe.url,
            );
          }));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Stack(
            children: [
              Image.network(
                recipe.image,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              Container(
                width: 200,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white30, Colors.white],
                        begin: FractionalOffset.centerRight,
                        end: FractionalOffset.centerLeft)),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.label,
                        style: TextStyle(
                            color: Colors.black54, fontFamily: "Overpass"),
                      ),
                      Text(
                        recipe.source,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                            fontFamily: "Overpass"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
