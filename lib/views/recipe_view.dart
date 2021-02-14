import 'package:flutter/material.dart';
import 'package:recipe_app/components/bg.dart';
import 'package:recipe_app/components/brand_name.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeView extends StatelessWidget {
  final String recipeUrl;

  RecipeView({@required this.recipeUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PrimaryBg(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: BrandName()),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 90,
                    padding: EdgeInsets.all(8),
                    child: WebView(
                      initialUrl: recipeUrl.replaceFirst("http:", "https:"),
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
