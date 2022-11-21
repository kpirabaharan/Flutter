import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryID;
  final String categoryTitle;

  CategoryMealsScreen({required this.categoryID, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('The Recipes For The Category!'),
      ),
    );
  }
}
