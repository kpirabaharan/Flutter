import 'package:flutter/material.dart';

import './models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryID;
  // final String categoryTitle;

  // CategoryMealsScreen({required this.categoryID, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs.title),
      ),
      body: Center(
        child: Text('The Recipes For The Category!'),
      ),
    );
  }
}
