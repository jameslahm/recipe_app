import 'package:flutter/material.dart';
import 'package:recipe_app/api/recipe.dart';
import 'package:recipe_app/components/bg.dart';
import 'package:recipe_app/components/brand_name.dart';
import 'package:recipe_app/models/Recipe.dart';
import 'package:recipe_app/components/recipe_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Recipe> recipes;
  TextEditingController _searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PrimaryBg(),
          SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BrandName(),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "What will you cook today?",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Overpass"),
                    ),
                    Text(
                      "Just Enter ingredients you have and we will show"
                      "the best recipes for you",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: "Overpass"),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Enter Ingredients",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.5),
                                      fontFamily: "Overpass"),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () {
                              if (_searchController.text.isNotEmpty) {
                                getRecipes(q: _searchController.text)
                                    .then((value) {
                                  setState(() {
                                    recipes = value;
                                  });
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xffa2834d),
                                      Color(0xfffbc9a5f)
                                    ],
                                    begin: FractionalOffset.topRight,
                                    end: FractionalOffset.bottomLeft),
                              ),
                              child: Icon(
                                Icons.search,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 10.0, maxCrossAxisExtent: 200.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        children:
                            List.generate((recipes ?? []).length, (index) {
                          return GridTile(
                            child: RecipeTile(
                              recipe: recipes[index],
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
